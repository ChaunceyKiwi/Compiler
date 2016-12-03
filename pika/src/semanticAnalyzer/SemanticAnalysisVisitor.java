package semanticAnalyzer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import logging.PikaLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.signatures.*;
import semanticAnalyzer.types.*;
import symbolTable.Binding;
import symbolTable.Scope;
import tokens.LextantToken;
import tokens.Token;

public class SemanticAnalysisVisitor extends ParseNodeVisitor.Default {
  @Override
  public void visitLeave(ParseNode node) {
    throw new RuntimeException(
        "Node class unimplemented in SemanticAnalysisVisitor: " + node.getClass());
  }

  ///////////////////////////////////////////////////////////////////////////
  // constructs larger than statements
  @Override
  public void visitEnter(ProgramNode node) {
    enterScope(node);
  }

  @Override
  public void visitLeave(ProgramNode node) {
    leaveScope(node);
  }

  @Override
  public void visitEnter(BlockStatementNode node) {
    enterScope(node);

    if (node.getParent() instanceof ForStatementNode) {
      IdentifierNode identifier = (IdentifierNode) (node.getParent().child(0));
      ParseNode sequence = node.getParent().child(1);
      Scope scope = identifier.getLocalScope();
      Type sequenceType = sequence.getType();

      // If identifier has already been declared in current scope, report error.
      scope.getSymbolTable().errorIfAlreadyDefined(identifier.getToken());

      // The expression is called the sequence of the loop, which must be
      // of stringType or arrayType
      if (sequenceType != PrimitiveType.STRING && !(sequenceType instanceof ArrayType)) {
        forStatementSequenceTypeError(node);
        return;
      }

      if (node.getParent().getToken().isLextant(Keyword.INDEX)) {
        addBinding(identifier, PrimitiveType.INTEGER, false);
      } else if (sequenceType == PrimitiveType.STRING) {
        addBinding(identifier, PrimitiveType.CHARACTER, false);
      } else if (sequenceType instanceof ArrayType) {
        addBinding(identifier, ((ArrayType) sequenceType).getSubType(), false);
      }
    }
  }

  @Override
  public void visitLeave(BlockStatementNode node) {
    leaveScope(node);
  }

  ///////////////////////////////////////////////////////////////////////////
  // helper methods for scoping.
  private void enterScope(ParseNode node) {
    node.getScope().enter();
  }

  private void leaveScope(ParseNode node) {
    node.getScope().leave();
  }

  ///////////////////////////////////////////////////////////
  // Function Related
  /* globalDefinition -> functionDefinition */
  /* functionDefinition -> func identifier lambda */
  /* lambda -> lambdaParamType blockStatement */
  /* lambdaParamType -> <parameterList> -> type */
  /* parameterList -> parameterSpecification* (,) */
  /* parameterSpecification -> type identifier */

  ///////////////////////////////////////////////////////////////////////////
  // FunctionDefinition
  public void visitEnter(FunctionDefinitionNode node) {}

  public void visitLeave(FunctionDefinitionNode node) {
    assert node.nChildren() == 2;
  }

  ///////////////////////////////////////////////////////////////////////////
  // parameterList -> parameterSpecification ⋈ ,
  // parameterSpecification -> type identifier
  public void visitLeave(ParameterListNode node) {
    for (int i = 0; i < node.nChildren(); i++) {
      ParseNode paraSpecNode = node.child(i);
      ParseNode typeNode = (TypeNode) paraSpecNode.child(0);
      IdentifierNode identifierNode = (IdentifierNode) paraSpecNode.child(1);
      Type type = typeNode.getType();
      Scope scope = identifierNode.getLocalScope();

      identifierNode.setType(type);

      // Parameter scope no declaration already defined
      scope.getSymbolTable().errorIfAlreadyDefined(identifierNode.getToken());

      // Parameters of the function are declared const (immutable)
      addBinding(identifierNode, type, false);
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // FunctionInvocation
  public void visitLeave(FunctionInvocationNode node) {
    assert node.nChildren() == 2;
    ParseNode expressionNode = node.child(0);

    // the expression must have a lambda type
    if (!(expressionNode.getType() instanceof LambdaType)) {
      functionInvocationExpressionNotLambdaTypeError(node);
      return;
    }

    LambdaType lambdaType = (LambdaType) expressionNode.getType();
    ExpressionListNode expressionListNode = (ExpressionListNode) node.child(1);
    FunctionSignatures functionSignatures;
    List<Type> typeListFromExpNode = new ArrayList<Type>();

    for (int i = 0; i < expressionListNode.nChildren(); i++) {
      typeListFromExpNode.add(expressionListNode.child(i).getType());
    }

    // Make sure function invocation's parameters meet function's parameters
    functionSignatures = new FunctionSignatures(expressionNode.getToken().getLexeme(),
        new FunctionSignature(lambdaType));
    setTypeAndCheckSignature(node, functionSignatures, typeListFromExpNode);
  }

  ///////////////////////////////////////////////////////////////////////////
  // Lambda
  // Currently only find 5 possible node can have a LamdaNode as child
  // 1. FunctionDefinictionNode
  // 2. DeclarationNode
  // 3. AssignmentNode
  // 4. ReturnStatementNode
  public void visitEnter(LambdaNode node) {
    ParseNode parent = node.getParent();
    if (parent instanceof FunctionDefinitionNode || parent instanceof DeclarationNode
        || parent instanceof FunctionInvocationNode || parent instanceof AssignmentStatementNode
        || parent instanceof ReturnStatementNode || parent instanceof ExpressionListNode) {
      enterScope(node);
    } else {
      lambdaNodeWrongEnterMethodError(node);
    }
  }

  public void visitLeave(LambdaNode node) {
    assert node.nChildren() == 2;
    Type resultType = node.getLambdaType().getResultType();

    if (resultType != PrimitiveType.VOID && !node.hasReturnStatement()) {
      lambdaNodeLackReturnStatementError(node);
      return;
    }
    leaveScope(node);
  }

  ///////////////////////////////////////////////////////////////////////////
  // ReturnStatement
  public void visitLeave(ReturnStatementNode node) {
    assert node.nChildren() <= 1;

    ParseNode lambdaNode = node.findLambdaNode(node);

    if (lambdaNode != null && lambdaNode instanceof LambdaNode) {
      node.setLambdaNode((LambdaNode) lambdaNode);
      ((LambdaNode) lambdaNode).setHasReturnStatement();
    } else {
      returnFindNoLambdaError(node);
      return;
    }

    Type returnType;
    if (node.nChildren() == 0) {
      returnType = PrimitiveType.VOID;
    } else {
      returnType = node.child(0).getType();
    }

    // Make sure return type meet function's result type
    Type expectedType = ((LambdaNode) lambdaNode).getLambdaType().getResultType();
    if (expectedType.match(returnType)) {
      node.setType(expectedType);
    } else {
      variableReturnDifferDefinitionError(node);
    }
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
  /* forStatement */

  ///////////////////////////////////////////////////////////////////////////
  // Declaration
  @Override
  public void visitLeave(DeclarationNode node) {
    IdentifierNode identifier = (IdentifierNode) node.child(0);
    ParseNode initializer = node.child(1);
    Scope scope = identifier.getLocalScope();
    Type declarationType = initializer.getType();

    if (declarationType == PrimitiveType.VOID) {
      assignVoidToVariableError(node);
      return;
    }

    node.setType(declarationType);
    identifier.setType(declarationType);

    // If identifier has already been declared in current scope, report error.
    scope.getSymbolTable().errorIfAlreadyDefined(identifier.getToken());

    // If identifier has not been declared in current scope,
    // binding it to current scope and its symbol table.
    // If the declaration is var then variable is mutable, const then unmutuable
    if (node.getToken().isLextant(Keyword.VAR))
      addBinding(identifier, declarationType, true);
    else if (node.getToken().isLextant(Keyword.CONST))
      addBinding(identifier, declarationType, false);
    else
      logError("Declaration type is neither var nor const");
  }

  // assignmentStatement -> target := expression .
  // target -> expression

  @Override
  public void visitLeave(AssignmentStatementNode node) {
    assert node.nChildren() == 2;
    ParseNode target = node.child(0);

    if (!isTargetable(target)) {
      assignmentToUntargetableExpressionError(node);
      return;
    }

    if (target instanceof IdentifierNode && !((IdentifierNode) target).getBinding().isMutable()) {
      assignmentToConstantError(node);
      return;
    }

    ParseNode initializer = node.child(1);
    Type targetType = target.getType();
    Type assignmentType = initializer.getType();

    List<Type> childTypes = Arrays.asList(targetType, assignmentType);
    setTypeAndCheckSignature(node, AssignmentStatementNode.VALUE_ASSIGNMENT, childTypes);
  }

  // Only following three cases can be targetable:
  // 1). an array indexing expression
  // 2). a parenthesized expression
  // 3). an identifier
  public boolean isTargetable(ParseNode node) {
    if (node instanceof IdentifierNode || node instanceof ArrayIndexingNode) {

      // String is immutable
      if (node instanceof ArrayIndexingNode && node.child(0).getType() == PrimitiveType.STRING) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  // IfStatement
  @Override
  public void visitLeave(IfStatementNode node) {
    assert node.nChildren() >= 2;
    checkIfExpressionIsBoolean(node.child(0));
  }

  // WhileStatement
  @Override
  public void visitLeave(WhileStatementNode node) {
    assert node.nChildren() == 2;
    checkIfExpressionIsBoolean(node.child(0));
  }

  // ForStatement
  @Override
  public void visitLeave(ForStatementNode node) {
    // The type checking is done in BlockStatement
    assert node.nChildren() == 3;
  }

  // PrintStatement
  @Override
  public void visitLeave(PrintStatementNode node) {}

  // ReleaseStatement
  @Override
  public void visitLeave(ReleaseStatementNode node) {
    assert node.nChildren() == 1;
    Type type = node.child(0).getType();

    // Expression must be reference type
    if (!(type instanceof ArrayType)) {
      releaseTypeError(node);
    }
  }

  // BreakStatement
  @Override
  public void visitLeave(BreakStatementNode node) {
    assert node.nChildren() == 0;

    // Set target for loop control
    // Report error if no loop statement found
    ParseNode loopStatementNode = BreakStatementNode.findLoopStatementNode(node);
    if (loopStatementNode == null) {
      loopControlFindNoLoopError(node);
    } else {
      node.setLoopStatementNode(loopStatementNode);
    }
  }

  // ContinueStatement
  @Override
  public void visitLeave(ContinueStatementNode node) {
    assert node.nChildren() == 0;

    // Set target for loop control
    // Report error if no loop statement found
    ParseNode loopStatementNode = ContinueStatementNode.findLoopStatementNode(node);
    if (loopStatementNode == null) {
      loopControlFindNoLoopError(node);
    } else {
      node.setLoopStatementNode(loopStatementNode);
    }
  }

  public void checkIfExpressionIsBoolean(ParseNode node) {
    if (node.getType() != PrimitiveType.BOOLEAN) {
      controlFlowError(node);
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // Expressions Related
  /* Expression -> BinaryExpression */
  /* -> UnaryExpression */
  /* -> TypeCastingExpression */
  /* -> ArrayIndexingExpression */

  // BinaryExpression
  @Override
  public void visitLeave(BinaryOperatorNode node) {
    assert node.nChildren() == 2 || node.nChildren() == 3;
    ParseNode left = node.child(0);
    ParseNode right = node.child(1);
    List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
    Lextant operator = operatorFor(node);

    // if both sides is array type and is comparision, skip typechecking
    if ((left.getType() instanceof ArrayType && right.getType() instanceof ArrayType
        && (operator == Punctuator.EQUAL || operator == Punctuator.NOTEQUAL))) {
      setTypeAndCheckSignature(node, BinaryOperatorNode.ARRAY_COMPARISON, childTypes);
    } else if (operator == Keyword.MAP) {
      setTypeAndCheckSignature(node, BinaryOperatorNode.ARRAY_MAP, childTypes);
    } else if (operator == Keyword.REDUCE) {
      setTypeAndCheckSignature(node, BinaryOperatorNode.ARRAY_REDUCE, childTypes);
    } else if (operator == Keyword.FOLD) {
      if (node.nChildren() == 2) {
        setTypeAndCheckSignature(node, BinaryOperatorNode.ARRAY_FOLD, childTypes);
      } else if (node.nChildren() == 3) {
        ParseNode base = node.child(1);
        ParseNode rightForFold = node.child(2);
        List<Type> childTypesForFold =
            Arrays.asList(left.getType(), base.getType(), rightForFold.getType());
        setTypeAndCheckSignature(node, BinaryOperatorNode.ARRAY_FOLD, childTypesForFold);
      }
    } else {
      // Check if the operands of operation obey the rule in the signature
      // And set type as the result type of signature
      setTypeAndCheckSignature(node, operator, childTypes);
    }
  }

  private Lextant operatorFor(BinaryOperatorNode node) {
    LextantToken token = (LextantToken) node.getToken();
    return token.getLextant();
  }

  // Unary Expression
  @Override
  public void visitLeave(UnaryOperatorNode node) {
    assert node.nChildren() == 1 || node.nChildren() == 3;
    List<Type> childTypes = Arrays.asList(node.child(0).getType());

    Lextant operator = operatorFor(node);

    // check if operands meet the signature of operator
    if (operator == Keyword.LENGTH) {
      setTypeAndCheckSignature(node, UnaryOperatorNode.ARRAY_LENGTH, childTypes);
    } else if (operator == Punctuator.NOT) {
      setTypeAndCheckSignature(node, UnaryOperatorNode.BOOLEAN_NOT, childTypes);
    } else if (operator == Keyword.COPY) {
      setTypeAndCheckSignature(node, UnaryOperatorNode.ARRAY_CLONE, childTypes);
    } else if (operator == Keyword.REVERSE) {
      setTypeAndCheckSignature(node, UnaryOperatorNode.ARRAY_REVERSE, childTypes);
    } else if (operator == Keyword.ZIP) {
      childTypes =
          Arrays.asList(node.child(0).getType(), node.child(1).getType(), node.child(2).getType());
      setTypeAndCheckSignature(node, UnaryOperatorNode.ARRAY_ZIP, childTypes);
    }

  }

  private Lextant operatorFor(UnaryOperatorNode node) {
    LextantToken token = (LextantToken) node.getToken();
    return token.getLextant();
  }

  // TypeCastingExpression
  @Override
  public void visitLeave(TypeCastingNode node) {
    assert node.nChildren() == 2;
    ParseNode left = node.child(0);
    ParseNode right = node.child(1);
    List<Type> childTypes = Arrays.asList(left.getType(), right.getType());

    // check if operands meet the signature of operator
    setTypeAndCheckSignature(node, TypeCastingNode.TYPE_CASTING, childTypes);
  }

  // ArrayIndexingExpression
  @Override
  public void visitLeave(ArrayIndexingNode node) {
    Type type = node.child(0).getType();
    if (type instanceof ArrayType) {
      assert node.nChildren() == 2;
      ParseNode left = node.child(0);
      ParseNode right = node.child(1);
      List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
      setTypeAndCheckSignature(node, ArrayIndexingNode.ARRAY_INDEXING, childTypes);
    } else if (type == PrimitiveType.STRING) {
      assert node.nChildren() == 2 || node.nChildren() == 3;
      ParseNode indexTarget = node.child(0);
      ParseNode index1 = node.child(1);
      List<Type> childTypes;

      if (node.nChildren() == 3) {
        ParseNode index2 = node.child(2);
        childTypes = Arrays.asList(indexTarget.getType(), index1.getType(), index2.getType());
      } else {
        childTypes = Arrays.asList(indexTarget.getType(), index1.getType());
      }

      setTypeAndCheckSignature(node, ArrayIndexingNode.ARRAY_INDEXING, childTypes);
    } else {
      indexingTargetError(node);
      return;
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // ArrayExpressions
  /* ArrayExpressions -> NewArrayTypeLengthExpression */
  /* -> ExpressionList */
  /* -> CloneExpression */

  // NewArrayTypeLengthExpression
  @Override
  public void visitLeave(NewArrayTypeLengthNode node) {
    assert node.nChildren() == 2;
    ParseNode left = node.child(0);
    ParseNode right = node.child(1);
    List<Type> childTypes = Arrays.asList(left.getType(), right.getType());

    // check if operands meet the signature of operator
    setTypeAndCheckSignature(node, NewArrayTypeLengthNode.EMPTY_ARRAY_CREATION, childTypes);
  }

  ///////////////////////////////////////////////////////////////////////////
  // ExpressionList
  // If it is the parameter of a function invocation, just skip
  // without checking. InvocationStatementNode will handle it
  // If it is the elements of an array, all type should be promoted to the same type
  @Override
  public void visitLeave(ExpressionListNode node) {
    int numOfChildren = node.nChildren();

    // when acts as the parameters of a function
    if (node.getParent() instanceof FunctionInvocationNode) {

    }
    // when acts as the elements of a array
    else {
      if (numOfChildren == 0) {
        expressionNoElementError(node);
      } else {
        Type[] types = new Type[numOfChildren];

        // need type check here
        for (int i = 0; i < numOfChildren; i++) {
          types[i] = node.child(i).getType();
        }

        Type type = promoteToTheSameType(types);
        if (type != PrimitiveType.NO_TYPE) {
          node.setType(new ArrayType(type, node.nChildren()));
          if (!(type instanceof ArrayType)) {
            for (int i = 0; i < numOfChildren; i++) {
              node.child(i).setType(type);
            }
          }
        } else {
          expressionElementTypeError(node);
        }
      }
    }
  }

  public Type promoteToTheSameType(Type[] typeList) {
    // Check if can be promoted to char, int, float, rational in order
    if (promotableToType(typeList, PrimitiveType.CHARACTER)) {
      return PrimitiveType.CHARACTER;
    } else if (promotableToType(typeList, PrimitiveType.INTEGER)) {
      return PrimitiveType.INTEGER;
    } else if (promotableToType(typeList, PrimitiveType.FLOATING)) {
      return PrimitiveType.FLOATING;
    } else if (promotableToType(typeList, PrimitiveType.RATIONAL)) {
      return PrimitiveType.RATIONAL;
    }

    // If cannot be promote, at least they should be the same type
    // Otherwise we return NO_TYPE
    for (int i = 1; i < typeList.length; i++) {
      if (!typeList[i].match(typeList[i - 1])) {
        return PrimitiveType.NO_TYPE;
      }
    }

    return typeList[0];
  }

  public boolean promotableToType(Type[] typeList, PrimitiveType primitiveType) {
    for (Type type : typeList) {
      if (!(type instanceof PrimitiveType)
          || (!PromotionHelper.typeAIsPredecessorTypeOrSame((PrimitiveType) type, primitiveType))) {
        return false;
      }
    }
    return true;
  }

  ///////////////////////////////////////////////////////////////////////////
  // ArrayType
  @Override
  public void visitLeave(TypeNode node) {
    assert node.nChildren() <= 1;
    // Primitive Type
    if (node.nChildren() == 0) {
      assert node.getType() instanceof PrimitiveType;
      String primitiveTypeLexeme = node.getToken().getLexeme();
      PrimitiveType primitiveType = PrimitiveType.returnPrimitiveTypeByLexeme(primitiveTypeLexeme);
      node.setType(primitiveType);
      // Array Type
    } else if (node.nChildren() == 1 && node.child(0) instanceof TypeNode) {
      node.setType(new ArrayType(node.child(0).getType()));
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // simple leaf nodes
  @Override
  public void visit(BooleanConstantNode node) {
    node.setType(PrimitiveType.BOOLEAN);
  }

  @Override
  public void visit(ErrorNode node) {
    node.setType(PrimitiveType.ERROR);
  }

  @Override
  public void visit(IntegerConstantNode node) {
    node.setType(PrimitiveType.INTEGER);
  }

  @Override
  public void visit(FloatingConstantNode node) {
    node.setType(PrimitiveType.FLOATING);
  }

  @Override
  public void visit(CharConstantNode node) {
    node.setType(PrimitiveType.CHARACTER);
  }

  @Override
  public void visit(StringConstantNode node) {
    node.setType(PrimitiveType.STRING);
  }

  @Override
  public void visit(NewlineNode node) {}

  @Override
  public void visit(SpaceNode node) {}

  @Override
  public void visit(TypeCastedToNode node) {
    String type = node.getToken().getLexeme();

    // bool | char | string | int | float
    // Assign the lexeme of token to the node type
    switch (type) {
      case ("bool"):
        node.setType(PrimitiveType.BOOLEAN);
        break;
      case ("char"):
        node.setType(PrimitiveType.CHARACTER);
        break;
      case ("string"):
        node.setType(PrimitiveType.STRING);
        break;
      case ("int"):
        node.setType(PrimitiveType.INTEGER);
        break;
      case ("float"):
        node.setType(PrimitiveType.FLOATING);
        break;
      default:
        node.setType(PrimitiveType.ERROR);
        break;
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // IdentifierNodes, with helper methods
  @Override
  public void visit(IdentifierNode node) {
    // If the identifier is not in the delcaration statement
    if (!isBeingDeclared(node)) {
      Binding binding = node.findVariableBinding();

      node.setType(binding.getType());
      node.setBinding(binding);
    }
    // else parent DeclarationNode does the processing.
  }

  private boolean isBeingDeclared(IdentifierNode node) {
    ParseNode parent = node.getParent();
    return (parent instanceof ParameterSpecificationNode)
        || ((parent instanceof DeclarationNode) && (node == parent.child(0)))
        || ((parent instanceof ForStatementNode) && (node == parent.child(0)));
  }

  private void addBinding(IdentifierNode identifierNode, Type type, boolean ismutable) {
    Scope scope = identifierNode.getLocalScope();
    Binding binding = scope.createBinding(identifierNode, type, ismutable);
    identifierNode.setBinding(binding);
  }

  ///////////////////////////////////////////////////////////////////////////
  // Common used semantic function

  // Check if the operands of operation obey the rule in the signature
  // And set type as the result type of signature
  private void setTypeAndCheckSignature(ParseNode node, Object operator, List<Type> childTypes) {
    FunctionSignatures signatures = FunctionSignatures.signaturesOf(operator);

    // the operands of operation should obey the rule in the signature
    if (signatures.accepts(childTypes)) {
      FunctionSignature signature = FunctionSignatures.signature(signatures.getKey(), childTypes);
      Type resultType = signature.resultType().getTypeWithoutVariable();
      assignParameterTypeFromSignature(node, signature, childTypes);
      node.setSignature(signature);
      node.setType(resultType);
    } else {
      typeCheckError(node, childTypes);
      node.setType(PrimitiveType.ERROR);
    }
  }

  // Should be only used by functionInvocation type checking
  private void setTypeAndCheckSignature(ParseNode node, FunctionSignatures signatures,
      List<Type> childTypes) {
    // the operands of operation should obey the rule in the signature
    if (signatures.accepts(childTypes)) {
      FunctionSignature signature = FunctionSignatures.signature(signatures.getKey(), childTypes);
      Type resultType = signature.resultType().getTypeWithoutVariable();
      assignParameterTypeFromSignature(node.child(1), signature, childTypes);
      node.setSignature(signature);
      node.setType(resultType);
    } else {
      typeCheckError(node, childTypes);
      node.setType(PrimitiveType.ERROR);
    }
  }

  private void assignParameterTypeFromSignature(ParseNode node, FunctionSignature signature,
      List<Type> childTypes) {
    Type[] parameterType = signature.getParameterType();
    for (int i = 0; i < parameterType.length; i++) {
      if (parameterType[i] instanceof PrimitiveType && childTypes.get(i) instanceof PrimitiveType) {
        node.child(i).setOriginalType(node.child(i).getType());
        node.child(i).setType(parameterType[i]);
      }
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // error logging/printing
  private void typeCheckError(ParseNode node, List<Type> operandTypes) {
    Token token = node.getToken();
    logError("operator " + token.getLexeme() + " not defined for types " + operandTypes + " at "
        + token.getLocation());
  }

  private void controlFlowError(ParseNode node) {
    logError(node.getToken().getLexeme() + "Statement Expression Error");
  }

  private void indexingTargetError(ParseNode node) {
    logError(node.getToken().getLexeme() + " the target can not be indexed Error");
  }

  private void releaseTypeError(ParseNode node) {
    logError(node.getToken().getLexeme() + " Release Type Error");
  }

  private void expressionElementTypeError(ParseNode node) {
    logError(node.getToken().getLexeme() + " expression list type can not be promoted Error");
  }

  private void returnFindNoLambdaError(ParseNode node) {
    logError(node.getToken().getLexeme() + " return cannot find its lambda Error");
  }

  private void variableReturnDifferDefinitionError(ParseNode node) {
    logError(
        node.getToken().getLexeme() + " variable return does not match function definition error");
  }

  private void loopControlFindNoLoopError(ParseNode node) {
    logError(node.getToken().getLexeme() + " loop control cannot find loop Error");
  }

  private void expressionNoElementError(ParseNode node) {
    logError(node.getToken().getLexeme() + " expression no element Error");
  }

  private void functionInvocationExpressionNotLambdaTypeError(ParseNode node) {
    logError(node.getToken().getLexeme() + " function invocation expression not lambda type Error");
  }

  private void assignmentToUntargetableExpressionError(ParseNode node) {
    logError(node.getToken().getLexeme() + " assignment to untargetable expression Error");
  }

  private void assignmentToConstantError(ParseNode node) {
    logError(node.getToken().getLexeme() + " assignment to constant Error");
  }

  private void lambdaNodeWrongEnterMethodError(ParseNode node) {
    logError(node.getToken().getLexeme() + " lambdaNode wrong enter method Error");
  }

  private void lambdaNodeLackReturnStatementError(ParseNode node) {
    logError(node.getToken().getLexeme() + " lambdaNode lack return statement Error");
  }

  private void assignVoidToVariableError(ParseNode node) {
    logError(node.getToken().getLexeme() + " void assigned to variable Error");
  }

  private void forStatementSequenceTypeError(ParseNode node) {
    logError(node.getToken().getLexeme() + " for statement have a wrong type of sequence Error");
  }

  public static void logError(String message) {
    PikaLogger log = PikaLogger.getLogger("compiler.semanticAnalyzer");
    log.severe(message);
  }
}
