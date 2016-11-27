package asmCodeGenerator;

import asmCodeGenerator.codeStorage.*;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.ArrayType;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.TypeVariable;

import java.util.List;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class ArrayHelper {

  public static ASMCodeFragment arrayCreation(ArrayType arrayType, ASMCodeFragment lengthOfArray,
      Labeller labeller, String reg1) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    String beginLabel = labeller.newLabel("array-creation-begin");
    String getLengthLabel = labeller.newLabel("array-creation-get-length");
    String sizeLabel = labeller.newLabel("array-creation-size");
    String typeLabel = labeller.newLabel("array-creation-type");
    String statusLabel = labeller.newLabel("array-creation-status");
    String subTypeSize = labeller.newLabel("array-creation-subtype-size");
    String lengthLabel = labeller.newLabel("array-creation-length");
    String endLabel = labeller.newLabel("array-creation-end");

    code.add(Label, beginLabel);
    code.add(Label, getLengthLabel);

    // Length of array cannot be negative
    code.append(lengthOfArray);
    code.add(Duplicate);
    code.add(Duplicate);
    Macros.storeITo(code, reg1);
    code.add(JumpNeg, RunTime.ARRAY_SIZE_NEGATIVE_ERROR);

    // Get the size of whole array including header and element
    code.add(Label, sizeLabel);
    code.add(PushI, arrayType.getSubType().getSize());
    code.add(Multiply);
    code.add(PushI, ArrayType.header_size);
    code.add(Add);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // add type identifier of array
    code.add(Label, typeLabel);
    code.add(Duplicate);
    code.add(PushI, arrayType.getTypeIdentifier());
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // add status of array
    code.add(Label, statusLabel);
    code.add(Duplicate);
    code.add(PushI, arrayType.getStatus());
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // add subtype size of array
    code.add(Label, subTypeSize);
    code.add(Duplicate);
    code.add(PushI, arrayType.getSubType().getSize());
    code.add(Exchange);
    Macros.writeIOffset(code, 8);

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

  public static ASMCodeFragment arrayInitialization(ArrayType arrayType,
      List<ASMCodeFragment> arrayElement, ASMOpcode op, Labeller labeller) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    int subTypeSize = arrayType.getSubType().getSize();
    int headerSize = arrayType.getHeaderSize();
    String beginLabel = labeller.newLabel("array-initialization-begin");
    String endLabel = labeller.newLabel("array-initialization-end");

    code.add(Label, beginLabel);
    for (int i = 0; i < arrayElement.size(); i++) {
      code.add(Duplicate);
      code.append(arrayElement.get(i));
      code.add(Exchange);
      code.add(PushI, headerSize + subTypeSize * i);
      code.add(Add);
      code.add(Exchange);
      code.add(op);
    }
    code.add(Label, endLabel);

    return code;
  }

  // need one register as counter
  // and another two as pointers
  public static ASMCodeFragment arrayClone(ArrayType arrayType, ASMCodeFragment originalArray,
      Labeller labeller, String counter, String originArrayMemoryPointer,
      String newArrayMemoryPointer) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    String beginLabel = labeller.newLabel("array-copy-begin");
    String endLabel = labeller.newLabel("array-copy-end");

    String beginHeaderCopyLabel = labeller.newLabel("array-header-copy-begin");
    String endHeaderCopyLabel = labeller.newLabel("array-header-copy-end");

    String beginElementCopyLabel = labeller.newLabel("array-element-copy-begin");
    String endElementCopyLabel = labeller.newLabel("array-element-copy-end");

    String sizeLabel = labeller.newLabel("array-copy-size");
    String typeLabel = labeller.newLabel("array-copy-type");
    String statusLabel = labeller.newLabel("array-copy-status");
    String subTypeSizeLabel = labeller.newLabel("array-copy-subtype-size");
    String lengthLabel = labeller.newLabel("array-copy-length");

    int subTypeSize = arrayType.getSubType().getSize();

    code.add(Duplicate);
    // Location of original array start
    code.add(Label, beginLabel);
    code.append(originalArray);

    // Get the address of original array
    // Store it in the originArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, originArrayMemoryPointer);

    // Get the length of array
    code.add(Label, sizeLabel);
    code.append(pushArrayLength(labeller.newLabel("push-array-length1")));

    // Copy length as a counter
    code.add(Duplicate);
    Macros.storeITo(code, counter);

    // length * size = whole size for element part
    code.add(PushI, subTypeSize);
    code.add(Multiply);

    // length * size + headSize = whole size for origin array
    // which is also the space need for new array
    code.add(PushI, arrayType.getHeaderSize());
    code.add(Add);

    // Get the address for the new array
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Get the address of the first element in new array
    // And store it in newArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, newArrayMemoryPointer);
    code.add(Label, beginHeaderCopyLabel);

    // add type identifier of array
    code.add(Label, typeLabel);
    code.add(Duplicate);
    code.add(PushI, arrayType.getTypeIdentifier());
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // add status of array
    code.add(Label, statusLabel);
    code.add(Duplicate);
    code.add(PushI, arrayType.getStatus());
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // add subtype size of array
    code.add(Label, subTypeSizeLabel);
    code.add(Duplicate);
    code.add(PushI, subTypeSize);
    code.add(Exchange);
    Macros.writeIOffset(code, 8);

    // add length of array
    code.add(Label, lengthLabel);
    code.add(Duplicate);
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);
    code.append(pushArrayLength(labeller.newLabel("push-array-length2")));
    code.add(Exchange);
    Macros.writeIOffset(code, 12);

    code.add(Label, endHeaderCopyLabel);

    // move originArrayMemoryPointer to first address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, arrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to address of first element to store
    code.add(PushD, newArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, arrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    code.add(Label, beginElementCopyLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endElementCopyLabel);

    // Load newArrayMemoryPointer and originArrayMemoryPointer
    // The address they point to is exactly the target address
    code.add(PushD, newArrayMemoryPointer);
    code.add(LoadI);
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);

    if (subTypeSize == 1) {
      code.add(LoadC);
      code.add(StoreC);
    } else if (subTypeSize == 4) {
      code.add(LoadI);
      code.add(StoreI);
    } else if (subTypeSize == 8) {
      code.add(LoadF);
      code.add(StoreF);
    }

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, subTypeSize);
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to next address of new element to store
    code.add(PushD, newArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, subTypeSize);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginElementCopyLabel);
    code.add(Label, endElementCopyLabel);
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment arrayElementAtIndex(ArrayType arrayType,
      ASMCodeFragment arrayAddress, ASMCodeFragment index, Labeller labeller,
      String memoryPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    String beginLabel = labeller.newLabel("array-index-begin");
    String beginFetchingLabel = labeller.newLabel("array-index-fetching-begin");
    String endFetchingLabel = labeller.newLabel("array-index-fetching-end");
    String endLabel = labeller.newLabel("array-index-end");

    code.add(Label, beginLabel);
    code.append(arrayAddress);
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
    code.append(pushArrayLength(labeller.newLabel("array-length")));
    code.add(Exchange);
    code.add(Subtract);
    code.add(JumpPos, beginFetchingLabel);
    code.add(Jump, RunTime.ARRAY_INDEX_EXCEED_BOUND_ERROR);
    code.add(Label, beginFetchingLabel);

    // get the address of first element
    code.add(PushI, arrayType.getHeaderSize());
    code.add(Add);

    // get the address offset to that element
    code.add(PushD, memoryPointer);
    code.add(LoadI);
    code.add(PushI, arrayType.getSubType().getSize());
    code.add(Multiply);

    // return the address of ith element of original array
    code.add(Add);

    code.add(Label, endFetchingLabel);
    code.add(Label, endLabel);
    return code;
  }

  public static ASMCodeFragment arrayPrint(ArrayType type) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    Type subType = type.getSubType();
    if (subType instanceof TypeVariable) {
      subType = ((TypeVariable) subType).getSubtype();
    }

    int subTypeSize = type.getSubType().getSize();
    Labeller labeller = new Labeller("-print-array-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");

    code.add(Label, beginLabel);
    // get the address of the array
    code.add(Duplicate);

    // store the length of array as the loop counter
    code.append(pushArrayLength(labeller.newLabel("-push-array-length")));
    Macros.storeITo(code, ASMCodeGenerator.regCounter);

    // get the address of first element
    code.add(PushI, ArrayType.header_size);
    code.add(Add);

    code.add(PushD, RunTime.OPEN_SQUARE_BRACKET_PRINT_FORMAT);
    code.add(Printf);
    code.add(Label, loopBeginLabel);
    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(JumpFalse, loopEndLabel);

    code.add(Duplicate);
    code.add(PushI, subTypeSize);
    code.add(Add);
    code.add(Exchange);

    if (subType == PrimitiveType.BOOLEAN || subType == PrimitiveType.CHARACTER) {
      code.add(LoadC);
    } else if (subType == PrimitiveType.FLOATING) {
      code.add(LoadF);
    } else {
      code.add(LoadI);
    }

    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);
    code.add(Exchange);

    if (subType.isReferenceType() && !(subType instanceof LambdaType)) {
      code.append(arrayPrint((ArrayType) subType));
    } else if (subType == PrimitiveType.RATIONAL) {
      code.append(RationalHelper.appendPrintCodeForRational(subType));
    } else if (subType == PrimitiveType.STRING) {
      code.append(StringHelper.stringPrint());
    } else {
      if (subType == PrimitiveType.STRING) {
        code.add(PushI, 12);
        code.add(Add);
      } else if (subType == PrimitiveType.BOOLEAN) {
        String trueLabelForBoolean = labeller.newLabel("true-boolean");
        String endLabelForBoolean = labeller.newLabel("join-boolean");
        code.add(JumpTrue, trueLabelForBoolean);
        code.add(PushD, RunTime.BOOLEAN_FALSE_STRING);
        code.add(Jump, endLabelForBoolean);
        code.add(Label, trueLabelForBoolean);
        code.add(PushD, RunTime.BOOLEAN_TRUE_STRING);
        code.add(Label, endLabelForBoolean);
      } else if (subType instanceof LambdaType) {
        code.add(Pop);
        code.add(PushD, RunTime.LAMBDATYPE_STRING);
      }
      String format = PrintStatementGenerator.printFormat(subType);
      code.add(PushD, format);
      code.add(Printf);
    }

    Macros.storeITo(code, ASMCodeGenerator.regCounter);

    // Decrement the counter by 1
    Macros.decrementInteger(code, ASMCodeGenerator.regCounter);

    // Print separator and space if not last element
    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);
    code.add(JumpFalse, loopEndLabel);
    code.add(PushD, RunTime.SEPARATOR_PRINT_FORMAT);
    code.add(Printf);
    code.add(PushD, RunTime.SPACE_PRINT_FORMAT);
    code.add(Printf);

    code.add(Jump, loopBeginLabel);
    code.add(Label, loopEndLabel);
    code.add(Pop);
    code.add(PushD, RunTime.CLOSE_SQUARE_BRACKET_PRINT_FORMAT);
    code.add(Printf);
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment arrayRelease(ArrayType arrayType) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    code.add(Duplicate);

    Type subType = arrayType.getSubType();
    if (subType instanceof TypeVariable) {
      subType = ((TypeVariable) subType).getSubtype();
    }

    int subTypeSize = arrayType.getSubType().getSize();
    Labeller labeller = new Labeller("-release-array-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");

    code.add(Label, beginLabel);
    // get the address of the array
    code.add(Duplicate);

    // store the length of array as the loop counter
    code.append(pushArrayLength(labeller.newLabel("-push-array-length")));
    Macros.storeITo(code, ASMCodeGenerator.regCounter);

    // get the address of first element
    code.add(PushI, ArrayType.header_size);
    code.add(Add);

    code.add(Label, loopBeginLabel);
    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(JumpFalse, loopEndLabel);

    code.add(Duplicate);
    code.add(PushI, subTypeSize);
    code.add(Add);
    code.add(Exchange);
    code.add(LoadI);

    code.add(PushD, ASMCodeGenerator.regCounter);
    code.add(LoadI);
    code.add(Exchange);

    if (subType.isReferenceType()) {
      code.append(arrayRelease((ArrayType) subType));
    } else {
      code.add(Pop);
    }

    Macros.storeITo(code, ASMCodeGenerator.regCounter);

    // Decrement the counter by 1
    Macros.decrementInteger(code, ASMCodeGenerator.regCounter);

    code.add(Jump, loopBeginLabel);
    code.add(Label, loopEndLabel);
    code.add(Pop);
    code.add(Call, MemoryManager.MEM_MANAGER_DEALLOCATE);
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment pushArrayLength(String label) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    code.add(Label, label);
    Macros.readIOffset(code, 12);
    return code;
  }

  public static ASMCodeFragment pushSubtypeSize(String label) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    code.add(Label, label);
    Macros.readIOffset(code, 8);
    return code;
  }
}
