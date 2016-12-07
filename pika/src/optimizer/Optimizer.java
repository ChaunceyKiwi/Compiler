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
    fragment = repeatedlyFoldCode(fragment);
    basicBlockManager.generateBasicBlocks(fragment);
    basicHeaderManager.generateBasicHeaders(header, basicBlockManager.getPushDSet());
    
    code.append(header);
    code.append(fragment);
    return code;
  }

  public Optimizer(ASMCodeFragment fragment) {
    this.fragment = fragment;
  }

  public ASMCodeFragment optimize() {
    return fragment;
  }
  
  public static ASMCodeFragment repeatedlyFoldCode(ASMCodeFragment originalCode) {
    ASMCodeFragment newCode; 

    // Repeat until there is no change
    while (true) {
      CodeFolder codeFolder = new CodeFolder();
      newCode = codeFolder.foldCode(originalCode);
      if (sizeInInstructionIsEqual(originalCode, newCode)) {
        break;
      } else {
        originalCode = newCode;
      }
    }
    
    return newCode;
  }
  
  public static boolean sizeInInstructionIsEqual(ASMCodeFragment originalCode, ASMCodeFragment newCode) {
    int lineCountOfOriginalCode = 0;
    int lineCountOfNewCode = 0;
    
    for (int i = 0; i < originalCode.chunks.size(); i++) {
      for (int j = 0; j < originalCode.chunks.get(i).instructions.size(); j++) {
        lineCountOfOriginalCode++;
      }
    }
    
    for (int i = 0; i < newCode.chunks.size(); i++) {
      for (int j = 0; j < newCode.chunks.get(i).instructions.size(); j++) {
        lineCountOfNewCode++;
      }
    }

    return lineCountOfOriginalCode == lineCountOfNewCode;
  }
}
