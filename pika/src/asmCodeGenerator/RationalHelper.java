package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;


import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.MemoryManager;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class RationalHelper {
	public static ASMCodeFragment performOverPuntuator(ASMCodeFragment arg1, ASMCodeFragment arg2,
			String GCDCalculation, String reg1ForFunction, String reg2ForFunction, 
			String reg1, String reg2){
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

		// Treat a rational number as an array with 2 elements
		Labeller labeller = new Labeller("rational-number");		
		String beginLabel = labeller.newLabel("rational-creation-begin");
		String endLabel = labeller.newLabel("rational-creation-end");
		String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
		String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
		
		code.add(Label, beginLabel);

		// store abs(num1) in reg1
		code.add(PushD, reg1ForFunction);
		ArrayBuilder.appendCodeFragment(code, arg1);
		code.add(Duplicate);
		Macros.storeITo(code, reg1);
		code.add(Duplicate);
		code.add(JumpPos, getAbsForArg1);
		code.add(Negate);
		code.add(Label, getAbsForArg1);
		code.add(StoreI);
		
		// store abs(num2) in reg2
		code.add(PushD, reg2ForFunction);
		ArrayBuilder.appendCodeFragment(code, arg2);
		code.add(Duplicate);
		Macros.storeITo(code, reg2);
		code.add(Duplicate);
		code.add(JumpPos, getAbsForArg2);
		code.add(Negate);
		code.add(Label, getAbsForArg2);
		code.add(StoreI);
		
		// Call function to get GCD and store it in reg1
		code.add(Call, GCDCalculation);
		code.add(PushD, reg1ForFunction);
		code.add(Exchange);
		code.add(StoreI);
		
		// Rational number needs 8 bytes 
		code.add(PushI, 8);
		
		// call the memory manager to get address allocated
		code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
		
		// Store first integer
		code.add(Duplicate);
		code.add(PushD, reg1);
		code.add(LoadI);
		code.add(PushD, reg1ForFunction);
		code.add(LoadI);
		code.add(Divide);
		code.add(Exchange);
		Macros.writeIOffset(code, 0);
		
		// Store second integer
		code.add(Duplicate);
		code.add(PushD, reg2);
		code.add(LoadI);	
		code.add(PushD, reg1ForFunction);
		code.add(LoadI);
		code.add(Divide);
		code.add(Exchange);
		Macros.writeIOffset(code, 4);
		code.add(Label, endLabel);			
		// leave the address of array on the accumulator
		
		return code;
	}
	
	public static ASMCodeFragment performExpressOverPunctuator(ASMCodeFragment arg1, ASMCodeFragment arg2, 
			Type type, String addressPointer) {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		
		if(type == PrimitiveType.FLOATING){
			ArrayBuilder.appendCodeFragment(code, arg1);
			ArrayBuilder.appendCodeFragment(code, arg2);
			code.add(ConvertF);
			code.add(FMultiply);
			code.add(ConvertI);
		}
		// [ (n//m)///(d) = int((n*d)/m) ]
		else if(type == PrimitiveType.RATIONAL){
			// store rational address
			ArrayBuilder.appendCodeFragment(code, arg1);
			Macros.storeITo(code, addressPointer);
			
			// get n*d
			ArrayBuilder.appendCodeFragment(code, arg2);
			code.add(PushD, addressPointer);
			code.add(LoadI);
			code.add(LoadI);
			code.add(Multiply);
			
			// get m
			code.add(PushD, addressPointer);
			code.add(LoadI);
			code.add(PushI, 4);
			code.add(Add);
			code.add(LoadI);
			
			// get int((n*d)/m)
			code.add(Divide);
		}
		return code;
	}
	
	public static ASMCodeFragment performRationalizePuntuator(ASMCodeFragment arg1, ASMCodeFragment arg2, 
			Type type, String GCDCalculation, String reg1ForFunction, String reg2ForFunction, 
			String reg1, String reg2, String reg3, String reg4){
		
		// Treat a rational number as an array with 2 elements
		Labeller labeller = new Labeller("-rationalize-");		
		String beginLabel = labeller.newLabel("rational-creation-begin");
		String endLabel = labeller.newLabel("rational-creation-end");
		String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
		String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		
		code.add(Label, beginLabel);
		
		if(type == PrimitiveType.FLOATING){
			ArrayBuilder.appendCodeFragment(code, arg1);
			ArrayBuilder.appendCodeFragment(code, arg2);
			code.add(Duplicate);
			Macros.storeITo(code, reg4);
			code.add(ConvertF);
			code.add(FMultiply);
			code.add(ConvertI);
		}
		// [ (n//m)///(d) = int((n*d)/m) ]
		else if(type == PrimitiveType.RATIONAL){
			// store rational address
			ArrayBuilder.appendCodeFragment(code, arg1);
			Macros.storeITo(code, reg3);

			// get n*d
			ArrayBuilder.appendCodeFragment(code, arg2);
			code.add(Duplicate);
			Macros.storeITo(code, reg4);
			code.add(PushD, reg3);
			code.add(LoadI);
			code.add(LoadI);
			code.add(Multiply);
			
			// get m
			code.add(PushD, reg3);
			code.add(LoadI);
			code.add(PushI, 4);
			code.add(Add);
			code.add(LoadI);
			
			// get int((n*d)/m)
			code.add(Divide);
		}
		
		Macros.storeITo(code, reg3);
		
		// store abs(num1) in reg1
		code.add(PushD, reg1ForFunction);
		code.add(PushD, reg3);
		code.add(LoadI);
		code.add(Duplicate);
		Macros.storeITo(code, reg1);
		code.add(Duplicate);
		code.add(JumpPos, getAbsForArg1);
		code.add(Negate);
		code.add(Label, getAbsForArg1);
		code.add(StoreI);
		
		// store abs(num2) in reg2
		code.add(PushD, reg2ForFunction);
		code.add(PushD, reg4);
		code.add(LoadI);
		code.add(Duplicate);
		Macros.storeITo(code, reg2);
		code.add(Duplicate);
		code.add(JumpPos, getAbsForArg2);
		code.add(Negate);
		code.add(Label, getAbsForArg2);
		code.add(StoreI);
		
		// Call function to get GCD and store it in reg1
		code.add(Call, GCDCalculation);
		code.add(PushD, reg1ForFunction);
		code.add(Exchange);
		code.add(StoreI);
		
		// Rational number needs 8 bytes 
		code.add(PushI, 8);
		
		// call the memory manager to get address allocated
		code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
		
		// Store first integer
		code.add(Duplicate);
		code.add(PushD, reg1);
		code.add(LoadI);
		code.add(PushD, reg1ForFunction);
		code.add(LoadI);
		code.add(Divide);
		code.add(Exchange);
		Macros.writeIOffset(code, 0);
		
		// Store second integer
		code.add(Duplicate);
		code.add(PushD, reg2);
		code.add(LoadI);	
		code.add(PushD, reg1ForFunction);
		code.add(LoadI);
		code.add(Divide);
		code.add(Exchange);
		Macros.writeIOffset(code, 4);
		code.add(Label, endLabel);			
		// leave the address of array on the accumulator
		
		return code;
		
	}
}
