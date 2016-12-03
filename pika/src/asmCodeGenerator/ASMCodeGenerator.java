package asmCodeGenerator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.FunctionStorage;
import asmCodeGenerator.ArrayHelper;
import asmCodeGenerator.RationalHelper;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.*;
import symbolTable.Binding;
import symbolTable.Binding.BindingType;
import symbolTable.Scope;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
  ParseNode root;
  static String functionPrefix = "$function-";
  static String functionBodyExit = "-function-body-exit";
  static String reg1ForFunction = "reg1-func";
  static String reg2ForFunction = "reg2-func";
  static String reg1 = "reg1-system";
  static String reg2 = "reg2-system";
  static String reg3 = "reg3-system";
  static String reg4 = "reg4-system";
  static String reg5 = "reg5-system";
  static String regCounter = "reg-counter";
  static String regLooper = "reg-looper";
  static String regSequence = "reg-sequence";
  static String regIdentifier = "reg-identifier";
  static String GCDCalculation = "GCDCalculation";

  public static ASMCodeFragment generate(ParseNode syntaxTree) {
    ASMCodeGenerator codeGenerator = new ASMCodeGenerator(syntaxTree);
    return codeGenerator.makeASM();
  }

  public ASMCodeGenerator(ParseNode root) {
    super();
    this.root = root;
  }

  public ASMCodeFragment makeASM() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    code.append(MemoryManager.codeForInitialization());
    code.append(FrameStackInitialization());
    code.append(RunTime.getEnvironment());
    code.append(globalVariableBlockASM());
    code.append(programASM());
    code.append(MemoryManager.codeForAfterApplication());
    code.append(FunctionStorage.GCDCalculation(GCDCalculation, reg1ForFunction, reg2ForFunction));
    return code;
  }

  private ASMCodeFragment FrameStackInitialization() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    Macros.declareI(code, RunTime.FRAME_POINTER);
    Macros.declareI(code, RunTime.STACK_POINTER);
    code.add(Memtop);
    code.add(Duplicate);
    Macros.storeITo(code, RunTime.FRAME_POINTER);
    Macros.storeITo(code, RunTime.STACK_POINTER);
    return code;
  }

  private ASMCodeFragment globalVariableBlockASM() {
    assert root.hasScope();
    Scope scope = root.getScope();
    int globalBlockSize = scope.getAllocatedSize();
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    code.add(DLabel, RunTime.GLOBAL_MEMORY_BLOCK);
    code.add(DataZ, globalBlockSize);
    createRegister(code, reg1ForFunction);
    createRegister(code, reg2ForFunction);
    createRegister(code, reg1);
    createRegister(code, reg2);
    createRegister(code, reg3);
    createRegister(code, reg4);
    createRegister(code, reg5);
    createRegister(code, regCounter);
    createRegister(code, regLooper);
    createRegister(code, regSequence);
    createRegister(code, regIdentifier);
    return code;
  }

  public static void createRegister(ASMCodeFragment code, String label) {
    code.add(DLabel, label);
    code.add(DataI, 0);
  }

  private ASMCodeFragment programASM() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    code.append(programCode());
    return code;
  }

  private ASMCodeFragment programCode() {
    CodeVisitor visitor = new CodeVisitor();
    root.accept(visitor);
    return visitor.removeRootCode(root);
  }

  protected class CodeVisitor extends ParseNodeVisitor.Default {
    private Map<ParseNode, ASMCodeFragment> codeMap;
    ASMCodeFragment code;

    public CodeVisitor() {
      codeMap = new HashMap<ParseNode, ASMCodeFragment>();
    }

    ////////////////////////////////////////////////////////////////////
    // Make the field "code" refer to a new fragment of different sorts.
    private void newAddressCode(ParseNode node) {
      code = new ASMCodeFragment(GENERATES_ADDRESS);
      codeMap.put(node, code);
    }

    private void newValueCode(ParseNode node) {
      code = new ASMCodeFragment(GENERATES_VALUE);
      codeMap.put(node, code);
    }

    private void newVoidCode(ParseNode node) {
      code = new ASMCodeFragment(GENERATES_VOID);
      codeMap.put(node, code);
    }

    ////////////////////////////////////////////////////////////////////
    // Get code from the map.
    private ASMCodeFragment getAndRemoveCode(ParseNode node) {
      ASMCodeFragment result = codeMap.get(node);
      codeMap.remove(result);
      return result;
    }

    public ASMCodeFragment removeRootCode(ParseNode tree) {
      return getAndRemoveCode(tree);
    }

    public ASMCodeFragment removeBlockCode(ParseNode tree) {
      return getAndRemoveCode(tree);
    }

    public ASMCodeFragment removeValueCode(ParseNode node) {
      ASMCodeFragment frag = getAndRemoveCode(node);
      makeFragmentValueCode(frag, node);
      return frag;
    }

    private ASMCodeFragment removeAddressCode(ParseNode node) {
      ASMCodeFragment frag = getAndRemoveCode(node);
      assert frag.isAddress();
      return frag;
    }

    ASMCodeFragment removeVoidCode(ParseNode node) {
      ASMCodeFragment frag = getAndRemoveCode(node);
      assert frag.isVoid();
      return frag;
    }

    ////////////////////////////////////////////////////////////////////
    // convert code to value-generating code.
    private void makeFragmentValueCode(ASMCodeFragment code, ParseNode node) {
      assert !code.isVoid();

      if (code.isAddress()) {
        turnAddressIntoValue(code, node);
      }
    }

    private void turnAddressIntoValue(ASMCodeFragment code, ParseNode node) {
      Type currentType = node.getType();
      Type originalType = node.getOriginalType();
      Type type;

      if (originalType != PrimitiveType.NO_TYPE) {
        type = originalType;
      } else {
        type = currentType;
      }

      if (type == PrimitiveType.INTEGER) {
        code.add(LoadI);
      } else if (type == PrimitiveType.BOOLEAN) {
        code.add(LoadC);
      } else if (type == PrimitiveType.FLOATING) {
        code.add(LoadF);
      } else if (type == PrimitiveType.CHARACTER) {
        code.add(LoadC);
      } else if (type == PrimitiveType.STRING) {
        code.add(LoadI);
      } else if (type == PrimitiveType.RATIONAL) {
        code.add(LoadI);
      } else if (type.isReferenceType()) {
        code.add(LoadI);
      } else {
        assert false : "node " + node;
      }

      if (currentType != PrimitiveType.VOID && originalType != PrimitiveType.NO_TYPE
          && originalType != currentType) {
        code.append(PromotionHelper.codePromoteTypeAToTypeB(originalType, currentType));
      }

      code.markAsValue();
    }

    ////////////////////////////////////////////////////////////////////
    // ensures all types of ParseNode in given AST have at least a visitLeave
    public void visitLeave(ParseNode node) {
      assert false : "node " + node + " not handled in ASMCodeGenerator";
    }

    ///////////////////////////////////////////////////////////////////////////
    // constructs larger than statements
    // Program -> globalDefinition exec blockStatement(main)
    public void visitLeave(ProgramNode node) {
      newVoidCode(node);

      for (ParseNode child : node.getChildren()) {
        // main function start
        if (child instanceof BlockStatementNode) {
          code.add(Label, RunTime.MAIN_PROGRAM_LABEL);
        }

        ASMCodeFragment childCode = removeVoidCode(child);
        code.append(childCode);

        // main function end
        if (child instanceof BlockStatementNode) {
          code.add(Halt);
        }
      }
    }

    public void visitEnter(BlockStatementNode node) {
      if (node.getParent() instanceof LambdaNode) {
        Labeller labeller = new Labeller("-block-statement-");
        String endLabel = labeller.newLabel("end-of-block-statement");
        node.setTargetLabel(endLabel);
      }
    }

    public void visitLeave(BlockStatementNode node) {
      newVoidCode(node);
      for (ParseNode child : node.getChildren()) {
        ASMCodeFragment childCode = removeVoidCode(child);
        code.append(childCode);
      }
      if (node.getTargetLabel() != null) {
        code.add(Label, node.getTargetLabel());
      }
    }

    ///////////////////////////////////////////////////////////////////////////
    // Function Related
    public void visitLeave(GlobalDefinitionNode node) {
      newVoidCode(node);
      for (ParseNode child : node.getChildren()) {
        ASMCodeFragment childCode = removeVoidCode(child);
        code.append(childCode);
      }
    }

    public void visitLeave(FunctionDefinitionNode node) {
      newVoidCode(node);
      code.append(removeVoidCode(node.child(1)));
    }

    public void visitLeave(LambdaNode node) {
      ParseNode parentNode = node.getParent();
      Labeller labeller = new Labeller("lambda-definition");
      String endLabel = labeller.newLabel("end");
      String functionName = null;
      Type resultType = node.getLambdaType().getResultType();

      // FunctionDefinitionNode or DeclarationNode
      if (parentNode instanceof FunctionDefinitionNode) {
        newVoidCode(node);
        functionName = parentNode.child(0).getToken().getLexeme();
      } else {
        newValueCode(node);
        functionName = labeller.newLabel("Lambda");
      }

      node.setFunctionLabel(functionPrefix + functionName);
      code.add(Jump, endLabel);
      code.add(Label, functionPrefix + functionName);
      functionPreparation(labeller);
      functionProcess(labeller, node);
      functionLaterStage(labeller, node, resultType);
      code.add(Label, endLabel);
      if (!(node.getParent() instanceof FunctionDefinitionNode)) {
        code.add(PushD, node.getFunctionLabel());
      }
    }

    public void functionPreparation(Labeller labeller) {
      String dynamicLinkLabel = labeller.newLabel("dynamic-link");
      String returnAddressLabel = labeller.newLabel("return-address");
      String moveFPtoSPLabel = labeller.newLabel("move-fp-to-sp");

      // store FP at SP-4 as dynamic link
      code.add(Label, dynamicLinkLabel);
      Macros.loadIFrom(code, RunTime.FRAME_POINTER);
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      Macros.writeIOffset(code, -4);

      // Store return address at SP-8
      code.add(Label, returnAddressLabel);
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      Macros.writeIOffset(code, -8);

      // Move FP to SP (Store SP at FP)
      code.add(Label, moveFPtoSPLabel);
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      Macros.storeITo(code, RunTime.FRAME_POINTER);
    }

    public void functionProcess(Labeller labeller, LambdaNode node) {
      BlockStatementNode blockStatementNode = (BlockStatementNode) node.child(1);
      ASMCodeFragment blockStatementCode = removeVoidCode(blockStatementNode);
      String subtractFrameSizeLabel = labeller.newLabel("subtract-frame-size");
      String functionBodyProcessLabel = labeller.newLabel("function-body-process");
      int procedureScopeSize = node.child(1).getScope().getAllocatedSize();

      // The size of the frame for barge() is subtracted from the stack pointer
      code.add(Label, subtractFrameSizeLabel);
      decrementStackPointer(procedureScopeSize);

      // Function body is inserted here, which might contain return statement
      code.add(Label, functionBodyProcessLabel);
      code.append(blockStatementCode);
    }

    public void functionLaterStage(Labeller labeller, LambdaNode node, Type resultType) {
      String pushReturnAddressLabel = labeller.newLabel("push-return-address");
      String replaceFramePointerLabel = labeller.newLabel("replace-frame-pointer");
      String incrementSP = labeller.newLabel("increment-stack-pointer");
      String decrementSP = labeller.newLabel("decrement-stack-pointer");
      int parameterScopeSize = node.getScope().getAllocatedSize();
      int procedureScopeSize = node.child(1).getScope().getAllocatedSize();

      // Push return address (at FP - 8) to ASM stack
      code.add(Label, pushReturnAddressLabel);
      Macros.loadIFrom(code, RunTime.FRAME_POINTER);
      Macros.readIOffset(code, -8);

      // Replace FP with dynamic link (at FP - 4)
      // Store *(FP - 4) at FP
      code.add(Label, replaceFramePointerLabel);
      Macros.loadIFrom(code, RunTime.FRAME_POINTER);
      Macros.readIOffset(code, -4);
      Macros.storeITo(code, RunTime.FRAME_POINTER);

      // Increment SP by the size of parameter scope and procedure scope
      // incrementStackPointer(parameterScope.size() + procedureScope.size());
      code.add(Label, incrementSP);
      incrementStackPointer(parameterScopeSize + procedureScopeSize);

      // If there is no return value, do not need to store anything
      if (resultType != PrimitiveType.VOID) {
        // Exchange to put return value at the top of the ASM stack
        code.add(Exchange);

        // Decrement SP by the size of return value and store it
        code.add(Label, decrementSP);
        decrementStackPointer(4);
        Macros.loadIFrom(code, RunTime.STACK_POINTER);

        code.add(Exchange);
        code.add(opcodeForStore(resultType));
      }

      code.add(Return);
    }

    public void visitEnter(FunctionInvocationNode node) {
      Labeller labeller = new Labeller("function-invocation");
      node.setBeginLabel(labeller.newLabel("begin"));
      node.setEndLabel(labeller.newLabel("end"));
      node.setCallLabel(labeller.newLabel("call"));
    }

    public void visitLeave(FunctionInvocationNode node) {
      String beginLabel = node.getBeginLabel();
      String endLabel = node.getEndLabel();
      Type originalType = node.getOriginalType();
      Type currentType = node.getType();
      Type type;
      if (originalType != PrimitiveType.NO_TYPE) {
        type = originalType;
      } else {
        type = currentType;
      }

      // Type of code depends
      if (type == PrimitiveType.VOID) {
        newVoidCode(node);
      } else {
        newValueCode(node);
      }

      ParseNode expressionNode = node.child(0);
      ParseNode exprList = node.child(1);

      code.add(Label, beginLabel);

      // Push parameters needed for function into frame stack
      for (int i = 0; i < exprList.nChildren(); i++) {
        ParseNode expr = exprList.child(i);
        ASMCodeFragment exprCode = removeValueCode(expr);
        code.append(exprCode);
        pushElementToFrameStack(expr.getType());
      }

      // Call function body here
      // Either LambdaNode, IdentifierNode or Array

      // functionInvocation -> Lambda (expressionList)
      if (expressionNode instanceof LambdaNode) {
        code.append(removeValueCode(expressionNode));
        code.add(Call, ((LambdaNode) expressionNode).getFunctionLabel());
      }
      // functionInvocation -> Identifier (expressionList)
      // Identifier here should be declared in global statement
      else if (expressionNode instanceof IdentifierNode && ((IdentifierNode) expressionNode)
          .getBinding().getBindingType() == Binding.BindingType.FUNCTION) {
        code.append(removeVoidCode(expressionNode));
      }

      // ArrayElement, some other identifer that is not declared in global scope
      // The value of the identifier binding to is the location of function code
      else {
        code.append(removeValueCode(expressionNode));
        code.add(CallV);
      }

      // take the return value from the location pointed at
      // by the stack counter and place it on the ASM stack
      if (type != PrimitiveType.VOID) {
        popElementFromFrameToASMStack(type);
      }

      addPromotionCodeIfNeeded(node);

      code.add(Label, endLabel);
    }

    private void addPromotionCodeIfNeeded(ParseNode node) {
      Type originalType = node.getOriginalType();
      Type currentType = node.getType();

      if (currentType != PrimitiveType.VOID && originalType != PrimitiveType.NO_TYPE
          && originalType != currentType) {
        code.append(PromotionHelper.codePromoteTypeAToTypeB(originalType, currentType));
      }
    }

    // pop element from frame stack and increment SP
    public void popElementFromFrameToASMStack(Type type) {
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      code.add(opcodeForLoad(type));
      incrementStackPointer(type.getSize());
    }

    public void incrementStackPointer(int size) {
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      code.add(PushI, size);
      code.add(Add);
      Macros.storeITo(code, RunTime.STACK_POINTER);
    }

    public void decrementStackPointer(int size) {
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      code.add(PushI, size);
      code.add(Subtract);
      Macros.storeITo(code, RunTime.STACK_POINTER);
    }

    public void pushElementToFrameStack(Type type) {
      // Need a push before function
      // Pre-decrement style (get new address)
      decrementStackPointer(type.getSize());

      // Store the element into the address
      Macros.loadIFrom(code, RunTime.STACK_POINTER);
      code.add(Exchange);
      code.add(opcodeForStore(type));
    }

    ///////////////////////////////////////////////////////////////////////////
    // Statements Related
    /* statements -> blockStatement */
    /* printStatement */
    /* declaration */
    /* assignmentStatement */
    /* ifStatement */
    /* whileStatement */
    /* releaseStatement */
    /* returnStatement */
    /* callStatement */
    /* breakStatement */
    /* continueStatement */

    // PrintStatement
    public void visitLeave(PrintStatementNode node) {
      newVoidCode(node);
      new PrintStatementGenerator(code, this).generate(node);
    }

    // Declaration
    public void visitLeave(DeclarationNode node) {
      newVoidCode(node);
      Type type = node.getType();
      ASMCodeFragment lvalue = removeAddressCode(node.child(0));
      ASMCodeFragment rvalue = removeValueCode(node.child(1));

      code.append(lvalue);
      code.append(rvalue);
      code.add(opcodeForStore(type));
    }

    // AssignmentStatement
    public void visitLeave(AssignmentStatementNode node) {
      newVoidCode(node);
      Type type = node.getType();
      ASMCodeFragment lvalue = removeAddressCode(node.child(0));
      ASMCodeFragment rvalue = removeValueCode(node.child(1));
      code.append(lvalue);
      code.append(rvalue);
      code.add(opcodeForStore(type));
    }

    // IfStatement
    public void visitLeave(IfStatementNode node) {
      newVoidCode(node);
      ASMCodeFragment booleanResult = removeValueCode(node.child(0));
      ASMCodeFragment trueDoStatement = removeBlockCode(node.child(1));
      Labeller labeller = new Labeller("-if-statement-");
      String beginLabel = labeller.newLabel("begin");
      String falseDoStatementLabel = labeller.newLabel("false-do-expression");
      String endOfIfStatementLabel = labeller.newLabel("end-of-if-statement");

      code.append(booleanResult);
      code.add(Label, beginLabel);
      if (node.nChildren() == 3)
        code.add(JumpFalse, falseDoStatementLabel);
      else
        code.add(JumpFalse, endOfIfStatementLabel);
      code.append(trueDoStatement);
      code.add(Jump, endOfIfStatementLabel);
      if (node.nChildren() == 3) {
        code.add(Label, falseDoStatementLabel);
        ASMCodeFragment falseDoStatement = removeBlockCode(node.child(2));
        code.append(falseDoStatement);
      }
      code.add(Label, endOfIfStatementLabel);
    }

    // WhileStatement
    public void visitEnter(WhileStatementNode node) {
      Labeller labeller = new Labeller("-while-statement-");
      String beginLabel = labeller.newLabel("begin");
      String endOfWhileStatementLabel = labeller.newLabel("end-of-while-statement");

      node.setLabelForContinue(beginLabel);
      node.setLabelForBreak(endOfWhileStatementLabel);
    }

    public void visitLeave(WhileStatementNode node) {
      newVoidCode(node);
      ASMCodeFragment booleanResult = removeValueCode(node.child(0));
      ASMCodeFragment trueDoStatement = removeBlockCode(node.child(1));
      String beginLabel = node.getLabelForContinue();
      String endOfWhileStatementLabel = node.getLabelForBreak();

      code.add(Label, beginLabel);
      code.append(booleanResult);
      code.add(JumpFalse, endOfWhileStatementLabel);
      code.append(trueDoStatement);
      code.add(Jump, beginLabel);
      code.add(Label, endOfWhileStatementLabel);
    }

    public void visitLeave(ReleaseStatementNode node) {
      newVoidCode(node);
      code.append(removeValueCode(node.child(0)));
      ArrayType arrayType = (ArrayType) node.child(0).getType();
      code.append(ArrayHelper.arrayRelease(arrayType, reg1));
    }

    /*
     * During function definition, the value returned will be push into frame stack, and during the
     * invocation, the value will be pop from frame stack to ASM Stack. Thus there is block generate
     * value, also a correspoding block consume that value, Thus it will be easier to just set the
     * code of ReturnStatementNode as void code.
     */
    public void visitLeave(ReturnStatementNode node) {
      newVoidCode(node);
      if (node.nChildren() > 0 && node.child(0) instanceof LambdaNode) {
        ASMCodeFragment rvalue = removeValueCode(node.child(0));
        code.append(rvalue);
      } else if (node.getType() != PrimitiveType.VOID) {
        code.append(removeValueCode(node.child(0)));
      }
      code.add(Jump, node.getTargetLabelForReturn());
    }

    public void visitLeave(CallStatementNode node) {
      newVoidCode(node);

      ParseNode functionInvocation = node.child(0);
      Type resultTypeOfInvocation = functionInvocation.getType();

      if (resultTypeOfInvocation == PrimitiveType.VOID) {
        code.append(removeVoidCode(functionInvocation));
      } else {
        code.append(removeValueCode(functionInvocation));
        code.add(Pop);
      }
    }

    public void visitLeave(BreakStatementNode node) {
      newVoidCode(node);
      code.add(Jump, node.getTargetLabelForBreak());
    }

    public void visitLeave(ContinueStatementNode node) {
      newVoidCode(node);
      code.add(Jump, node.getTargetLabelForContinue());
    }

    // WhileStatement
    public void visitEnter(ForStatementNode node) {
      Labeller labeller = new Labeller("-for-statement-");
      node.setLabeller(labeller);
      String continueLabel = labeller.newLabel("continue");
      String breakLabel = labeller.newLabel("break");

      node.setLabelForContinue(continueLabel);
      node.setLabelForBreak(breakLabel);
    }

    public void visitLeave(ForStatementNode node) {
      newVoidCode(node);
      IdentifierNode identifier = (IdentifierNode) node.child(0);
      Labeller labeller = node.getLabeller();
      ParseNode sequence = node.child(1);
      BlockStatementNode blockStatement = (BlockStatementNode) node.child(2);
      ASMCodeFragment codeOfIdentifier = removeAddressCode(identifier);
      ASMCodeFragment codeOfSequence = removeValueCode(sequence);
      ASMCodeFragment codeOfForBody = removeVoidCode(blockStatement);
      Type sequenceType = sequence.getType();
      String beginLabel = labeller.newLabel("begin");
      String endLabel = labeller.newLabel("end");

      // begin label
      code.add(Label, beginLabel);

      // Backup values of registers for restoring later
      code.append(LoopHelper.backupRegister(regIdentifier));
      code.append(LoopHelper.backupRegister(regSequence));
      code.append(LoopHelper.backupRegister(regLooper));

      if (node.getToken().isLextant(Keyword.INDEX)) {
        if (sequenceType == PrimitiveType.STRING) {
          code.append(LoopHelper.generateStringIndexLoopCode(labeller, codeOfIdentifier,
              regIdentifier, codeOfSequence, regSequence, codeOfForBody, regLooper));
        } else if (sequenceType instanceof ArrayType) {
          code.append(LoopHelper.generateArrayIndexLoopCode(labeller, codeOfIdentifier,
              regIdentifier, codeOfSequence, regSequence, codeOfForBody, regLooper));
        }
      } else if (node.getToken().isLextant(Keyword.ELEM)) {
        if (sequenceType == PrimitiveType.STRING) {
          code.append(LoopHelper.generateStringElementLoopCode(labeller, codeOfIdentifier,
              regIdentifier, codeOfSequence, regSequence, codeOfForBody, regLooper));
        } else if (sequenceType instanceof ArrayType) {
          code.append(
              LoopHelper.generateArrayElementLoopCode(labeller, sequenceType, codeOfIdentifier,
                  regIdentifier, codeOfSequence, regSequence, codeOfForBody, regLooper));
        }
      }

      code.append(LoopHelper.restoreRegister(regLooper));
      code.append(LoopHelper.restoreRegister(regSequence));
      code.append(LoopHelper.restoreRegister(regIdentifier));

      // end label
      code.add(Label, endLabel);
    }

    ///////////////////////////////////////////////////////////////////////////
    // Expression ->
    // BinaryExpression
    // UnaryExpression
    // TypeCastingExpression
    // ArrayIndexingExpression

    ///////////////////////////////////////////////////////////////////////////
    // expressions
    public void visitLeave(BinaryOperatorNode node) {
      Lextant operator = node.getOperator();

      // Comparison Operator
      if (operator == Punctuator.LESSER || operator == Punctuator.LESSEROREQUAL
          || operator == Punctuator.NOTEQUAL || operator == Punctuator.EQUAL
          || operator == Punctuator.GREATER || operator == Punctuator.GREATEROREQUAL) {
        visitComparisonOperatorNode(node);
      }

      // Boolean Operator
      else if (operator == Punctuator.AND || operator == Punctuator.OR) {
        visitBooleanOperatorNode(node);
      }

      // Rational Operator
      else if (operator == Punctuator.OVER || operator == Punctuator.EXPRESSOVER
          || operator == Punctuator.RATIONALIZE) {
        visitRationalOperatorNode(node);
      }

      // Array Operator
      else if (operator == Keyword.MAP || operator == Keyword.REDUCE || operator == Keyword.FOLD) {
        visitArrayOperatorNode(node);
      }

      // Arithmetic Operator
      else {
        visitNormalBinaryOperatorNode(node);
      }
    }

    private void visitComparisonOperatorNode(BinaryOperatorNode node) {
      Lextant operator = node.getOperator();
      ASMCodeFragment arg1 = removeValueCode(node.child(0));
      ASMCodeFragment arg2 = removeValueCode(node.child(1));
      newValueCode(node);

      if (node.child(0).getType() == PrimitiveType.RATIONAL) {
        code.append(RationalHelper.rationalComparison(arg1, arg2, GCDCalculation, reg1, reg2,
            reg1ForFunction, reg2ForFunction, operator));
      } else {
        Labeller labeller = new Labeller("compare");
        String startLabel = labeller.newLabel("arg1");
        String arg2Label = labeller.newLabel("arg2");
        String subLabel = labeller.newLabel("sub");
        String trueLabel = labeller.newLabel("true");
        String falseLabel = labeller.newLabel("false");
        String joinLabel = labeller.newLabel("join");

        code.add(Label, startLabel);
        code.append(arg1);
        code.add(Label, arg2Label);
        code.append(arg2);
        code.add(Label, subLabel);

        if (node.child(0).getType() == PrimitiveType.FLOATING) {
          code.add(FSubtract);
          if (operator == Punctuator.GREATER) {
            code.add(JumpFPos, trueLabel);
            code.add(Jump, falseLabel);
          } else if (operator == Punctuator.LESSER) {
            code.add(JumpFNeg, trueLabel);
            code.add(Jump, falseLabel);
          } else if (operator == Punctuator.LESSEROREQUAL) {
            code.add(JumpFPos, falseLabel);
            code.add(Jump, trueLabel);
          } else if (operator == Punctuator.EQUAL) {
            code.add(JumpFZero, trueLabel);
            code.add(Jump, falseLabel);
          } else if (operator == Punctuator.NOTEQUAL) {
            code.add(JumpFZero, falseLabel);
            code.add(Jump, trueLabel);
          } else if (operator == Punctuator.GREATEROREQUAL) {
            code.add(JumpFNeg, falseLabel);
            code.add(Jump, trueLabel);
          }
        } else {
          code.add(Subtract);
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
        }

        code.add(Label, trueLabel);
        code.add(PushI, 1);
        code.add(Jump, joinLabel);
        code.add(Label, falseLabel);
        code.add(PushI, 0);
        code.add(Jump, joinLabel);
        code.add(Label, joinLabel);
      }
    }

    private void visitBooleanOperatorNode(BinaryOperatorNode node) {
      newValueCode(node);
      Lextant operator = node.getOperator();
      ASMCodeFragment arg1 = removeValueCode(node.child(0));
      ASMCodeFragment arg2 = removeValueCode(node.child(1));
      Labeller labeller = new Labeller("boolean_operator");
      String startLabel = labeller.newLabel("arg1");
      String arg2Label = labeller.newLabel("arg2");
      String trueLabel = labeller.newLabel("true");
      String falseLabel = labeller.newLabel("false");
      String joinLabel = labeller.newLabel("join");

      if (operator == Punctuator.OR) {
        code.add(Label, startLabel);
        code.append(arg1);
        code.add(JumpTrue, trueLabel);
        code.add(Label, arg2Label);
        code.append(arg2);
        code.add(JumpTrue, trueLabel);
        code.add(Jump, falseLabel);
      } else if (operator == Punctuator.AND) {
        code.add(Label, startLabel);
        code.append(arg1);
        code.add(JumpFalse, falseLabel);
        code.add(Label, arg2Label);
        code.append(arg2);
        code.add(JumpFalse, falseLabel);
        code.add(Jump, trueLabel);
      }

      code.add(Label, trueLabel);
      code.add(PushI, 1);
      code.add(Jump, joinLabel);
      code.add(Label, falseLabel);
      code.add(PushI, 0);
      code.add(Jump, joinLabel);
      code.add(Label, joinLabel);
    }

    private void visitRationalOperatorNode(BinaryOperatorNode node) {
      newValueCode(node);
      ASMCodeFragment arg1 = removeValueCode(node.child(0));
      ASMCodeFragment arg2 = removeValueCode(node.child(1));
      Lextant operator = node.getOperator();
      Type type = node.child(0).getType();

      if (operator == Punctuator.OVER) {
        code.append(RationalHelper.performOverPuntuator(arg1, arg2, GCDCalculation, reg1ForFunction,
            reg2ForFunction, reg1, reg2));
      } else if (operator == Punctuator.EXPRESSOVER) {
        code.append(RationalHelper.performExpressOverPunctuator(arg1, arg2, type, reg1ForFunction));
      } else if (operator == Punctuator.RATIONALIZE) {
        code.append(RationalHelper.performRationalizePuntuator(arg1, arg2, type, GCDCalculation,
            reg1ForFunction, reg2ForFunction, reg1, reg2, reg3, reg4));
      }
    }

    private void visitArrayOperatorNode(BinaryOperatorNode node) {
      newValueCode(node);
      ParseNode array = node.child(0);
      ParseNode lambda = node.child(1);
      ArrayType originalArrayType = (ArrayType) (array.getType());
      ASMCodeFragment originalArrayCode = removeValueCode(array);
      ASMCodeFragment lambdaCode = removeValueCode(lambda);
      Lextant operator = node.getOperator();

      if (operator == Keyword.MAP) {
        Labeller labeller = new Labeller("array-map-operator");
        ArrayType targetArrayType = (ArrayType) (node.getType());
        code.append(ArrayHelper.arrayMapWithLambda(originalArrayType, targetArrayType,
            originalArrayCode, lambdaCode, labeller, regCounter, reg1, reg2));
      } else if (operator == Keyword.REDUCE) {
        Labeller labeller = new Labeller("array-reduce-operator");
        ArrayType targetArrayType = (ArrayType) (node.getType());
        code.append(ArrayHelper.arrayReduceWithLambda(originalArrayType, targetArrayType,
            originalArrayCode, lambdaCode, labeller, regCounter, reg1, reg2, reg3, reg4));
      } else if (operator == Keyword.FOLD) {
        Labeller labeller = new Labeller("array-fold-operator");
        if (node.nChildren() == 2) {
          code.append(ArrayHelper.arrayFoldWithLambda(originalArrayType, originalArrayCode,
              lambdaCode, labeller, regCounter, reg1));
        }else if (node.nChildren() == 3) {
          // If it's a fold with base, then second child is not lambda but base
          // Give lambda to base and set value for real lambda
          ASMCodeFragment baseCode = lambdaCode;
          lambda = node.child(2);
          lambdaCode = removeValueCode(lambda);
          code.append(ArrayHelper.arrayFoldWithLambdaAndBase(originalArrayType, originalArrayCode, baseCode, lambdaCode, labeller, regCounter, reg1));
        }
      }
    }

    private void visitNormalBinaryOperatorNode(BinaryOperatorNode node) {
      newValueCode(node);
      ASMCodeFragment arg1 = removeValueCode(node.child(0));
      ASMCodeFragment arg2 = removeValueCode(node.child(1));
      Object operation = node.getSignature().getVariant();

      if (operation instanceof ASMOpcode) {
        ASMOpcode opcode = (ASMOpcode) operation;
        code.append(arg1);
        code.append(arg2);
        if (opcode == Divide) {
          code.add(Duplicate);
          code.add(JumpFalse, RunTime.INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        } else if (opcode == FDivide) {
          code.add(Duplicate);
          code.add(JumpFZero, RunTime.FLOAT_DIVIDE_BY_ZERO_RUNTIME_ERROR);
        }
        code.add(opcode);
      } else if (operation instanceof String) {
        if (isRationalOperation((String) operation)) {
          if (operation == BinaryOperatorNode.RATIONAL_ADD) {
            code.append(RationalHelper.rationalAdd(arg1, arg2, GCDCalculation, reg1, reg2,
                reg1ForFunction, reg2ForFunction));
          } else if (operation == BinaryOperatorNode.RATIONAL_SUBSTRCT) {
            code.append(RationalHelper.rationalSubtract(arg1, arg2, GCDCalculation, reg1, reg2,
                reg1ForFunction, reg2ForFunction));
          } else if (operation == BinaryOperatorNode.RATIONAL_MULTIPLY) {
            code.append(RationalHelper.rationalMultiply(arg1, arg2, GCDCalculation, reg1, reg2,
                reg1ForFunction, reg2ForFunction));
          } else if (operation == BinaryOperatorNode.RATIONAL_DIVIDE) {
            code.append(RationalHelper.rationalDivide(arg1, arg2, GCDCalculation, reg1, reg2,
                reg1ForFunction, reg2ForFunction));
          }
        } else if (operation == BinaryOperatorNode.CONCATENATION) {
          Type type1 = node.child(0).getType();
          Type type2 = node.child(1).getType();
          if (type1 == PrimitiveType.STRING && type2 == PrimitiveType.STRING) {
            code.append(StringHelper.stringConcatenation(arg1, arg2, reg1, reg2, reg3, reg4, reg5,
                regCounter));
          } else if (type1 == PrimitiveType.STRING && type2 == PrimitiveType.CHARACTER) {
            code.append(
                StringHelper.stringCharConcatenation(arg1, arg2, reg1, reg2, reg3, regCounter));
          } else if (type1 == PrimitiveType.CHARACTER && type2 == PrimitiveType.STRING) {
            code.append(
                StringHelper.charStringConcatenation(arg1, arg2, reg1, reg2, reg3, regCounter));
          }
        }
      }
      addPromotionCodeIfNeeded(node);
    }

    public boolean isRationalOperation(String operation) {
      return (operation == BinaryOperatorNode.RATIONAL_ADD)
          || (operation == BinaryOperatorNode.RATIONAL_SUBSTRCT)
          || (operation == BinaryOperatorNode.RATIONAL_MULTIPLY)
          || (operation == BinaryOperatorNode.RATIONAL_DIVIDE);
    }

    public void visitLeave(UnaryOperatorNode node) {
      newValueCode(node);
      Lextant operator = node.getOperator();
      ASMCodeFragment arg1 = removeValueCode(node.child(0));

      if (operator == Punctuator.NOT) {
        code.append(arg1);
        code.add(BNegate);
      }

      else if (operator == Keyword.LENGTH) {
        ParseNode nodeToGetLength = node.child(0);
        Type type = nodeToGetLength.getType();
        Labeller labeller = new Labeller("-get-array-length");
        code.add(Label, labeller.newLabel("begin"));
        code.append(arg1);

        // Get the length of a string
        if (type == PrimitiveType.STRING) {
          code.append(StringHelper.pushStringLength());
        }
        // Get the length of an array
        else if (type instanceof ArrayType) {
          code.append(ArrayHelper.pushArrayLength());
        }
        // Error case
        else {
          return;
        }
      }

      else if (operator == Keyword.COPY) {
        Labeller labeller = new Labeller("-copy-operator-");
        ArrayType arrayType = (ArrayType) node.getType();
        code.append(ArrayHelper.arrayClone(arrayType, arg1, labeller, reg1, reg2, reg3));
      }

      else if (operator == Keyword.REVERSE) {
        Type originalType = node.child(0).getType();
        if (originalType instanceof ArrayType) {
          Labeller labeller = new Labeller("-array-reversal-");
          code.append(ArrayHelper.arrayReversal((ArrayType)originalType, labeller, arg1, reg1, reg2, reg3, reg4));
        } else if (originalType == PrimitiveType.STRING) {
          Labeller labeller = new Labeller("-string-reversal-");
          code.append(StringHelper.stringReversal(arg1, labeller,reg1, reg2, reg3, reg4));
        }
      }
      
      else if (operator == Keyword.ZIP) {
        Labeller labeller = new Labeller("-zip-operator-");
        ASMCodeFragment arrayACode = arg1;
        ASMCodeFragment arrayBCode = removeValueCode(node.child(1));
        ASMCodeFragment lambdaCode = removeValueCode(node.child(2));
        ArrayType arrayAType = (ArrayType)(node.child(0).getType());
        ArrayType arrayBType = (ArrayType)(node.child(1).getType());
        ArrayType targetArrayType = (ArrayType)(node.getType());

        code.append(ArrayHelper.arrayZipWithLambda(arrayAType, arrayBType, targetArrayType, arrayACode, arrayBCode, lambdaCode, labeller, regCounter, reg1, reg2, reg3));
      }

      addPromotionCodeIfNeeded(node);
    }

    // Following castings are allowed
    // Char -> Int , Int -> Char
    // Int -> Float , Float -> Int
    // Int -> Bool, Char -> Bool
    // selfType -> selfType
    public void visitLeave(TypeCastingNode node) {
      newValueCode(node);
      Type originalType = node.child(0).getType();
      Type targetType = node.child(1).getType();
      ASMCodeFragment value = removeValueCode(node.child(0));

      if (originalType.match(targetType)) {
        code.append(value);
        return;
      } else {
        code.append(PromotionHelper.codeCastTypeAToTypeB(originalType, targetType, value));
      }
    }

    public void visitLeave(ArrayIndexingNode node) {
      Type identifierType = node.child(0).getType();

      if (identifierType instanceof ArrayType) {
        newAddressCode(node);
        Labeller labeller = new Labeller("-array-indexing-");
        ArrayType arrayType = (ArrayType) identifierType;
        ASMCodeFragment arrayAddress = removeValueCode(node.child(0));
        ASMCodeFragment index = removeValueCode(node.child(1));
        code.append(
            ArrayHelper.arrayElementAtIndex(arrayType, arrayAddress, index, labeller, reg1));
      } else if (identifierType == PrimitiveType.STRING) {
        // string[i] -> character
        if (node.nChildren() == 2) {
          newAddressCode(node);
          Labeller labeller = new Labeller("-string-indexing-");
          ASMCodeFragment stringAddress = removeValueCode(node.child(0));
          ASMCodeFragment index = removeValueCode(node.child(1));
          code.append(StringHelper.stringElementAtIndex(stringAddress, index, labeller, reg1));
        }

        // string[i,j] -> subString
        else if (node.nChildren() == 3) {
          newValueCode(node);
          Labeller labeller = new Labeller("-string-range-");
          ASMCodeFragment stringAddress = removeValueCode(node.child(0));
          ASMCodeFragment indexStart = removeValueCode(node.child(1));
          ASMCodeFragment indexEnd = removeValueCode(node.child(2));

          code.append(StringHelper.subStringInRange(stringAddress, indexStart, indexEnd, labeller,
              regCounter, reg1, reg2, reg3, reg4));
        }
      }
    }

    ///////////////////////////////////////////////////////////////////////////
    // ArrayExpressions
    /* ArrayExpressions -> NewArrayTypeLengthExpression */
    /* -> ExpressionList */
    /* -> CloneExpression */

    public void visitLeave(NewArrayTypeLengthNode node) {
      newValueCode(node);
      Labeller labeller = new Labeller("empty-array-creation");
      ArrayType arrayType = (ArrayType) (node.getType());
      ASMCodeFragment lengthOfArray = removeValueCode(node.child(1));
      code.append(ArrayHelper.arrayCreation(arrayType, lengthOfArray, labeller, reg1));
    }

    public void visitLeave(ExpressionListNode node) {
      // Create array only when ExpressionList is an element of array
      if (!(node.getParent() instanceof FunctionInvocationNode)) {
        newValueCode(node);
        Labeller labeller = new Labeller("-expr-list-");
        ArrayType arrayType = (ArrayType) (node.getType());
        List<ASMCodeFragment> arrayElement = new ArrayList<>();

        ASMCodeFragment lengthOfArray = new ASMCodeFragment(GENERATES_VALUE);
        lengthOfArray.add(PushI, arrayType.getLength());

        for (int i = 0; i < node.nChildren(); i++) {
          arrayElement.add(removeValueCode(node.child(i)));
        }
        code.append(ArrayHelper.arrayCreation(arrayType, lengthOfArray, labeller, reg1));
        code.append(ArrayHelper.arrayInitialization(arrayType, arrayElement,
            opcodeForStore(arrayType.getSubType()), labeller));
      }
    }

    ///////////////////////////////////////////////////////////////////////////
    // Helper Function

    private ASMOpcode opcodeForStore(Type type) {
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

    private ASMOpcode opcodeForLoad(Type type) {
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

    ///////////////////////////////////////////////////////////////////////////
    // leaf nodes

    public void visit(IdentifierNode node) {
      BindingType bindingType = node.getBinding().getBindingType();
      if (bindingType == Binding.BindingType.VARIABLE) {
        newAddressCode(node);
        Binding binding = node.getBinding();
        binding.generateAddress(code);
      } else if (bindingType == Binding.BindingType.FUNCTION) {
        newVoidCode(node);
        String functionName = node.getBinding().getLambdaName();
        code.add(Call, functionPrefix + functionName);
      }
    }

    public void visit(BooleanConstantNode node) {
      newValueCode(node);
      code.add(PushI, node.getValue() ? 1 : 0);
      addPromotionCodeIfNeeded(node);
    }

    public void visit(IntegerConstantNode node) {
      newValueCode(node);
      code.add(PushI, node.getValue());
      addPromotionCodeIfNeeded(node);
    }

    public void visit(FloatingConstantNode node) {
      newValueCode(node);
      code.add(PushF, node.getValue());
      addPromotionCodeIfNeeded(node);
    }

    public void visit(CharConstantNode node) {
      newValueCode(node);
      code.add(PushI, node.getValue());
      addPromotionCodeIfNeeded(node);
    }

    public void visit(StringConstantNode node) {
      newValueCode(node);
      String value = node.getValue();
      Labeller labeller = new Labeller("-string-creation-");

      List<ASMCodeFragment> stringElement = new ArrayList<ASMCodeFragment>();

      for (int i = 0; i < value.length(); i++) {
        ASMCodeFragment element = new ASMCodeFragment(GENERATES_VALUE);
        element.add(PushI, value.charAt(i));
        stringElement.add(element);
      }

      ASMCodeFragment lengthOfString = new ASMCodeFragment(GENERATES_VALUE);
      lengthOfString.add(PushI, value.length());

      code.append(StringHelper.stringCreation(lengthOfString, labeller, reg1));
      code.append(StringHelper.stringInitialization(stringElement, labeller));
    }

    public void visit(NewlineNode node) {
      newVoidCode(node);
      code.add(PushD, RunTime.NEWLINE_PRINT_FORMAT);
      code.add(Printf);
    }

    public void visit(TabNode node) {
      newVoidCode(node);
      code.add(PushD, RunTime.TAB_PRINT_FORMAT);
      code.add(Printf);
    }

    public void visit(SpaceNode node) {
      newVoidCode(node);
      code.add(PushD, RunTime.SPACE_PRINT_FORMAT);
      code.add(Printf);
    }
  }
}
