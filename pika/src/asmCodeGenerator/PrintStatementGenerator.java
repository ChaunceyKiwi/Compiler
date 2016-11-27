package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import parseTree.ParseNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.TabNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.SpaceNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.*;
import asmCodeGenerator.ASMCodeGenerator.CodeVisitor;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;

public class PrintStatementGenerator {
  ASMCodeFragment code;
  ASMCodeGenerator.CodeVisitor visitor;
  
  public PrintStatementGenerator(ASMCodeFragment code, CodeVisitor visitor) {
    super();
    this.code = code;
    this.visitor = visitor;
  }

  public void generate(PrintStatementNode node) {
    for (ParseNode child : node.getChildren()) {
      if (child instanceof NewlineNode || child instanceof SpaceNode || child instanceof TabNode) {
        ASMCodeFragment childCode = visitor.removeVoidCode(child);
        code.append(childCode);
      } else if (child.getType() instanceof ArrayType) {
        code.append(visitor.removeValueCode(child));
        code.append(ArrayHelper.arrayPrint((ArrayType) child.getType(), ASMCodeGenerator.reg1));
      } else if (child.getType() == PrimitiveType.RATIONAL) {
        code.append(visitor.removeValueCode(child));
        code.append(RationalHelper.appendPrintCodeForRational(child.getType(), ASMCodeGenerator.reg1));
      } else if (child.getType() == PrimitiveType.STRING) {
        code.append(visitor.removeValueCode(child));
        code.append(StringHelper.stringPrint(ASMCodeGenerator.reg1));
      }
      else {
        appendPrintCode(child);
      }
    }
  }

  private void appendPrintCode(ParseNode node) {
    String format;

    if (node.getType() instanceof LambdaType) {
      format = printFormat(node.getType());
      code.add(PushD, RunTime.LAMBDATYPE_STRING);
    } else {
      format = printFormat(node.getType());
      code.append(visitor.removeValueCode(node));
    }
    convertToStringIfBoolean(node);
    code.add(PushD, format);
    code.add(Printf);
  }


  private void convertToStringIfBoolean(ParseNode node) {
    if (node.getType() != PrimitiveType.BOOLEAN) {
      return;
    }

    Labeller labeller = new Labeller("print-boolean");
    String trueLabel = labeller.newLabel("true");
    String endLabel = labeller.newLabel("join");

    code.add(JumpTrue, trueLabel);
    code.add(PushD, RunTime.BOOLEAN_FALSE_STRING);
    code.add(Jump, endLabel);
    code.add(Label, trueLabel);
    code.add(PushD, RunTime.BOOLEAN_TRUE_STRING);
    code.add(Label, endLabel);
  }


  public static String printFormat(Type type) {
    if (type instanceof LambdaType) {
      return RunTime.STRING_PRINT_FORMAT;
    }

    switch ((PrimitiveType) type) {
      case INTEGER:
        return RunTime.INTEGER_PRINT_FORMAT;
      case RATIONAL:
        return RunTime.INTEGER_PRINT_FORMAT;
      case BOOLEAN:
        return RunTime.BOOLEAN_PRINT_FORMAT;
      case FLOATING:
        return RunTime.FLOATING_PRINT_FORMAT;
      case CHARACTER:
        return RunTime.CHAR_PRINT_FORMAT;
      case STRING:
        return RunTime.STRING_PRINT_FORMAT;

      default:
        assert false : "Type " + type + " unimplemented in PrintStatementGenerator.printFormat()";
        return "";
    }
  }
}
