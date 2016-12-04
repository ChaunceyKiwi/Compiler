package optimizer;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;
import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class Optimizer {
  private ASMCodeFragment fragment;
  
  public static ASMCodeFragment optimize(ASMCodeFragment fragment) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    BasicHeaderManager basicHeaderManager = new BasicHeaderManager(); 
    BasicBlockManager basicBlockManager = new BasicBlockManager(); 
    
    ASMCodeFragment header = basicHeaderManager.separateOutDataDirectives(fragment);
    basicBlockManager.generateBasicBlocks(fragment);
    basicHeaderManager.generateBasicHeaders(header, basicBlockManager.getPushDSet());
    
    code.append(basicHeaderManager.printAllChunksInBasicHeaders());
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
