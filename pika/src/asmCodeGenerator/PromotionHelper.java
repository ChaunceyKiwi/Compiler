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
  public static ASMCodeFragment codePromoteTypeAToTypeB(Type typeA, Type typeB, Object value) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
    
    // Char -> Int
    if(typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.INTEGER) {
      code.add(PushI, (char)value);
      return code;
    }
    
    // Char -> Floating
    if(typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.FLOATING) {  
      code.add(PushI, (char)value);
      code.add(ConvertF);
    }
    
    // Char -> Rational
    if(typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.RATIONAL) {      
      ASMCodeFragment arg1 =
          new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
      ASMCodeFragment arg2 =
          new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
      
      arg1.add(PushI, (char)value);
      arg2.add(PushI, 1);
      code.append(RationalHelper.performOverPuntuator(arg1, arg2, ASMCodeGenerator.GCDCalculation, ASMCodeGenerator.reg1ForFunction,
          ASMCodeGenerator.reg2ForFunction, ASMCodeGenerator.reg1, ASMCodeGenerator.reg2));
      return code;
    }
    
    // Int -> Float
    if(typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.FLOATING) {
      code.add(PushI, (int)value);
      code.add(ConvertF);
      return code;
    }
    
    // Int -> Rat
    if(typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.RATIONAL) {      
      ASMCodeFragment arg1 =
          new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
      ASMCodeFragment arg2 =
          new ASMCodeFragment(ASMCodeFragment.CodeType.GENERATES_VALUE);
      
      arg1.add(PushI, (int)value);
      arg2.add(PushI, 1);
      code.append(RationalHelper.performOverPuntuator(arg1, arg2, ASMCodeGenerator.GCDCalculation, ASMCodeGenerator.reg1ForFunction,
          ASMCodeGenerator.reg2ForFunction, ASMCodeGenerator.reg1, ASMCodeGenerator.reg2));
      return code;
    }

    return code;
  }
  
  ///////////////////////////////////////////////////////////////////////
  // Promotion not supported but casting supported
  // Following castings are allowed
  // Char -> Int , Int -> Char
  // Int -> Float , Float -> Int
  // Int -> Bool, Char -> Bool
  // selfType -> selfType
  
  public static ASMCodeFragment codeCastTypeAToTypeB(Type typeA, Type typeB) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    
    // Char -> Int
    if(typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.INTEGER) {
      return code;
    }
    
    // Int -> Char
    if(typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.CHARACTER) {
      code.add(PushI, 127);
      code.add(BTAnd);
      return code;
    }
    
    // Int -> Float
    if(typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.FLOATING) {
      code.add(ConvertF);
      return code;
    }
    
    // Float -> Int
    if(typeA == PrimitiveType.FLOATING && typeB == PrimitiveType.INTEGER) {
      code.add(ConvertI);
      return code;
    }
    
    // Int -> Bool
    if(typeA == PrimitiveType.INTEGER && typeB == PrimitiveType.BOOLEAN) {
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
    if(typeA == PrimitiveType.CHARACTER && typeB == PrimitiveType.BOOLEAN) {
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
    return code;
  }
}
