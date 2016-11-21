package optimizer;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class Optimizer {
  private ASMCodeFragment fragment;
  
  public static ASMCodeFragment optimize(ASMCodeFragment fragment) {
    CodeModifier codeModifier = new CodeModifier();
    BasicBlockManager basicBlockManager = new BasicBlockManager(); 
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    ASMCodeChunk header;
    
    header = codeModifier.separateOutDataDirectives(fragment);
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
