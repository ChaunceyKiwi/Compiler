package optimizer;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMInstruction;
import asmCodeGenerator.codeStorage.ASMOpcode;

public class CodeModifier {
  public CodeModifier() {}

  public ASMCodeChunk separateOutDataDirectives(ASMCodeFragment fragment) {
    // Put all data directives at the front of the output code
    ASMCodeChunk head = new ASMCodeChunk();
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.DLabel
            || instruction.getOpcode() == ASMOpcode.DataC
            || instruction.getOpcode() == ASMOpcode.DataI
            || instruction.getOpcode() == ASMOpcode.DataF
            || instruction.getOpcode() == ASMOpcode.DataS
            || instruction.getOpcode() == ASMOpcode.DataZ
            || instruction.getOpcode() == ASMOpcode.DataD
            || instruction.getOpcode() == ASMOpcode.PStack) {
          fragment.chunks.get(i).instructions.remove(j--);
          head.instructions.add(instruction);
        }
      }
    }
    return head;
  }
}
