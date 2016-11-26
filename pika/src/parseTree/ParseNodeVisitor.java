package parseTree;

import parseTree.nodeTypes.*;

// Visitor pattern with pre- and post-order visits
public interface ParseNodeVisitor {
  // non-leaf nodes: visitEnter and visitLeave

  ///////////////////////////////////////////////////////////
  // Constructs larger than statements
  void visitEnter(ParseNode node);

  void visitLeave(ParseNode node);

  void visitEnter(ProgramNode node);

  void visitLeave(ProgramNode node);

  ///////////////////////////////////////////////////////////
  // Function Node
  void visitEnter(GlobalDefinitionNode node);

  void visitLeave(GlobalDefinitionNode node);

  void visitEnter(FunctionDefinitionNode node);

  void visitLeave(FunctionDefinitionNode node);

  void visitEnter(LambdaNode node);

  void visitLeave(LambdaNode node);

  void visitEnter(LambdaParamTypeNode node);

  void visitLeave(LambdaParamTypeNode node);

  void visitEnter(ParameterListNode node);

  void visitLeave(ParameterListNode node);

  void visitEnter(ParameterSpecificationNode node);

  void visitLeave(ParameterSpecificationNode node);

  void visitEnter(FunctionInvocationNode node);

  void visitLeave(FunctionInvocationNode node);

  ///////////////////////////////////////////////////////////
  // Statement Node
  void visitEnter(BlockStatementNode node);

  void visitLeave(BlockStatementNode node);

  void visitEnter(PrintStatementNode node);

  void visitLeave(PrintStatementNode node);

  void visitEnter(DeclarationNode node);

  void visitLeave(DeclarationNode node);

  void visitEnter(AssignmentStatementNode node);

  void visitLeave(AssignmentStatementNode node);

  void visitEnter(IfStatementNode node);

  void visitLeave(IfStatementNode node);

  void visitEnter(WhileStatementNode node);

  void visitLeave(WhileStatementNode node);

  void visitEnter(ReleaseStatementNode node);

  void visitLeave(ReleaseStatementNode node);

  void visitEnter(ReturnStatementNode node);

  void visitLeave(ReturnStatementNode node);

  void visitEnter(CallStatementNode node);

  void visitLeave(CallStatementNode node);

  void visitEnter(BreakStatementNode node);

  void visitLeave(BreakStatementNode node);

  void visitEnter(ContinueStatementNode node);

  void visitLeave(ContinueStatementNode node);
  
  void visitEnter(ForStatementNode node);

  void visitLeave(ForStatementNode node);

  ///////////////////////////////////////////////////////////
  // Expression Node
  void visitEnter(BinaryOperatorNode node);

  void visitLeave(BinaryOperatorNode node);

  void visitEnter(UnaryOperatorNode node);

  void visitLeave(UnaryOperatorNode node);

  void visitEnter(TypeCastingNode node);

  void visitLeave(TypeCastingNode node);

  void visitEnter(ExpressionListNode node);

  void visitLeave(ExpressionListNode node);

  void visitEnter(NewArrayTypeLengthNode node);

  void visitLeave(NewArrayTypeLengthNode node);

  void visitEnter(TypeNode node);

  void visitLeave(TypeNode node);

  void visitEnter(TypeListNode node);

  void visitLeave(TypeListNode node);
  
  void visitEnter(LambdaTypeNode node);

  void visitLeave(LambdaTypeNode node);
  
  void visitEnter(ArrayIndexingNode node);

  void visitLeave(ArrayIndexingNode node);

  // leaf nodes: visitLeaf only
  void visit(BooleanConstantNode node);

  void visit(TypeCastedToNode node);

  void visit(ErrorNode node);

  void visit(IdentifierNode node);

  void visit(IntegerConstantNode node);

  void visit(FloatingConstantNode node);

  void visit(CharConstantNode node);

  void visit(StringConstantNode node);

  void visit(NewlineNode node);

  void visit(TabNode node);

  void visit(SpaceNode node);

  public static class Default implements ParseNodeVisitor {
    ///////////////////////////////////////////////////////////////////////////
    // Constructs larger than statements

    public void defaultVisit(ParseNode node) {}

    public void defaultVisitEnter(ParseNode node) {
      defaultVisit(node);
    }

    public void defaultVisitLeave(ParseNode node) {
      defaultVisit(node);
    }

    public void defaultVisitForLeaf(ParseNode node) {
      defaultVisit(node);
    }

    public void visitEnter(ParseNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ParseNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(ProgramNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ProgramNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // Function Node
    public void visitEnter(GlobalDefinitionNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(GlobalDefinitionNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(FunctionDefinitionNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(FunctionDefinitionNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(LambdaNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(LambdaNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(LambdaParamTypeNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(LambdaParamTypeNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(ParameterListNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ParameterListNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(ParameterSpecificationNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ParameterSpecificationNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(FunctionInvocationNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(FunctionInvocationNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////////////////////
    // Statements

    /*
     * Statements -> BlockStatement PrintStatement Declaration AssignmentStatement IfStatement
     * WhileStatement ReleaseStatement ReturnStatement CallStatement BreakStatement
     * ContinueStatement
     */

    ///////////////////////////////////////////////////////////
    // BlockStatement
    public void visitEnter(BlockStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(BlockStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // PrintStatement
    public void visitEnter(PrintStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(PrintStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // DeclarationStatement
    public void visitEnter(DeclarationNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(DeclarationNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // AssignmentStatement
    public void visitEnter(AssignmentStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(AssignmentStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // IfStatement
    public void visitEnter(IfStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(IfStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // WhileStatement
    public void visitEnter(WhileStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(WhileStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // ReleaseStatement
    public void visitEnter(ReleaseStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ReleaseStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // ReturnStatement
    public void visitEnter(ReturnStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ReturnStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // CallStatement
    public void visitEnter(CallStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(CallStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // BreakStatement
    public void visitEnter(BreakStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(BreakStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////
    // ContinueStatement
    public void visitEnter(ContinueStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ContinueStatementNode node) {
      defaultVisitLeave(node);
    }
    
    ///////////////////////////////////////////////////////////
    // ForStatement
    public void visitEnter(ForStatementNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ForStatementNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////////////////////
    // ExpressionNode

    public void visitEnter(BinaryOperatorNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(BinaryOperatorNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(UnaryOperatorNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(UnaryOperatorNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(TypeCastingNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(TypeCastingNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(ExpressionListNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(ExpressionListNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(NewArrayTypeLengthNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(NewArrayTypeLengthNode node) {
      defaultVisitLeave(node);
    }

    public void visitLeave(ArrayIndexingNode node) {
      defaultVisitLeave(node);
    }

    public void visitEnter(ArrayIndexingNode node) {
      defaultVisitEnter(node);
    }

    public void visitEnter(TypeNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(TypeNode node) {
      defaultVisitLeave(node);
    }
    
    public void visitEnter(LambdaTypeNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(LambdaTypeNode node) {
      defaultVisitLeave(node);
    }
    
    public void visitEnter(TypeListNode node) {
      defaultVisitEnter(node);
    }

    public void visitLeave(TypeListNode node) {
      defaultVisitLeave(node);
    }

    ///////////////////////////////////////////////////////////////////////////
    // Leaf nodes
    public void visit(IdentifierNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(TypeCastedToNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(BooleanConstantNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(ErrorNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(IntegerConstantNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(FloatingConstantNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(CharConstantNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(StringConstantNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(NewlineNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(TabNode node) {
      defaultVisitForLeaf(node);
    }

    public void visit(SpaceNode node) {
      defaultVisitForLeaf(node);
    }
  }
}
