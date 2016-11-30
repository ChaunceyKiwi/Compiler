package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import semanticAnalyzer.types.*;

public class LoopHelper {
  public static ASMCodeFragment generateStringIndexLoopCode(Labeller labeller, ASMCodeFragment codeOfIdentifier,
      String regIdentifier, ASMCodeFragment codeOfSequence, String regSequence,
      ASMCodeFragment codeOfForBody, String regLooper) {

    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");
    String continueLabel = labeller.newLabel("continue");
    String breakLabel = labeller.newLabel("break");

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    // Store the address of identifier in regIdentifier
    code.append(codeOfIdentifier);
    Macros.storeITo(code, regIdentifier);

    // Store the index in regSequence
    code.add(PushI, 0);
    Macros.storeITo(code, regSequence);

    // Set counter's value as the length of string
    code.append(codeOfSequence);
    code.append(StringHelper.pushStringLength());
    Macros.storeITo(code, regLooper);

    code.add(Label, loopBeginLabel);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(PushD, regLooper);
    code.add(LoadI);
    code.add(JumpFalse, loopEndLabel);

    code.add(PushD, regIdentifier);
    code.add(LoadI);
    code.add(PushD, regSequence);
    code.add(LoadI);
    code.add(StoreI);

    // Append for body here
    code.append(codeOfForBody);
    code.add(Label, continueLabel);

    // set regSequence as index + 1
    code.add(PushD, regSequence);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, regLooper);
    code.add(Jump, loopBeginLabel);
    code.add(Label, breakLabel);
    code.add(Label, loopEndLabel);
    return code;
  }

  public static ASMCodeFragment generateArrayIndexLoopCode(Labeller labeller, ASMCodeFragment codeOfIdentifier,
      String regIdentifier, ASMCodeFragment codeOfSequence, String regSequence,
      ASMCodeFragment codeOfForBody, String regLooper) {
    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");
    String continueLabel = labeller.newLabel("continue");
    String breakLabel = labeller.newLabel("break");

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    // Store the address of identifier in regIdentifier
    code.append(codeOfIdentifier);
    Macros.storeITo(code, regIdentifier);

    // Store the index in regSequence
    code.add(PushI, 0);
    Macros.storeITo(code, regSequence);

    // Set counter's value as the length of array
    code.append(codeOfSequence);
    code.append(ArrayHelper.pushArrayLength());
    Macros.storeITo(code, regLooper);

    code.add(Label, loopBeginLabel);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(PushD, regLooper);
    code.add(LoadI);
    code.add(JumpFalse, loopEndLabel);

    code.add(PushD, regIdentifier);
    code.add(LoadI);
    code.add(PushD, regSequence);
    code.add(LoadI);
    code.add(StoreI);

    // Append for body here
    code.append(codeOfForBody);
    code.add(Label, continueLabel);

    // set regSequence as index + 1
    code.add(PushD, regSequence);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, regLooper);
    code.add(Jump, loopBeginLabel);
    code.add(Label, breakLabel);
    code.add(Label, loopEndLabel);
    return code;
  }

  public static ASMCodeFragment generateStringElementLoopCode(Labeller labeller, ASMCodeFragment codeOfIdentifier,
      String regIdentifier, ASMCodeFragment codeOfSequence, String regSequence,
      ASMCodeFragment codeOfForBody, String regLooper) {

    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");
    String continueLabel = labeller.newLabel("continue");
    String breakLabel = labeller.newLabel("break");

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    
    // Store the address of identifier in regIdentifier
    code.append(codeOfIdentifier);
    Macros.storeITo(code, regIdentifier);

    // Store the address of sequence in regSequence
    code.append(codeOfSequence);
    code.add(Duplicate);
    Macros.storeITo(code, regSequence);

    // Set counter's value as the length of string
    code.append(StringHelper.pushStringLength());
    Macros.storeITo(code, regLooper);

    // store the address of first element in regSequence
    code.add(PushD, regSequence);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 12);
    code.add(Add);
    code.add(StoreI);

    code.add(Label, loopBeginLabel);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(PushD, regLooper);
    code.add(LoadI);
    code.add(JumpFalse, loopEndLabel);

    code.add(PushD, regIdentifier);
    code.add(LoadI);
    code.add(PushD, regSequence);
    code.add(LoadI);
    code.add(LoadC);
    code.add(StoreC);

    // Append for body here
    code.append(codeOfForBody);
    code.add(Label, continueLabel);

    // move regSequence to next address of new element
    code.add(PushD, regSequence);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, 1);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, regLooper);
    code.add(Jump, loopBeginLabel);
    code.add(Label, breakLabel);
    code.add(Label, loopEndLabel);
    return code;
  }
  
  public static ASMCodeFragment generateArrayElementLoopCode(Labeller labeller, Type sequenceType, ASMCodeFragment codeOfIdentifier,
      String regIdentifier, ASMCodeFragment codeOfSequence, String regSequence,
      ASMCodeFragment codeOfForBody, String regLooper) {

    String loopBeginLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");
    String continueLabel = labeller.newLabel("continue");
    String breakLabel = labeller.newLabel("break");
    
    int subTypeSize = ((ArrayType) sequenceType).getSubType().getSize();

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    
    // Store the address of identifier in regIdentifier
    code.append(codeOfIdentifier);
    Macros.storeITo(code, regIdentifier);
    
    // Store the address of sequence in regSequence
    code.append(codeOfSequence);
    code.add(Duplicate);
    Macros.storeITo(code, regSequence);
    
    // Set counter's value as the length of string
    code.append(ArrayHelper.pushArrayLength());
    Macros.storeITo(code, regLooper);

    // store the address of first element in regSequence
    code.add(PushD, regSequence);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, ArrayType.header_size);
    code.add(Add);
    code.add(StoreI);

    code.add(Label, loopBeginLabel);

    // Counter counts from length to 0
    // If counter is 0, then exit loop
    code.add(PushD, regLooper);
    code.add(LoadI);
    code.add(JumpFalse, loopEndLabel);

    code.add(PushD, regIdentifier);
    code.add(LoadI);
    code.add(PushD, regSequence);
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

    // Append for body here
    code.append(codeOfForBody);
    code.add(Label, continueLabel);

    // move regSequence to next address of new element
    code.add(PushD, regSequence);
    code.add(Duplicate);
    code.add(LoadI);
    code.add(PushI, subTypeSize);
    code.add(Add);
    code.add(StoreI);

    // Decrement the counter by 1
    Macros.decrementInteger(code, regLooper);
    code.add(Jump, loopBeginLabel);
    code.add(Label, breakLabel);
    code.add(Label, loopEndLabel);
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
}
