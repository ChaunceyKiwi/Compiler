package optimizer;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;

import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class Optimizer {
  private ASMCodeFragment fragment;
  private static BasicBlockManager basicBlockManager = new BasicBlockManager();

  public static ASMCodeFragment optimize(ASMCodeFragment fragment) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    basicBlockManager.generateBasicBlocks(fragment);
    code.append(basicBlockManager.printAllChunksInBasicBlocks());
    return code;
  }

  public Optimizer(ASMCodeFragment fragment) {
    this.fragment = fragment;
  }

  public ASMCodeFragment optimize() {
    return fragment;
  }
}
