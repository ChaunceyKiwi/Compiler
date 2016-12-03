package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VALUE;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;

public class RationalHelper {

  // reg1 must be reg1, reg2 must be reg2 to calculate GCD
  public static ASMCodeFragment performOverPuntuator(ASMCodeFragment arg1, ASMCodeFragment arg2,
      String GCDCalculation, String reg1, String reg2, String reg3, String reg4) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    // Treat a rational number as an array with 2 elements
    Labeller labeller = new Labeller("rational-number");
    String beginLabel = labeller.newLabel("rational-creation-begin");
    String endLabel = labeller.newLabel("rational-creation-end");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    code.add(Label, beginLabel);

    // backup the value of registers
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.add(Label, backupRegisterEndLabel);

    // store abs(num1) in reg1
    // store num1 in reg3
    code.add(PushD, reg1);
    code.append(arg1);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    // store num2 in reg4
    code.add(PushD, reg2);
    code.append(arg2);
    code.add(Duplicate);
    code.add(JumpFalse, RunTime.RATIONAL_DENOMINATOR_ZERO_ERROR);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));

    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // restore the value of registers
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);

    // leave the address of array on the accumulator
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment performExpressOverPunctuator(ASMCodeFragment arg1,
      ASMCodeFragment arg2, Type type, String addressPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    code.append(backupRegister(addressPointer));

    if (type == PrimitiveType.FLOATING) {
      code.append(arg1);
      code.append(arg2);
      code.add(ConvertF);
      code.add(FMultiply);
      code.add(ConvertI);
    }
    // [ (n//m)///(d) = int((n*d)/m) ]
    else if (type == PrimitiveType.RATIONAL) {
      // store rational address
      code.append(arg1);
      Macros.storeITo(code, addressPointer);

      // get n*d
      code.append(arg2);
      code.add(PushD, addressPointer);
      code.add(LoadI);
      code.add(LoadI);
      code.add(Multiply);

      // get m
      code.add(PushD, addressPointer);
      code.add(LoadI);
      code.add(PushI, 4);
      code.add(Add);
      code.add(LoadI);

      // get int((n*d)/m)
      code.add(Divide);
    }

    code.add(Exchange);
    code.append(restoreRegister(addressPointer));
    return code;
  }

  public static ASMCodeFragment performRationalizePuntuator(ASMCodeFragment arg1,
      ASMCodeFragment arg2, Type type, String GCDCalculation, String reg1, String reg2, String reg3,
      String reg4, String reg5, String reg6) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

    // Treat a rational number as an array with 2 elements
    Labeller labeller = new Labeller("-rationalize-");
    String beginLabel = labeller.newLabel("rational-creation-begin");
    String endLabel = labeller.newLabel("rational-creation-end");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    code.add(Label, beginLabel);

    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.append(backupRegister(reg5));
    code.append(backupRegister(reg6));
    code.add(Label, backupRegisterEndLabel);

    if (type == PrimitiveType.FLOATING) {
      code.append(arg1);
      code.append(arg2);
      code.add(Duplicate);
      code.add(Duplicate);
      code.add(JumpFalse, RunTime.RATIONAL_DENOMINATOR_ZERO_ERROR);
      Macros.storeITo(code, reg6);
      code.add(ConvertF);
      code.add(FMultiply);
      code.add(ConvertI);
    }
    // [ (n//m)///(d) = int((n*d)/m) ]
    else if (type == PrimitiveType.RATIONAL) {
      // store rational address
      code.append(arg1);
      Macros.storeITo(code, reg5);

      // get n*d
      code.append(arg2);
      code.add(Duplicate);
      code.add(JumpFalse, RunTime.RATIONAL_DENOMINATOR_ZERO_ERROR);
      code.add(Duplicate);
      Macros.storeITo(code, reg6);
      code.add(PushD, reg5);
      code.add(LoadI);
      code.add(LoadI);
      code.add(Multiply);

      // get m
      code.add(PushD, reg5);
      code.add(LoadI);
      code.add(PushI, 4);
      code.add(Add);
      code.add(LoadI);

      // get int((n*d)/m)
      code.add(Divide);
    }

    Macros.storeITo(code, reg5);

    // store abs(num1) in reg1
    code.add(PushD, reg1);
    code.add(PushD, reg5);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    code.add(PushD, reg2);
    code.add(PushD, reg6);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));

    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);
    code.add(Label, endLabel);
    // leave the address of array on the accumulator

    // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg6));
    code.add(Exchange);
    code.append(restoreRegister(reg5));
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);

    return code;
  }

  // Assume rational number is n // m
  // The format to print is: a_b//c
  // a = int(n/m), b = sig(n) * (n-a*m), c = abs(m)
  // Sys: have address of rational on the stack before running
  public static ASMCodeFragment appendPrintCodeForRational(Type type,
      String addressOfRationalLabel) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    Labeller labeller = new Labeller("-print-rational-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String jumpLabel1 = labeller.newLabel("jumpLabel1");
    String jumpLabel2 = labeller.newLabel("jumpLabel2");
    String jumpLabel3 = labeller.newLabel("jumpLabel3");
    String joinLabel = labeller.newLabel("joinLabel");
    String numeratorZeroLabel = labeller.newLabel("numerator-zero");
    String avoidDuplicateLabel = labeller.newLabel("avoidDuplicateLabel");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");
    String format = PrintStatementGenerator.printFormat(type);

    code.add(Label, beginLabel);

    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(addressOfRationalLabel));
    code.add(Exchange);
    code.add(Label, backupRegisterEndLabel);

    Macros.storeITo(code, addressOfRationalLabel);

    // get interger part and print: a = int(n/m)
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(LoadI);
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(PushI, 4);
    code.add(Add);
    code.add(LoadI);
    code.add(Divide);

    // if a is not zero, print it
    code.add(Duplicate);
    code.add(Duplicate);
    code.add(JumpFalse, jumpLabel3);
    code.add(PushD, format);
    code.add(Printf);
    code.add(Jump, joinLabel);

    // if a is zero and sigh should be negative
    // then print '-'
    code.add(Label, jumpLabel3);
    code.add(Pop);
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(LoadI);
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(PushI, 4);
    code.add(Add);
    code.add(LoadI);
    code.add(Multiply);
    code.add(Duplicate);
    code.add(JumpTrue, numeratorZeroLabel);
    code.add(Pop);
    code.add(Pop);
    code.add(PushI, 0);
    code.add(PushD, format);
    code.add(Printf);
    code.add(Jump, endLabel);
    code.add(Label, numeratorZeroLabel);
    code.add(JumpPos, joinLabel);
    code.add(PushD, RunTime.MINUS_SIGN_PRINT_FORMAT);
    code.add(Printf);
    code.add(Label, joinLabel);

    // second part b = sig(n) * (n-a*m)
    // need Push a here
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(PushI, 4);
    code.add(Add);
    code.add(LoadI);
    code.add(Multiply);
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(LoadI);
    code.add(Exchange);
    code.add(Subtract);
    code.add(Duplicate);
    code.add(JumpFalse, avoidDuplicateLabel);
    code.add(Duplicate);
    code.add(Label, avoidDuplicateLabel);
    code.add(JumpFalse, endLabel);
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(LoadI);
    code.add(JumpPos, jumpLabel1);
    code.add(Negate);
    code.add(Label, jumpLabel1);
    code.add(PushD, RunTime.AND_PRINT_FORMAT);
    code.add(Printf);
    code.add(PushD, format);
    code.add(Printf);
    code.add(PushD, RunTime.OVER_PRINT_FORMAT);
    code.add(Printf);

    // third part:get abs(m)
    code.add(PushD, addressOfRationalLabel);
    code.add(LoadI);
    code.add(PushI, 4);
    code.add(Add);
    code.add(LoadI);
    code.add(Duplicate);
    code.add(JumpPos, jumpLabel2);
    code.add(Negate);
    code.add(Label, jumpLabel2);
    code.add(PushD, format);
    code.add(Printf);

    code.add(Label, endLabel);

    // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.append(restoreRegister(addressOfRationalLabel));
    code.add(Label, restoreRegisterEndLabel);

    return code;
  }

  // Due to
  public static ASMCodeFragment rationalAdd(ASMCodeFragment arg1, ASMCodeFragment arg2,
      String GCDCalculation, String reg1, String reg2, String reg3, String reg4) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Labeller labeller = new Labeller("-rational-add-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    // Formula [m//n + o//p = (mp+no)//mp]
    code.add(Label, beginLabel);

    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.add(Label, backupRegisterEndLabel);

    code.append(arg1);
    code.append(arg2);
    Macros.storeITo(code, reg3);
    Macros.storeITo(code, reg4);

    // push mp+no
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(Multiply);
    code.add(Add);

    // push np
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);

    // Store n*p in reg2 denominator
    // Store mp+no in reg1 as numerator
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // store abs(num1) in reg1
    // store num1 in reg3
    code.add(PushD, reg1);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    // store num2 in reg4
    code.add(PushD, reg2);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);
    code.add(Label, endLabel);

    // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);

    // leave the address of array on the accumulator
    return code;
  }

  public static ASMCodeFragment rationalSubtract(ASMCodeFragment arg1, ASMCodeFragment arg2,
      String GCDCalculation, String reg1, String reg2, String reg3, String reg4) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Labeller labeller = new Labeller("-rational-subtract-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    // Formula [m//n + o//p = (mp-no)//mp]
    code.add(Label, beginLabel);

    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.add(Label, backupRegisterEndLabel);

    code.append(arg1);
    code.append(arg2);
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // push mp-no
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(Multiply);
    code.add(Subtract);

    // push np
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);

    // Store n*p in reg2 denominator
    // Store mp+no in reg1 as numerator
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // store abs(num1) in reg1
    code.add(PushD, reg1);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    code.add(PushD, reg2);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);

    code.add(Label, endLabel);
    // leave the address of array on the accumulator

    return code;
  }

  public static ASMCodeFragment rationalMultiply(ASMCodeFragment arg1, ASMCodeFragment arg2,
      String GCDCalculation, String reg1, String reg2, String reg3, String reg4) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Labeller labeller = new Labeller("-rational-multiply-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    // Formula [m//n * o//p = (mo)//np]
    code.add(Label, beginLabel);

    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.add(Label, backupRegisterEndLabel);

    code.append(arg1);
    code.append(arg2);
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // push mo
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(Multiply);

    // push np
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);

    // Store n*p in reg2 denominator
    // Store mp+no in reg1 as numerator
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // store abs(num1) in reg1
    code.add(PushD, reg1);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    code.add(PushD, reg2);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);
    code.add(Label, endLabel);
    // leave the address of array on the accumulator

    return code;
  }

  public static ASMCodeFragment rationalDivide(ASMCodeFragment arg1, ASMCodeFragment arg2,
      String GCDCalculation, String reg1, String reg2, String reg3, String reg4) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Labeller labeller = new Labeller("-rational-divide-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    // Formula [m//n / o//p = (mp)//no]
    code.add(Label, beginLabel);

    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.add(Label, backupRegisterEndLabel);

    code.append(arg1);
    code.append(arg2);
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // push mp
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);

    // push no (cannot be zero)
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(Multiply);
    code.add(Duplicate);
    code.add(JumpFalse, RunTime.RATIONAL_DENOMINATOR_ZERO_ERROR);

    // Store n*p in reg2 denominator
    // Store mp+no in reg1 as numerator
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // store abs(num1) in reg1
    code.add(PushD, reg1);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    code.add(PushD, reg2);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);

    // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);

    code.add(Label, endLabel);
    // leave the address of array on the accumulator

    return code;
  }

  public static ASMCodeFragment rationalComparison(ASMCodeFragment arg1, ASMCodeFragment arg2,
      String GCDCalculation, String reg1, String reg2, String reg3, String reg4, Lextant operator) {

    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Labeller labeller = new Labeller("-rational-comparasion-");
    String beginLabel = labeller.newLabel("-begin-");
    String endLabel = labeller.newLabel("-end-");
    String getAbsForArg1 = labeller.newLabel("get-abs-for-arg1");
    String getAbsForArg2 = labeller.newLabel("get-abs-for-arg2");
    String backupRegisterBeginLabel = labeller.newLabel("backup-reg-begin");
    String backupRegisterEndLabel = labeller.newLabel("backup-reg-end");
    String restoreRegisterBeginLabel = labeller.newLabel("restore-reg-begin");
    String restoreRegisterEndLabel = labeller.newLabel("restore-reg-end");

    // Formula [m//n + o//p = (mp-no)//mp]
    code.add(Label, beginLabel);
    
    // Backup register
    code.add(Label, backupRegisterBeginLabel);
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.append(backupRegister(reg4));
    code.add(Label, backupRegisterEndLabel);
    
    code.append(arg1);
    code.append(arg2);
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // push mp-no
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushNumerator());
    code.add(Multiply);
    code.add(Subtract);

    // push np
    code.add(PushD, reg3);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(PushD, reg4);
    code.add(LoadI);
    code.append(pushDenominator());
    code.add(Multiply);

    // Store n*p in reg2 denominator
    // Store mp+no in reg1 as numerator
    Macros.storeITo(code, reg4);
    Macros.storeITo(code, reg3);

    // store abs(num1) in reg1
    code.add(PushD, reg1);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg3);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg1);
    code.add(Negate);
    code.add(Label, getAbsForArg1);
    code.add(StoreI);

    // store abs(num2) in reg2
    code.add(PushD, reg2);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(Duplicate);
    Macros.storeITo(code, reg4);
    code.add(Duplicate);
    code.add(JumpPos, getAbsForArg2);
    code.add(Negate);
    code.add(Label, getAbsForArg2);
    code.add(StoreI);

    // Call function to get GCD and store it in reg1
    code.append(backupRegister(reg1));
    code.append(backupRegister(reg2));
    code.append(backupRegister(reg3));
    code.add(Call, GCDCalculation);
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);

    // Rational number needs 8 bytes
    code.add(PushI, 8);

    // call the memory manager to get address allocated
    code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);

    // Store first integer
    code.add(Duplicate);
    code.add(PushD, reg3);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 0);

    // Store second integer
    code.add(Duplicate);
    code.add(PushD, reg4);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Divide);
    code.add(Exchange);
    Macros.writeIOffset(code, 4);
    // leave the address of array on the accumulator

    code.add(Duplicate);
    code.add(LoadI);
    code.add(Exchange);
    code.add(PushI, 4);
    code.add(Add);
    code.add(LoadI);
    code.add(Multiply);

    String trueLabel = labeller.newLabel("true");
    String falseLabel = labeller.newLabel("false");
    String joinLabel = labeller.newLabel("join");

    if (operator == Punctuator.GREATER) {
      code.add(JumpPos, trueLabel);
      code.add(Jump, falseLabel);
    } else if (operator == Punctuator.LESSER) {
      code.add(JumpNeg, trueLabel);
      code.add(Jump, falseLabel);
    } else if (operator == Punctuator.LESSEROREQUAL) {
      code.add(JumpPos, falseLabel);
      code.add(Jump, trueLabel);
    } else if (operator == Punctuator.EQUAL) {
      code.add(JumpFalse, trueLabel);
      code.add(Jump, falseLabel);
    } else if (operator == Punctuator.NOTEQUAL) {
      code.add(JumpFalse, falseLabel);
      code.add(Jump, trueLabel);
    } else if (operator == Punctuator.GREATEROREQUAL) {
      code.add(JumpNeg, falseLabel);
      code.add(Jump, trueLabel);
    }

    code.add(Label, trueLabel);
    code.add(PushI, 1);
    code.add(Jump, joinLabel);
    code.add(Label, falseLabel);
    code.add(PushI, 0);
    code.add(Jump, joinLabel);
    code.add(Label, joinLabel);
    
     // Restore register
    code.add(Label, restoreRegisterBeginLabel);
    code.add(Exchange);
    code.append(restoreRegister(reg4));
    code.add(Exchange);
    code.append(restoreRegister(reg3));
    code.add(Exchange);
    code.append(restoreRegister(reg2));
    code.add(Exchange);
    code.append(restoreRegister(reg1));
    code.add(Label, restoreRegisterEndLabel);
    
    code.add(Label, endLabel);

    return code;
  }

  public static ASMCodeFragment GCDCalculation(String funcLabel, String reg1, String reg2,
      String returnAddressPointer) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Labeller labeller = new Labeller("-GCD-Calculation-");
    String beginLabel = labeller.newLabel("-function-begin-");
    String endLabel = labeller.newLabel("-function-end-");
    String loopStartLabel = labeller.newLabel("-loop-begin-");
    String loopEndLabel = labeller.newLabel("-loop-end-");
    String positiveCaseLabel = labeller.newLabel("-positive-case-");
    String notPositiveCaseLabel = labeller.newLabel("-not-positive-case-");
    String joinLabel = labeller.newLabel("-join-");
    String checkInitialZero = labeller.newLabel("-check-initial-zero");

    code.add(Label, funcLabel);
    code.add(Label, beginLabel);

    Macros.storeITo(code, returnAddressPointer);

    // if initial case has zero, push 1 and return
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(PushD, reg2);
    code.add(LoadI);
    code.add(Multiply);
    code.add(JumpTrue, checkInitialZero);
    code.add(PushI, 1);
    code.add(Jump, endLabel);
    code.add(Label, checkInitialZero);

    code.add(Label, loopStartLabel);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Duplicate);
    code.add(JumpFalse, loopEndLabel);
    code.add(PushD, reg2);
    code.add(LoadI);
    code.add(Duplicate);
    code.add(JumpFalse, loopEndLabel);
    code.add(Subtract);
    code.add(JumpPos, positiveCaseLabel);
    code.add(Label, notPositiveCaseLabel);
    code.add(PushD, reg2);
    code.add(LoadI);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(Subtract);
    code.add(PushD, reg2);
    code.add(Exchange);
    code.add(StoreI);
    code.add(Jump, joinLabel);
    code.add(Label, positiveCaseLabel);
    code.add(PushD, reg1);
    code.add(LoadI);
    code.add(PushD, reg2);
    code.add(LoadI);
    code.add(Subtract);
    code.add(PushD, reg1);
    code.add(Exchange);
    code.add(StoreI);
    code.add(Jump, joinLabel);
    code.add(Label, joinLabel);
    code.add(Jump, loopStartLabel);
    code.add(Label, loopEndLabel);
    code.add(Add);
    code.add(Label, endLabel);

    code.add(PushD, returnAddressPointer);
    code.add(LoadI);
    code.add(Return);

    return code;
  }

  public static ASMCodeFragment pushNumerator() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Macros.readIOffset(code, 0);
    return code;
  }

  public static ASMCodeFragment pushDenominator() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    Macros.readIOffset(code, 4);
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
