package optimizer;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;

import java.util.HashSet;
import java.util.Set;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMInstruction;
import asmCodeGenerator.codeStorage.ASMOpcode;

public class CodeFolder {
  private Set<Tuple<String, Integer>> pushISet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> pushFSet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> duplicateSet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> jumpFalseOrFZeroSet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> integerBinaryOperatorSet =
      new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> floatBinaryOperatorSet =
      new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> integerUnaryOperatorSet =
      new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> floatUnaryOperatorSet = new HashSet<Tuple<String, Integer>>();
  private Set<Triplet<Integer, Integer, ASMInstruction>> replaceSet =
      new HashSet<Triplet<Integer, Integer, ASMInstruction>>();

  public ASMCodeFragment foldCode(ASMCodeFragment fragment) {
    buildPushISet(fragment);
    buildPushFSet(fragment);
    buildDuplicateSet(fragment);
    buildJumpFalseOrFZeroSet(fragment);
    buildIntegerBinaryOperatorSet(fragment);
    buildFloatBinaryOperatorSet(fragment);
    buildIntegerUnaryOperatorSet(fragment);
    buildFloatUnaryOperatorSet(fragment);
    foldSetBuildForIntegerConstant(fragment);
    foldSetBuildForFloatConstant(fragment);
    return performFolding(fragment);
  }

  private ASMCodeFragment performFolding(ASMCodeFragment fragment) {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    // Replace first instruction in the replacement set
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        if (isRangeStartInReplaceSet(lineNumCount, replaceSet)) {
          fragment.chunks.get(i).instructions.set(j,
              getReplacementByRangeStartIndex(lineNumCount, replaceSet));
        }
        lineNumCount++;
      }
    }
    
    // Delete remain instructions in the repalcement set
    lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (!isInRangeExceptStartInReplaceSet(lineNumCount, replaceSet)) {
          code.add(instruction);
        }
        lineNumCount++;
      }
    }
    
    return code;
  }

  private void foldSetBuildForIntegerConstant(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        String op1 = getTupleSet(lineNumCount, pushISet);
        String op2 = getTupleSet(lineNumCount + 1, pushISet);
        String operator = getTupleSet(lineNumCount + 2, integerBinaryOperatorSet);

        if (op1 != null && op2 != null && operator != null) {
          int op1Value = Integer.parseInt(op1);
          int op2Value = Integer.parseInt(op2);
          int newValue = 0;
          if (operator.equals("Add")) {
            newValue = op1Value + op2Value;
          } else if (operator.equals("Subtract")) {
            newValue = op1Value - op2Value;
          } else if (operator.equals("Multiply")) {
            newValue = op1Value * op2Value;
          } else if (operator.equals("Divide")) {
            newValue = op1Value / op2Value;
          }
          ASMInstruction instruction = new ASMInstruction(ASMOpcode.PushI, newValue);
          replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
              lineNumCount + 2, instruction));
          lineNumCount += 3;
          continue;
        } else {
          String duplicate = getTupleSet(lineNumCount + 2, duplicateSet);
          String jump = getTupleSet(lineNumCount + 3, jumpFalseOrFZeroSet);
          operator = getTupleSet(lineNumCount + 4, integerBinaryOperatorSet);
          if (op1 != null && op2 != null && duplicate != null && jump != null && operator != null) {
            if (operator.equals("Divide")) {
              int op1Value = Integer.parseInt(op1);
              int op2Value = Integer.parseInt(op2);
              if (op2Value == 0) {
                ASMInstruction instruction = new ASMInstruction(ASMOpcode.Jump, jump);
                replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                    lineNumCount + 4, instruction));
                lineNumCount += 5;
                continue;
              } else {
                ASMInstruction instruction =
                    new ASMInstruction(ASMOpcode.PushI, op1Value / op2Value);
                replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                    lineNumCount + 4, instruction));
                lineNumCount += 5;
                continue;
              }
            }
          }
        }
        op2 = getTupleSet(lineNumCount + 1, integerUnaryOperatorSet);
        if (op1 != null && op2 != null) {
          int op1Value = Integer.parseInt(op1);
          if (op2.equals("Negate")) {
            ASMInstruction instruction = new ASMInstruction(ASMOpcode.PushI, -1 * op1Value);
            replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                lineNumCount + 1, instruction));
            lineNumCount += 2;
            continue;
          } else if (op2.equals("ConvertF")) {
            ASMInstruction instruction = new ASMInstruction(ASMOpcode.PushF, (float) op1Value);
            replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                lineNumCount + 1, instruction));
            lineNumCount += 2;
            continue;
          }
        }

        lineNumCount++;
      }
    }
  }

  private void foldSetBuildForFloatConstant(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        String op1 = getTupleSet(lineNumCount, pushFSet);
        String op2 = getTupleSet(lineNumCount + 1, pushFSet);
        String operator = getTupleSet(lineNumCount + 2, floatBinaryOperatorSet);

        if (op1 != null && op2 != null && operator != null) {
          float op1Value = Float.parseFloat(op1);
          float op2Value = Float.parseFloat(op2);
          float newValue = 0;
          if (operator.equals("FAdd")) {
            newValue = op1Value + op2Value;
          } else if (operator.equals("FSubtract")) {
            newValue = op1Value - op2Value;
          } else if (operator.equals("FMultiply")) {
            newValue = op1Value * op2Value;
          } else if (operator.equals("FDivide")) {
            newValue = op1Value / op2Value;
          }
          ASMInstruction instruction = new ASMInstruction(ASMOpcode.PushF, newValue);
          replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
              lineNumCount + 2, instruction));
          lineNumCount += 3;
          continue;
        } else {
          String duplicate = getTupleSet(lineNumCount + 2, duplicateSet);
          String jump = getTupleSet(lineNumCount + 3, jumpFalseOrFZeroSet);
          operator = getTupleSet(lineNumCount + 4, floatBinaryOperatorSet);
          if (op1 != null && op2 != null && duplicate != null && jump != null && operator != null) {
            if (operator.equals("FDivide")) {
              float op1Value = Float.parseFloat(op1);
              float op2Value = Float.parseFloat(op2);
              if (op2Value == 0) {
                ASMInstruction instruction = new ASMInstruction(ASMOpcode.Jump, jump);
                replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                    lineNumCount + 4, instruction));
                lineNumCount += 5;
                continue;
              } else {
                ASMInstruction instruction =
                    new ASMInstruction(ASMOpcode.PushF, op1Value / op2Value);
                replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                    lineNumCount + 4, instruction));
                lineNumCount += 5;
                continue;
              }
            }
          }
        }
        op2 = getTupleSet(lineNumCount + 1, floatUnaryOperatorSet);
        if (op1 != null && op2 != null) {
          float op1Value = Float.parseFloat(op1);
          if (op2.equals("FNegate")) {
            ASMInstruction instruction = new ASMInstruction(ASMOpcode.PushF, -1 * op1Value);
            replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                lineNumCount + 1, instruction));
            lineNumCount += 2;
            continue;
          } else if (op2.equals("ConvertI")) {
            ASMInstruction instruction = new ASMInstruction(ASMOpcode.PushI, (int) op1Value);
            replaceSet.add(new Triplet<Integer, Integer, ASMInstruction>(lineNumCount,
                lineNumCount + 1, instruction));
            lineNumCount += 2;
            continue;
          }
        }
        lineNumCount++;
      }
    }
  }

  private String getTupleSet(int lineNumber, Set<Tuple<String, Integer>> set) {
    for (Tuple<String, Integer> elem : set) {
      if (elem.y == lineNumber) {
        return elem.x;
      }
    }
    return null;
  }

  private boolean isRangeStartInReplaceSet(int lineNumber,
      Set<Triplet<Integer, Integer, ASMInstruction>> set) {
    for (Triplet<Integer, Integer, ASMInstruction> elem : set) {
      if (elem.x == lineNumber) {
        return true;
      }
    }
    return false;
  }
  
  private boolean isInRangeExceptStartInReplaceSet(int lineNumber,
      Set<Triplet<Integer, Integer, ASMInstruction>> set) {
    for (Triplet<Integer, Integer, ASMInstruction> elem : set) {
      if ((lineNumber >= (elem.x + 1)) && (lineNumber <= elem.y)) {
        return true;
      }
    }
    return false;
  }

  private ASMInstruction getReplacementByRangeStartIndex(int lineNumber,
      Set<Triplet<Integer, Integer, ASMInstruction>> set) {
    for (Triplet<Integer, Integer, ASMInstruction> elem : set) {
      if (elem.x == lineNumber) {
        return elem.z;
      }
    }
    return null;
  }

  private void buildJumpFalseOrFZeroSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.JumpFalse
            || instruction.getOpcode() == ASMOpcode.JumpFZero) {
          jumpFalseOrFZeroSet
              .add(new Tuple<String, Integer>(instruction.getArgument().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildDuplicateSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.Duplicate) {
          duplicateSet
              .add(new Tuple<String, Integer>(instruction.getOpcode().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildPushISet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.PushI) {
          pushISet
              .add(new Tuple<String, Integer>(instruction.getArgument().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildPushFSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.PushF) {
          pushFSet
              .add(new Tuple<String, Integer>(instruction.getArgument().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildIntegerBinaryOperatorSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.Add
            || instruction.getOpcode() == ASMOpcode.Subtract
            || instruction.getOpcode() == ASMOpcode.Multiply
            || instruction.getOpcode() == ASMOpcode.Divide) {
          integerBinaryOperatorSet
              .add(new Tuple<String, Integer>(instruction.getOpcode().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildFloatBinaryOperatorSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.FAdd
            || instruction.getOpcode() == ASMOpcode.FSubtract
            || instruction.getOpcode() == ASMOpcode.FMultiply
            || instruction.getOpcode() == ASMOpcode.FDivide) {
          floatBinaryOperatorSet
              .add(new Tuple<String, Integer>(instruction.getOpcode().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildIntegerUnaryOperatorSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.Negate
            || instruction.getOpcode() == ASMOpcode.ConvertF) {
          integerUnaryOperatorSet
              .add(new Tuple<String, Integer>(instruction.getOpcode().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildFloatUnaryOperatorSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.FNegate
            || instruction.getOpcode() == ASMOpcode.ConvertI) {
          floatUnaryOperatorSet
              .add(new Tuple<String, Integer>(instruction.getOpcode().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }
}
