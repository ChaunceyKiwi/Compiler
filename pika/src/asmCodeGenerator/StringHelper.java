package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import java.util.List;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.PrimitiveType;

public class StringHelper {
  public static ASMCodeFragment stringCreation(ASMCodeFragment length, Labeller labeller,
      String reg1) {

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
    code.append(length);
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
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Exchange);
    Macros.writeIOffset(code, 8);

    code.add(Label, endLabel);
    return code;
  }

  public static ASMCodeFragment stringInitialization(List<ASMCodeFragment> arrayElement,
      Labeller labeller) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    int headerSize = 12;
    String beginLabel = labeller.newLabel("string-initialization-begin");
    String endLabel = labeller.newLabel("string-initialization-end");

    code.add(Label, beginLabel);
    for (int i = 0; i < arrayElement.size(); i++) {
      code.add(Duplicate);
      code.append(arrayElement.get(i));
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
      ASMCodeFragment indexStart, ASMCodeFragment indexEnd, Labeller labeller, String counter,
      String originStringMemoryPointer, String newStringMemoryPointer,
      String indexStartPointer, String indexEndPointer) {

    String beginLabel = labeller.newLabel("string-range-copy-begin");
    String endLabel = labeller.newLabel("string-range-copy-end");
    String beginElementCopyLabel = labeller.newLabel("string-element-copy-begin");
    String endElementCopyLabel = labeller.newLabel("string-element-copy-end");

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    code.add(Label, beginLabel);
    
    // store indexStart in indexStartPointer
    code.append(indexStart);
    Macros.storeITo(code, indexStartPointer);

    // store indexEnd in indexEndPointer
    code.append(indexEnd);
    Macros.storeITo(code, indexEndPointer);

    // store original string in originStringMemoryPointer
    code.append(stringAddress);
    Macros.storeITo(code, originStringMemoryPointer);

    // start index shoud >= 0
    code.add(PushD, indexStartPointer);
    code.add(LoadI);
    code.add(JumpNeg, RunTime.ARRAY_INDEX_NEGATIVE_ERROR);

    // make sure end index <= length
    code.add(PushD, indexEndPointer);
    code.add(LoadI);
    code.add(PushD, originStringMemoryPointer);
    code.add(LoadI);
    code.append(pushStringLength());
    code.add(Subtract);
    code.add(JumpPos, RunTime.ARRAY_INDEX_EXCEED_BOUND_ERROR);

    // create an empty string to store values
    ASMCodeFragment length = new ASMCodeFragment(GENERATES_VALUE);
    length.add(PushD, indexEndPointer);
    length.add(LoadI);
    length.add(PushD, indexStartPointer);
    length.add(LoadI);
    length.add(Subtract);
    
    code.append(stringCreation(length, labeller, counter));
    code.add(Duplicate);

    // store new string in newStringMemoryPointer
    Macros.storeITo(code, newStringMemoryPointer);

    // store the length in the counter    
    code.add(PushD, indexEndPointer);
    code.add(LoadI);
    code.add(PushD, indexStartPointer);
    code.add(LoadI);
    code.add(Subtract);
    Macros.storeITo(code, counter);

    // move originArrayMemoryPointer to ith address of element
    // Should be arrayAddr + hedersize + 1 * startIndex
    code.add(PushD, originStringMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 12);
    code.add(Add);
    code.add(PushD, indexStartPointer);
    code.add(LoadI);
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to address of first element to store
    code.add(PushD, newStringMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 12);
    code.add(Add);
    code.add(StoreI);

    code.add(Label, beginElementCopyLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endElementCopyLabel);

    // Load newArrayMemoryPointer and originArrayMemoryPointer
    // The address they point to is exactly the target address
    code.add(PushD, newStringMemoryPointer);
    code.add(LoadI);
    code.add(PushD, originStringMemoryPointer);
    code.add(LoadI);
    code.add(LoadC);
    code.add(StoreC);

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originStringMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to next address of new element to store
    code.add(PushD, newStringMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginElementCopyLabel);
    code.add(Label, endElementCopyLabel);

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
    code.append(pushStringLength());
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

  public static ASMCodeFragment pushStringLength() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Macros.readIOffset(code, 8);
    return code;
  }
  
  // Sys: Address of the array is on the stack before running
  public static ASMCodeFragment stringPrint(String regCounter) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    Labeller labeller = new Labeller("-print-string-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");

    code.add(Label, beginLabel);
    // get the address of the string
    code.add(Duplicate);

    // store the length of string as the loop counter
    code.append(pushStringLength());
    Macros.storeITo(code, regCounter);

    // get the address of first element
    code.add(PushI, 12);
    code.add(Add);

    code.add(Label, loopBeginLabel);
    code.add(PushD, regCounter);
    code.add(LoadI);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(JumpFalse, loopEndLabel);

    code.add(Duplicate);
    code.add(PushI, 1);
    code.add(Add);
    code.add(Exchange);
    code.add(LoadI);

    code.add(PushD, regCounter);
    code.add(LoadI);
    code.add(Exchange);

    String format = PrintStatementGenerator.printFormat(PrimitiveType.CHARACTER);
    code.add(PushD, format);
    code.add(Printf);

    Macros.storeITo(code, regCounter);

    // Decrement the counter by 1
    Macros.decrementInteger(code, regCounter);

    code.add(Jump, loopBeginLabel);
    code.add(Label, loopEndLabel);
    code.add(Pop);
    code.add(Label, endLabel);

    return code;
  }
}
