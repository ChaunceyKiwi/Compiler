package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.ArrayType;

public class StringHelper {

  public static ASMCodeFragment subStringInRange(ASMCodeFragment stringAddress,
      ASMCodeFragment indexStart, ASMCodeFragment indexEnd, Labeller labeller, String reg1) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    String newStringLabel = labeller.newLabel("string-creation");
    String beginLabel = labeller.newLabel("string-creation-begin");
    String getLengthLabel = labeller.newLabel("string-creation-get-length");
    String sizeLabel = labeller.newLabel("string-creation-size");
    String typeLabel = labeller.newLabel("string-creation-type");
    String statusLabel = labeller.newLabel("string-creation-status");
    String subTypeSize = labeller.newLabel("string-creation-subtype-size");
    String lengthLabel = labeller.newLabel("string-creation-length");
    String endLabel = labeller.newLabel("string-creation-end");

    code.add(Label, beginLabel);
    code.add(Label, getLengthLabel);

    // Length of array cannot be negative    
    code.append(indexEnd);
    code.append(indexStart);
    code.add(Subtract);
    code.add(Duplicate);
    code.add(Duplicate);
    Macros.storeITo(code, reg1);
    code.add(JumpNeg, RunTime.ARRAY_SIZE_NEGATIVE_ERROR);

    // Get the size of whole array including header and element
    // Subtype is character with size as 1
    // Header size is 12 for string
    code.add(Label, sizeLabel);
    code.add(PushI, 1);
    code.add(Multiply);
    code.add(PushI, 12);
    code.add(Add);
    
    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

//    // add type identifier of array
//    code.add(Label, typeLabel);
//    code.add(Duplicate);
//    code.add(PushI, arrayType.getTypeIdentifier());
//    code.add(Exchange);
//    Macros.writeIOffset(code, 0);
//
//    // add status of array
//    code.add(Label, statusLabel);
//    code.add(Duplicate);
//    code.add(PushI, arrayType.getStatus());
//    code.add(Exchange);
//    Macros.writeIOffset(code, 4);
//
//    // add subtype size of array
//    code.add(Label, subTypeSize);
//    code.add(Duplicate);
//    code.add(PushI, arrayType.getSubType().getSize());
//    code.add(Exchange);
//    Macros.writeIOffset(code, 8);

    // add length of array
    code.add(Label, lengthLabel);
    code.add(Duplicate);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Exchange);
    Macros.writeIOffset(code, 12);

    code.add(Label, endLabel);
    return code;
  }

  public static ASMCodeFragment stringElementAtIndex(ASMCodeFragment stringAddress,
      ASMCodeFragment index, Labeller labeller, String memoryPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    String beginLabel = labeller.newLabel("string-index-begin");
    String beginFetchingLabel = labeller.newLabel("string-index-fetching-begin");
    String endFetchingLabel = labeller.newLabel("string-index-fetching-end");
    String endLabel = labeller.newLabel("string-index-end");

    code.add(Label, beginLabel);
    code.append(stringAddress);
    code.add(Duplicate);

    // store array index in memory pointer
    code.append(index);
    code.add(Duplicate);
    Macros.storeITo(code, memoryPointer);

    // negative index check
    code.add(Duplicate);
    code.add(JumpNeg, RunTime.ARRAY_INDEX_NEGATIVE_ERROR);

    // index boundry check
    code.add(Exchange);
    code.append(pushStringLength(labeller.newLabel("string-length")));
    code.add(Exchange);
    code.add(Subtract);
    code.add(JumpPos, beginFetchingLabel);
    code.add(Jump, RunTime.ARRAY_INDEX_EXCEED_BOUND_ERROR);
    code.add(Label, beginFetchingLabel);

    // get the address of first element
    // add header size = 12
    code.add(PushI, 12);
    code.add(Add);

    // get the address offset to that element
    // The subtype is character, thus the size for subtype is 1
    code.add(PushD, memoryPointer);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Multiply);

    // return the address of ith element of original string
    code.add(Add);

    code.add(Label, endFetchingLabel);
    code.add(Label, endLabel);
    return code;
  }

  public static ASMCodeFragment pushStringLength(String label) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    code.add(Label, label);
    Macros.readIOffset(code, 8);
    return code;
  }
}
