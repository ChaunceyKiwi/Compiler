package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import java.util.List;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.ArrayType;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeVariable;

public class StringHelper {
  public static ASMCodeFragment stringCreation(int lengthOfString, Labeller labeller) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    String beginLabel = labeller.newLabel("string-creation-begin");
    String getLengthLabel = labeller.newLabel("string-creation-get-length");
    String sizeLabel = labeller.newLabel("string-creation-size");
    String typeLabel = labeller.newLabel("string-creation-type");
    String statusLabel = labeller.newLabel("string-creation-status");
    String lengthLabel = labeller.newLabel("string-creation-length");
    String endLabel = labeller.newLabel("string-creation-end");

    code.add(Label, beginLabel);
    code.add(Label, getLengthLabel);

    // Length of array cannot be negative
    code.add(PushI, lengthOfString);
    code.add(Duplicate);
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

    // add type identifier of array
    // The type identifier for a string is the integer 6
    code.add(Label, typeLabel);
    code.add(Duplicate);
    code.add(PushI, 6);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // add status of string
    // Status header is 1001 = 9.
    code.add(Label, statusLabel);
    code.add(Duplicate);
    code.add(PushI, 9);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // add length of array
    code.add(Label, lengthLabel);
    code.add(Duplicate);
    code.add(PushI, lengthOfString);
    code.add(Exchange);
    Macros.writeIOffset(code, 8);

    code.add(Label, endLabel);
    return code;
  }

  public static ASMCodeFragment stringInitialization(List<Character> arrayElement,
      Labeller labeller) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    int headerSize = 12;
    String beginLabel = labeller.newLabel("string-initialization-begin");
    String endLabel = labeller.newLabel("string-initialization-end");

    code.add(Label, beginLabel);
    for (int i = 0; i < arrayElement.size(); i++) {
      code.add(Duplicate);
      code.add(PushI, arrayElement.get(i));
      code.add(Exchange);
      code.add(PushI, headerSize + i);
      code.add(Add);
      code.add(Exchange);
      code.add(StoreI);
    }
    code.add(Label, endLabel);

    return code;
  }


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

    // // add type identifier of array
    // code.add(Label, typeLabel);
    // code.add(Duplicate);
    // code.add(PushI, arrayType.getTypeIdentifier());
    // code.add(Exchange);
    // Macros.writeIOffset(code, 0);
    //
    // // add status of array
    // code.add(Label, statusLabel);
    // code.add(Duplicate);
    // code.add(PushI, arrayType.getStatus());
    // code.add(Exchange);
    // Macros.writeIOffset(code, 4);
    //
    // // add subtype size of array
    // code.add(Label, subTypeSize);
    // code.add(Duplicate);
    // code.add(PushI, arrayType.getSubType().getSize());
    // code.add(Exchange);
    // Macros.writeIOffset(code, 8);

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

  public static ASMCodeFragment stringPrint() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    Labeller labeller = new Labeller("-print-string-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");

    code.add(Label, beginLabel);
    // get the address of the array
    code.add(Duplicate);

    // store the length of array as the loop counter
    code.append(pushStringLength(labeller.newLabel("-push-string-length")));
    Macros.storeITo(code, ASMCodeGenerator.regCounter);

    // get the address of first element
    code.add(PushI, 12);
    code.add(Add);

    code.add(Label, loopBeginLabel);
    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(JumpFalse, loopEndLabel);

    code.add(Duplicate);
    code.add(PushI, 1);
    code.add(Add);
    code.add(Exchange);
    code.add(LoadI);

    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);
    code.add(Exchange);

    String format = PrintStatementGenerator.printFormat(PrimitiveType.CHARACTER);
    code.add(PushD, format);
    code.add(Printf);

    Macros.storeITo(code, ASMCodeGenerator.regCounter);

    // Decrement the counter by 1
    Macros.decrementInteger(code, ASMCodeGenerator.regCounter);

    code.add(Jump, loopBeginLabel);
    code.add(Label, loopEndLabel);
    code.add(Pop);
    code.add(Label, endLabel);

    return code;
  }
}
