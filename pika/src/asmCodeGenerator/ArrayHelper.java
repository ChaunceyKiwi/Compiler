package asmCodeGenerator;

import java.util.List;

import asmCodeGenerator.codeStorage.*;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.*;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class ArrayHelper {
  public static ASMCodeFragment arrayFoldWithLambdaAndBase(ArrayType originalArrayType,
      ASMCodeFragment originalArray, ASMCodeFragment base,ASMCodeFragment lambda, Labeller labeller, String counter,
      String originArrayMemoryPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    String beginLabel = labeller.newLabel("array-fold-begin");
    String endLabel = labeller.newLabel("array-fold-end");
    String beginElementFoldLabel = labeller.newLabel("array-element-fold-begin");
    String endElementFoldLabel = labeller.newLabel("array-element-fold-end");
    String sizeLabel = labeller.newLabel("array-map-size");
    int originalArraySubTypeSize = originalArrayType.getSubType().getSize();

    // Location of original array start
    code.add(Label, beginLabel);
    code.append(originalArray);

    // Get the address of original array
    // Store it in the originArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, originArrayMemoryPointer);

    // Set arrayLength as counter
    code.add(Label, sizeLabel);
    code.append(pushArrayLength());
    Macros.storeITo(code, counter);

    // move originArrayMemoryPointer to first address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // Push code for base into ASM stack
    code.append(base);
    
    // If array length is 0 
    // return base address directly
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endLabel);

    // Every time enter the loop, there is one element on the ASMStack
    code.add(Label, beginElementFoldLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endElementFoldLabel);

    // Load newArrayMemoryPointer and originArrayMemoryPointer
    // The address they point to is exactly the target address
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);
    if (originalArraySubTypeSize == 1) {
      code.add(LoadC);
    } else if (originalArraySubTypeSize == 4) {
      code.add(LoadI);
    } else if (originalArraySubTypeSize == 8) {
      code.add(LoadF);
    }

    code.add(Exchange);
    code.append(pushElementToFrameStack(originalArrayType.getSubType()));
    code.append(pushElementToFrameStack(originalArrayType.getSubType()));
    code.append(lambda);
    code.add(CallV);
    code.append(popElementFromFrameToASMStack(originalArrayType.getSubType()));

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginElementFoldLabel);
    code.add(Label, endElementFoldLabel);
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment arrayFoldWithLambda(ArrayType originalArrayType,
      ASMCodeFragment originalArray, ASMCodeFragment lambda, Labeller labeller, String counter,
      String originArrayMemoryPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    String beginLabel = labeller.newLabel("array-fold-begin");
    String endLabel = labeller.newLabel("array-fold-end");
    String beginElementFoldLabel = labeller.newLabel("array-element-fold-begin");
    String endElementFoldLabel = labeller.newLabel("array-element-fold-end");
    String sizeLabel = labeller.newLabel("array-map-size");
    int originalArraySubTypeSize = originalArrayType.getSubType().getSize();

    // Location of original array start
    code.add(Label, beginLabel);
    code.append(originalArray);

    // Get the address of original array
    // Store it in the originArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, originArrayMemoryPointer);

    // Set (arrayLength - 2) as counter
    code.add(Label, sizeLabel);
    code.append(pushArrayLength());
    code.add(PushI, -2);
    code.add(Add);
    Macros.storeITo(code, counter);
    
    // If length is 0 (-2 in counter), issue error
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(PushI, 2);
    code.add(Add);
    code.add(JumpFalse, RunTime.FOLD_OPERATOR_ARRAY_ZERO_LENGTH);
    

    // move originArrayMemoryPointer to first address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // Push first elements into ASM stack as base
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);
    if (originalArraySubTypeSize == 1) {
      code.add(LoadC);
    } else if (originalArraySubTypeSize == 4) {
      code.add(LoadI);
    } else if (originalArraySubTypeSize == 8) {
      code.add(LoadF);
    }
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);
    
    // If the length is 1 (-1 in counter)
    // return first element directly
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(JumpFalse, endLabel);

    // Every time enter the loop, there is one element on the ASMStack
    code.add(Label, beginElementFoldLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endElementFoldLabel);

    // Load newArrayMemoryPointer and originArrayMemoryPointer
    // The address they point to is exactly the target address
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);
    if (originalArraySubTypeSize == 1) {
      code.add(LoadC);
    } else if (originalArraySubTypeSize == 4) {
      code.add(LoadI);
    } else if (originalArraySubTypeSize == 8) {
      code.add(LoadF);
    }

    code.add(Exchange);
    code.append(pushElementToFrameStack(originalArrayType.getSubType()));
    code.append(pushElementToFrameStack(originalArrayType.getSubType()));
    code.append(lambda);
    code.add(CallV);
    code.append(popElementFromFrameToASMStack(originalArrayType.getSubType()));

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginElementFoldLabel);
    code.add(Label, endElementFoldLabel);
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment arrayMapWithLambda(ArrayType originalArrayType,
      ArrayType targetArrayType, ASMCodeFragment originalArray, ASMCodeFragment lambda,
      Labeller labeller, String counter, String originArrayMemoryPointer,
      String newArrayMemoryPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    String beginLabel = labeller.newLabel("array-map-begin");
    String endLabel = labeller.newLabel("array-map-end");

    String beginHeaderCopyLabel = labeller.newLabel("array-header-map-begin");
    String endHeaderCopyLabel = labeller.newLabel("array-header-map-end");

    String beginElementCopyLabel = labeller.newLabel("array-element-map-begin");
    String endElementCopyLabel = labeller.newLabel("array-element-map-end");

    String sizeLabel = labeller.newLabel("array-map-size");
    String typeLabel = labeller.newLabel("array-map-type");
    String statusLabel = labeller.newLabel("array-map-status");
    String subTypeSizeLabel = labeller.newLabel("array-map-subtype-size");
    String lengthLabel = labeller.newLabel("array-map-length");

    int originalArraySubTypeSize = originalArrayType.getSubType().getSize();
    int targetArraySubTypeSize = targetArrayType.getSubType().getSize();

    // Location of original array start
    code.add(Label, beginLabel);
    code.append(originalArray);

    // Get the address of original array
    // Store it in the originArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, originArrayMemoryPointer);

    // Get the length of array
    code.add(Label, sizeLabel);
    code.append(pushArrayLength());

    // Copy length as a counter
    code.add(Duplicate);
    Macros.storeITo(code, counter);

    // length * size = whole size for element part
    code.add(PushI, targetArraySubTypeSize);
    code.add(Multiply);

    // length * size + headSize = whole size for origin array
    // which is also the space need for new array
    code.add(PushI, originalArrayType.getHeaderSize());
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
    code.add(PushI, originalArrayType.getTypeIdentifier());
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // add status of array
    code.add(Label, statusLabel);
    code.add(Duplicate);
    code.add(PushI, originalArrayType.getStatus());
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // add subtype size of array
    code.add(Label, subTypeSizeLabel);
    code.add(Duplicate);
    code.add(PushI, targetArraySubTypeSize);
    code.add(Exchange);
    Macros.writeIOffset(code, 8);

    // add length of array
    code.add(Label, lengthLabel);
    code.add(Duplicate);
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);
    code.append(pushArrayLength());
    code.add(Exchange);
    Macros.writeIOffset(code, 12);

    code.add(Label, endHeaderCopyLabel);

    // move originArrayMemoryPointer to first address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to address of first element to store
    code.add(PushD, newArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, targetArrayType.getHeaderSize());
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

    if (originalArraySubTypeSize == 1) {
      code.add(LoadC);
    } else if (originalArraySubTypeSize == 4) {
      code.add(LoadI);
    } else if (originalArraySubTypeSize == 8) {
      code.add(LoadF);
    }

    code.append(pushElementToFrameStack(originalArrayType.getSubType()));
    code.append(lambda);
    code.add(CallV);
    code.append(popElementFromFrameToASMStack(targetArrayType.getSubType()));

    if (targetArraySubTypeSize == 1) {
      code.add(StoreC);
    } else if (targetArraySubTypeSize == 4) {
      code.add(StoreI);
    } else if (targetArraySubTypeSize == 8) {
      code.add(StoreF);
    }

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to next address of new element to store
    code.add(PushD, newArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, targetArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginElementCopyLabel);
    code.add(Label, endElementCopyLabel);
    code.add(Label, endLabel);

    return code;
  }

  // Assume we already have [bool] which has the same length as originalArray
  // The address of boolean array is currently on the stack
  public static ASMCodeFragment arrayReduceWithLambda(ArrayType originalArrayType,
      ArrayType targetArrayType, ASMCodeFragment originalArray, ASMCodeFragment lambda,
      Labeller labeller, String counter, String lengthCounter, String originArrayMemoryPointer,
      String originBooleanArrayPointer, String newArrayMemoryPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    String beginLabel = labeller.newLabel("array-reduce-begin");
    String endLabel = labeller.newLabel("array-reduce-end");

    String beginHeaderCopyLabel = labeller.newLabel("array-header-map-begin");
    String endHeaderCopyLabel = labeller.newLabel("array-header-map-end");

    String beginElementCopyLabel = labeller.newLabel("array-element-map-begin");
    String endElementCopyLabel = labeller.newLabel("array-element-map-end");

    String sizeLabel = labeller.newLabel("array-map-size");
    String typeLabel = labeller.newLabel("array-map-type");
    String statusLabel = labeller.newLabel("array-map-status");
    String subTypeSizeLabel = labeller.newLabel("array-map-subtype-size");
    String lengthLabel = labeller.newLabel("array-map-length");

    int originalArraySubTypeSize = originalArrayType.getSubType().getSize();
    int targetArraySubTypeSize = targetArrayType.getSubType().getSize();

    code.add(Label, beginLabel);

    // Get the address of original array
    // Store it in the originArrayMemoryPointer
    code.append(originalArray);
    code.add(Duplicate);
    code.add(Duplicate);
    Macros.storeITo(code, originArrayMemoryPointer);

    // Get the length of array
    code.add(Label, sizeLabel);
    code.append(pushArrayLength());

    // Copy length as a counter
    code.add(Duplicate);
    Macros.storeITo(code, counter);

    // length * size = whole size for element part
    // target is boolean array, thus size = 1
    code.add(PushI, 1);
    code.add(Multiply);

    // length * size + headSize = whole size for origin array
    // which is also the space need for new array
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);

    // Get the address for the new array
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Get the address of the first element in new array
    // And store it in newArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, originBooleanArrayPointer);
    code.add(Label, beginHeaderCopyLabel);

    // add type identifier of array
    code.add(Label, typeLabel);
    code.add(Duplicate);
    code.add(PushI, originalArrayType.getTypeIdentifier());
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // add status of array
    code.add(Label, statusLabel);
    code.add(Duplicate);
    code.add(PushI, originalArrayType.getStatus());
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // add subtype size of array
    // subtype is boolean, thus size = 1
    code.add(Label, subTypeSizeLabel);
    code.add(Duplicate);
    code.add(PushI, 1);
    code.add(Exchange);
    Macros.writeIOffset(code, 8);

    // add length of array
    code.add(Label, lengthLabel);
    code.add(Duplicate);
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);
    code.append(pushArrayLength());
    code.add(Exchange);
    Macros.writeIOffset(code, 12);

    code.add(Label, endHeaderCopyLabel);

    // move originArrayMemoryPointer to first address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to address of first element to store
    code.add(PushD, originBooleanArrayPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    code.add(Label, beginElementCopyLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endElementCopyLabel);

    // Load newArrayMemoryPointer and originArrayMemoryPointer
    // The address they point to is exactly the target address
    code.add(PushD, originBooleanArrayPointer);
    code.add(LoadI);

    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);

    if (originalArraySubTypeSize == 1) {
      code.add(LoadC);
    } else if (originalArraySubTypeSize == 4) {
      code.add(LoadI);
    } else if (originalArraySubTypeSize == 8) {
      code.add(LoadF);
    }

    code.append(pushElementToFrameStack(originalArrayType.getSubType()));
    code.append(lambda);
    code.add(CallV);
    code.append(popElementFromFrameToASMStack(PrimitiveType.BOOLEAN));
    code.add(StoreC);

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to next address of new element to store
    code.add(PushD, originBooleanArrayPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginElementCopyLabel);
    code.add(Label, endElementCopyLabel);

    code.add(Exchange);
    code.append(restoreRegister(originArrayMemoryPointer));

    String countTrueElementBeginLabel = labeller.newLabel("count-true-begin");
    String countTrueElementJumpLabel = labeller.newLabel("count-true-jump");
    String countTrueElementEndLabel = labeller.newLabel("count-true-end");

    String beginReduceElementCopyLabel = labeller.newLabel("reduce-element-copy-begin");
    String jumpElementCopyLabel = labeller.newLabel("reduce-element-copy-jump");
    String endReduceElementCopyLabel = labeller.newLabel("reduce-element-copy-end");

    // store address of the boolean array in originBooleanArrayPointer
    code.add(Duplicate);
    code.add(Duplicate);
    Macros.storeITo(code, originBooleanArrayPointer);

    // Get the length of originalBooleanArray and store in he counter
    code.append(pushArrayLength());
    Macros.storeITo(code, counter);

    // Initialize the number of true element as 0
    code.add(PushI, 0);
    Macros.storeITo(code, lengthCounter);

    // move originBooleanArrayMemoryPointer to first address of element
    code.add(PushD, originBooleanArrayPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 16);
    code.add(Add);
    code.add(StoreI);

    // Start of loop to find the number of true element
    code.add(Label, countTrueElementBeginLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, countTrueElementEndLabel);

    // Get the boolean element,
    // then add 1 to the lengthCounter
    code.add(PushD, originBooleanArrayPointer);
    code.add(LoadI);
    code.add(LoadC);
    code.add(JumpFalse, countTrueElementJumpLabel);

    // element is true
    code.add(PushD, lengthCounter);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    Macros.storeITo(code, lengthCounter);

    code.add(Label, countTrueElementJumpLabel);

    // move originBooleanArrayMemoryPointer to next address of element
    // subelement is boolean, thus subtype size is 1
    code.add(PushD, originBooleanArrayPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    Macros.decrementInteger(code, counter);
    code.add(Jump, countTrueElementBeginLabel);
    code.add(Label, countTrueElementEndLabel);

    // move original boolean back to start of boolean array
    code.append(restoreRegister(originBooleanArrayPointer));

    // create an empty string to store values
    ASMCodeFragment length = new ASMCodeFragment(GENERATES_VALUE);
    length.add(PushD, lengthCounter);
    length.add(LoadI);

    // Create string with length as len(m)
    // Store the address of new string in newStringPointer
    code.append(backupRegister(counter));
    code.append(arrayCreation(targetArrayType, length, labeller, counter));
    code.add(Exchange);
    code.append(restoreRegister(counter));
    code.add(Duplicate);
    Macros.storeITo(code, newArrayMemoryPointer);

    // Get the length of originalBooleanArray and store in he counter
    code.add(PushD, originBooleanArrayPointer);
    code.add(LoadI);
    code.append(pushArrayLength());
    Macros.storeITo(code, counter);

    // move originArrayMemoryPointer to first address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // move originBooleanArrayMemoryPointer to first address of element
    code.add(PushD, originBooleanArrayPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    // move newArrayMemoryPointer to address of first element to store
    code.add(PushD, newArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArrayType.getHeaderSize());
    code.add(Add);
    code.add(StoreI);

    code.add(Label, beginReduceElementCopyLabel);
    code.add(PushD, counter);
    code.add(LoadI);
    code.add(JumpFalse, endReduceElementCopyLabel);

    // Load newArrayMemoryPointer and originArrayMemoryPointer
    // The address they point to is exactly the target address
    code.add(PushD, originBooleanArrayPointer);
    code.add(LoadI);
    code.add(LoadC);
    code.add(JumpFalse, jumpElementCopyLabel);

    code.add(PushD, newArrayMemoryPointer);
    code.add(LoadI);
    code.add(PushD, originArrayMemoryPointer);
    code.add(LoadI);

    if (originalArraySubTypeSize == 1) {
      code.add(LoadC);
    } else if (originalArraySubTypeSize == 4) {
      code.add(LoadI);
    } else if (originalArraySubTypeSize == 8) {
      code.add(LoadF);
    }

    if (targetArraySubTypeSize == 1) {
      code.add(StoreC);
    } else if (targetArraySubTypeSize == 4) {
      code.add(StoreI);
    } else if (targetArraySubTypeSize == 8) {
      code.add(StoreF);
    }

    // move newArrayMemoryPointer to next address of new element to store
    code.add(PushD, newArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, targetArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    code.add(Label, jumpElementCopyLabel);

    // move originArrayMemoryPointer to next address of element
    code.add(PushD, originArrayMemoryPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, originalArraySubTypeSize);
    code.add(Add);
    code.add(StoreI);

    // move originBooleanArrayMemoryPointer to next address of element
    // subelement is boolean, thus subtype size is 1
    code.add(PushD, originBooleanArrayPointer);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, counter);
    code.add(Jump, beginReduceElementCopyLabel);
    code.add(Label, endReduceElementCopyLabel);

    code.add(Label, endLabel);

    return code;
  }


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

    // Location of original array start
    code.add(Label, beginLabel);
    code.append(originalArray);

    // Get the address of original array
    // Store it in the originArrayMemoryPointer
    code.add(Duplicate);
    Macros.storeITo(code, originArrayMemoryPointer);

    // Get the length of array
    code.add(Label, sizeLabel);
    code.append(pushArrayLength());

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
    code.append(pushArrayLength());
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
    code.append(pushArrayLength());
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

  // Sys: Address of the array is on the stack before running
  public static ASMCodeFragment arrayPrint(ArrayType type, String reg1) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    Type subType = type.getSubType();

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
    code.append(pushArrayLength());
    Macros.storeITo(code, reg1);

    // get the address of first element
    code.add(PushI, ArrayType.header_size);
    code.add(Add);

    code.add(PushD, RunTime.OPEN_SQUARE_BRACKET_PRINT_FORMAT);
    code.add(Printf);
    code.add(Label, loopBeginLabel);
    code.add(PushD, reg1);
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

    if (subType.isReferenceType() && !(subType instanceof LambdaType)) {
      code.append(backupRegister(reg1));
      code.add(Exchange);
      code.append(arrayPrint((ArrayType) subType, reg1));
      code.append(restoreRegister(reg1));
    } else if (subType == PrimitiveType.RATIONAL) {
      code.append(backupRegister(reg1));
      code.add(Exchange);
      code.append(RationalHelper.appendPrintCodeForRational(subType, reg1));
      code.append(restoreRegister(reg1));
    } else if (subType == PrimitiveType.STRING) {
      code.append(backupRegister(reg1));
      code.add(Exchange);
      code.append(StringHelper.stringPrint(reg1));
      code.append(restoreRegister(reg1));
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

    // Decrement the counter by 1
    Macros.decrementInteger(code, reg1);

    // Print separator and space if not last element
    code.add(PushD, reg1);
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

  public static ASMCodeFragment arrayRelease(ArrayType arrayType, String regCounter) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    code.add(Duplicate);

    Type subType = arrayType.getSubType();
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
    code.append(pushArrayLength());
    Macros.storeITo(code, regCounter);

    // get the address of first element
    code.add(PushI, ArrayType.header_size);
    code.add(Add);

    code.add(Label, loopBeginLabel);
    code.add(PushD, regCounter);
    code.add(LoadI);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(JumpFalse, loopEndLabel);

    code.add(Duplicate);
    code.add(PushI, subTypeSize);
    code.add(Add);
    code.add(Exchange);
    code.add(LoadI);

    if (subType.isReferenceType()) {
      code.append(backupRegister(regCounter));
      code.add(Exchange);
      code.append(arrayRelease((ArrayType) subType, regCounter));
      code.append(restoreRegister(regCounter));
    } else {
      code.add(Pop);
    }

    // Decrement the counter by 1
    Macros.decrementInteger(code, regCounter);

    code.add(Jump, loopBeginLabel);
    code.add(Label, loopEndLabel);
    code.add(Pop);
    code.add(Call, MemoryManager.MEM_MANAGER_DEALLOCATE);
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment pushArrayLength() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Macros.readIOffset(code, 12);
    return code;
  }

  public static ASMCodeFragment pushSubtypeSize() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Macros.readIOffset(code, 8);
    return code;
  }

  public static ASMCodeFragment backupRegister(String reg) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    code.add(PushD, reg);
    code.add(LoadI);
    return code;
  }

  public static ASMCodeFragment restoreRegister(String reg) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    Macros.storeITo(code, reg);
    return code;
  }

  public static ASMCodeFragment pushElementToFrameStack(Type type) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    // Need a push before function
    // Pre-decrement style (get new address)
    code.append(decrementStackPointer(type.getSize()));

    // Store the element into the address
    Macros.loadIFrom(code, RunTime.STACK_POINTER);
    code.add(Exchange);
    code.add(opcodeForStore(type));
    return code;
  }

  public static ASMCodeFragment decrementStackPointer(int size) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    Macros.loadIFrom(code, RunTime.STACK_POINTER);
    code.add(PushI, size);
    code.add(Subtract);
    Macros.storeITo(code, RunTime.STACK_POINTER);
    return code;
  }

  public static ASMCodeFragment incrementStackPointer(int size) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    Macros.loadIFrom(code, RunTime.STACK_POINTER);
    code.add(PushI, size);
    code.add(Add);
    Macros.storeITo(code, RunTime.STACK_POINTER);
    return code;
  }

  public static ASMOpcode opcodeForStore(Type type) {
    if (type == PrimitiveType.INTEGER)
      return StoreI;
    if (type == PrimitiveType.BOOLEAN)
      return StoreC;
    if (type == PrimitiveType.FLOATING)
      return StoreF;
    if (type == PrimitiveType.CHARACTER)
      return StoreC;
    if (type == PrimitiveType.STRING)
      return StoreI;
    if (type == PrimitiveType.RATIONAL)
      return StoreI;
    if (type.isReferenceType())
      return StoreI;
    assert false : "Type " + type + " unimplemented in opcodeForStore()";
    return null;
  }

  // pop element from frame stack and increment SP
  public static ASMCodeFragment popElementFromFrameToASMStack(Type type) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Macros.loadIFrom(code, RunTime.STACK_POINTER);
    code.add(opcodeForLoad(type));
    code.append(incrementStackPointer(type.getSize()));
    return code;
  }

  public static ASMOpcode opcodeForLoad(Type type) {
    if (type == PrimitiveType.INTEGER)
      return LoadI;
    if (type == PrimitiveType.BOOLEAN)
      return LoadC;
    if (type == PrimitiveType.FLOATING)
      return LoadF;
    if (type == PrimitiveType.CHARACTER)
      return LoadC;
    if (type == PrimitiveType.STRING)
      return LoadI;
    if (type == PrimitiveType.RATIONAL)
      return LoadI;
    if (type.isReferenceType())
      return LoadI;
    assert false : "Type " + type + " unimplemented in opcodeForLoad()";
    return null;
  }
}
