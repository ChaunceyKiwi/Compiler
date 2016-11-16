package optimizer;

import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class Optimizer {
	private ASMCodeFragment fragment;
	//private static BasicBlockManager basicBlockManager = new BasicBlockManager();

	public static ASMCodeFragment optimize(ASMCodeFragment fragment) {
		//basicBlockManager.generateBasicBlocks(fragment);
		return fragment;
	}
	
	public Optimizer(ASMCodeFragment fragment) {
		this.fragment = fragment;
	}
	
	public ASMCodeFragment optimize() {
		return fragment;
	}
}
