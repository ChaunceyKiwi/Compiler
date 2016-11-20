package optimizer;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class Optimizer {
  private ASMCodeFragment fragment;
  private static BasicBlockManager basicBlockManager = new BasicBlockManager();
  private static CodeModifier codeModifier = new CodeModifier();

  
  public static ASMCodeFragment optimize(ASMCodeFragment fragment) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    ASMCodeChunk header = codeModifier.separateOutDataDirectives(fragment);
    basicBlockManager.generateBasicBlocks(fragment);
    code.chunks.add(header);
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
