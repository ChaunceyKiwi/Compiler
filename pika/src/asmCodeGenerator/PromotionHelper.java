package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import semanticAnalyzer.types.*;
import asmCodeGenerator.codeStorage.ASMCodeFragment;

public class PromotionHelper {

  ///////////////////////////////////////////////////////////////////////
  // Promotion supported
  // Following promotion are allowed
  // Char -> Int, Char -> Float, Char -> Rat
  // Int -> Float , Int -> Rat

  public static ASMCodeFragment codePromoteTypeAToTypeB(Type typeA, Type typeB, ASMCodeFragment value) {
    // Char -> Int
    if (typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.INTEGER) {
      return value;
    }

    // Char -> Floating
    if (typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.FLOATING) {
      value.add(ConvertF);
      return value;
    }

    // Char -> Rational
    if (typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.RATIONAL) {
      ASMCodeFragment arg2 = new ASMCodeFragment(GENERATES_VALUE);
      arg2.add(PushI, 1);
      
      value = RationalHelper.performOverPuntuator(value, arg2, ASMCodeGenerator.GCDCalculation,
          ASMCodeGenerator.reg1, ASMCodeGenerator.reg2, ASMCodeGenerator.reg3,
          ASMCodeGenerator.reg4);
      return value;
    }

    // Int -> Float
    if (typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.FLOATING) {
      value.add(ConvertF);
      return value;
    }

    // Int -> Rat
    if (typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.RATIONAL) {
      ASMCodeFragment arg2 = new ASMCodeFragment(GENERATES_VALUE);
      arg2.add(PushI, 1);
      value = RationalHelper.performOverPuntuator(value, arg2, ASMCodeGenerator.GCDCalculation,
          ASMCodeGenerator.reg1, ASMCodeGenerator.reg2, ASMCodeGenerator.reg3,
          ASMCodeGenerator.reg4);
      return value;
    }
    
    // If no promotion
    return value;
  }

  ///////////////////////////////////////////////////////////////////////
  // Promotion not supported but casting supported
  // Following castings are allowed
  // Char -> Int , Int -> Char
  // Int -> Float , Float -> Int
  // Int -> Bool, Char -> Bool
  // selfType -> selfType
  // Rat -> Int, Rat-> Float
  // Char -> Rat, Int -> Rat, Float -> Rat


  public static ASMCodeFragment codeCastTypeAToTypeB(Type typeA, Type typeB,
      ASMCodeFragment value) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    // Char -> Int
    if (typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.INTEGER) {
      code.append(value);
      return code;
    }

    // Int -> Char
    if (typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.CHARACTER) {
      code.append(value);
      code.add(PushI, 127);
      code.add(BTAnd);
      return code;
    }

    // Int -> Float
    if (typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.FLOATING) {
      code.append(value);
      code.add(ConvertF);
      return code;
    }

    // Float -> Int
    if (typeA == PrimitiveType.FLOATING && typeB == PrimitiveType.INTEGER) {
      code.append(value);
      code.add(ConvertI);
      return code;
    }

    // Int -> Bool
    if (typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.BOOLEAN) {
      code.append(value);

      Labeller labeller = new Labeller("-casting-");
      String trueLabel = labeller.newLabel("true");
      String joinLabel = labeller.newLabel("join");

      code.add(JumpTrue, trueLabel);
      code.add(PushI, 0);
      code.add(Jump, joinLabel);
      code.add(Label, trueLabel);
      code.add(PushI, 1);
      code.add(Label, joinLabel);
      return code;
    }

    // Char -> Bool
    if (typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.BOOLEAN) {
      code.append(value);

      Labeller labeller = new Labeller("-casting-");
      String trueLabel = labeller.newLabel("true");
      String joinLabel = labeller.newLabel("join");

      code.add(JumpTrue, trueLabel);
      code.add(PushI, 0);
      code.add(Jump, joinLabel);
      code.add(Label, trueLabel);
      code.add(PushI, 1);
      code.add(Label, joinLabel);
      return code;
    }

    // Rat -> Int
    if (typeA == PrimitiveType.RATIONAL && typeB == PrimitiveType.INTEGER) {
      code.append(value);
      code.add(Duplicate);
      code.append(RationalHelper.pushNumerator());
      code.add(Exchange);
      code.append(RationalHelper.pushDenominator());
      code.add(Divide);
      return code;
    }

    // Rat -> Float
    if (typeA == PrimitiveType.RATIONAL && typeB == PrimitiveType.FLOATING) {
      code.append(value);
      code.add(Duplicate);
      code.append(RationalHelper.pushNumerator());
      code.add(ConvertF);
      code.add(Exchange);
      code.append(RationalHelper.pushDenominator());
      code.add(ConvertF);
      code.add(FDivide);
      return code;
    }

    // Char -> Rat
    if (typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.RATIONAL) {
      ASMCodeFragment arg2 = new ASMCodeFragment(GENERATES_VALUE);
      arg2.add(PushI, 1);

      code.append(RationalHelper.performOverPuntuator(value, arg2, ASMCodeGenerator.GCDCalculation,
          ASMCodeGenerator.reg1, ASMCodeGenerator.reg2, ASMCodeGenerator.reg3,
          ASMCodeGenerator.reg4));
      return code;
    }

    // Int -> Rat
    if (typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.RATIONAL) {
      ASMCodeFragment arg2 = new ASMCodeFragment(GENERATES_VALUE);
      arg2.add(PushI, 1);

      code.append(RationalHelper.performOverPuntuator(value, arg2, ASMCodeGenerator.GCDCalculation,
          ASMCodeGenerator.reg1, ASMCodeGenerator.reg2, ASMCodeGenerator.reg3,
          ASMCodeGenerator.reg4));
      return code;
    }

    // Float -> Rat
    if (typeA == PrimitiveType.FLOATING && typeB == PrimitiveType.RATIONAL) {
      ASMCodeFragment arg2 = new ASMCodeFragment(GENERATES_VALUE);
      arg2.add(PushI, 223092870); // magic number

      code.append(RationalHelper.performRationalizePuntuator(value, arg2, PrimitiveType.FLOATING,
          ASMCodeGenerator.GCDCalculation, ASMCodeGenerator.reg1, ASMCodeGenerator.reg2,
          ASMCodeGenerator.reg3, ASMCodeGenerator.reg4, ASMCodeGenerator.reg5,
          ASMCodeGenerator.reg6));
      return code;
    }

    return code;
  }
}
