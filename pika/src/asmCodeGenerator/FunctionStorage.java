package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class FunctionStorage {
	public static ASMCodeFragment GCDCalculation(String funcLabel,String reg1, String reg2){
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		Labeller labeller = new Labeller("-GCD-Calculation-");
		String beginLabel = labeller.newLabel("-function-begin-");
		String endLabel = labeller.newLabel("-function-end-");
		String loopStartLabel = labeller.newLabel("-loop-begin-");
		String loopEndLabel = labeller.newLabel("-loop-end-");
		String positiveCaseLabel = labeller.newLabel("-positive-case-");
		String notPositiveCaseLabel = labeller.newLabel("-not-positive-case-");
		String joinLabel = labeller.newLabel("-join-");
		
		code.add(Label, funcLabel);
		code.add(Label, beginLabel);
		code.add(Label, loopStartLabel);
		code.add(PushD, reg1);
		code.add(LoadI);
		code.add(Duplicate);
		code.add(JumpFalse, loopEndLabel);
		code.add(PushD, reg2);
		code.add(LoadI);
		code.add(Duplicate);
		code.add(JumpFalse, loopEndLabel);
		code.add(Subtract);
		code.add(JumpPos, positiveCaseLabel);
		code.add(Label, notPositiveCaseLabel);
		code.add(PushD, reg2);
		code.add(LoadI);
		code.add(PushD, reg1);
		code.add(LoadI);
		code.add(Subtract);
		code.add(PushD, reg2);
		code.add(Exchange);
		code.add(StoreI);
		code.add(Jump, joinLabel);
		code.add(Label, positiveCaseLabel);
		code.add(PushD, reg1);
		code.add(LoadI);
		code.add(PushD, reg2);
		code.add(LoadI);
		code.add(Subtract);
		code.add(PushD, reg1);
		code.add(Exchange);
		code.add(StoreI);
		code.add(Jump, joinLabel);
		code.add(Label, joinLabel);
		code.add(Jump, loopStartLabel);
		code.add(Label, loopEndLabel);
		code.add(Add);
		code.add(Exchange);
		code.add(Return);
		code.add(Label, endLabel);	
		
		return code;
	}
}
