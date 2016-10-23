package asmCodeGenerator;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.ArrayType;
import java.util.List;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class ArrayBuilder {
	
	public static ASMCodeFragment arrayCreation(ArrayType arrayType, 
			ASMCodeFragment lengthOfArray, Labeller labeller){
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		String beginLabel = labeller.newLabel("array-creation-begin");
		String getLengthLabel = labeller.newLabel("array-creation-get-length");
		String sizeLabel = labeller.newLabel("array-creation-size");
		String typeLabel = labeller.newLabel("array-creation-type");
		String statusLabel = labeller.newLabel("array-creation-status");
		String subTypeSize = labeller.newLabel("array-creation-subtype-size");
		String lengthLabel = labeller.newLabel("array-creation-length");
		String endLabel = labeller.newLabel("array-creation-end");
		
		code.add(Label, beginLabel);
		code.add(Label, getLengthLabel);
		
		// Length of array cannot be negative
		code.append(lengthOfArray);
		code.add(Duplicate);
		code.add(JumpNeg, RunTime.ARRAY_SIZE_NEGATIVE_ERROR);
		
		// Get the size of whole array including header and element
		code.add(Label, sizeLabel);
		code.add(PushI, arrayType.getSubType().getSize());
		code.add(Multiply);
		code.add(PushI, ArrayType.header_size);
		code.add(Add);
		
		// call the memory manager to get address allocated
		code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
		
		// add type identifier of array
		code.add(Label, typeLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getTypeIdentifier());
		code.add(Exchange);
		Macros.writeIOffset(code, 0);
		
		// add status of array
		code.add(Label, statusLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getStatus());
		code.add(Exchange);
		Macros.writeIOffset(code, 4);
		
		// add subtype size of array
		code.add(Label, subTypeSize);
		code.add(Duplicate);
		code.add(PushI, arrayType.getSubType().getSize());
		code.add(Exchange);
		Macros.writeIOffset(code, 8);
		
		// add length of array
		code.add(Label, lengthLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getLength());
		code.add(Exchange);
		Macros.writeIOffset(code, 12);
		
		code.add(Label, endLabel);
		return code;
	}
	
	public static ASMCodeFragment arrayInitialization(ArrayType arrayType,
			List<ASMCodeFragment> arrayElement, ASMOpcode op, Labeller labeller){
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		int subTypeSize = arrayType.getSubType().getSize();
		int headerSize = arrayType.getHeaderSize();
		String beginLabel = labeller.newLabel("array-initialization-begin");
		String endLabel = labeller.newLabel("array-initialization-end");
		
		code.add(Label, beginLabel);
		for(int i = 0; i < arrayElement.size(); i++){
			code.add(Duplicate);
			code.append(arrayElement.get(i));
			code.add(Exchange);
			code.add(PushI, headerSize + subTypeSize * i);
			code.add(Add);
			code.add(Exchange);
			code.add(op);
		}
		code.add(Label, endLabel);
		
		return code;
	}
	
	public static ASMCodeFragment pushArrayLength(Labeller labeller){
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		String getLengthLabel = labeller.newLabel("get-length");
		
		code.add(Label, getLengthLabel);
		Macros.readIOffset(code, 12);
		
		return code;
	}
}
