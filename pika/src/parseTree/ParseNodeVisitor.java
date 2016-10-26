package parseTree;

import parseTree.nodeTypes.*;

// Visitor pattern with pre- and post-order visits
public interface ParseNodeVisitor {
	// non-leaf nodes: visitEnter and visitLeave
	void visitEnter(BinaryOperatorNode node);
	void visitLeave(BinaryOperatorNode node);
	
	void visitEnter(UnaryOperatorNode node);
	void visitLeave(UnaryOperatorNode node);
	
	void visitEnter(CopyOperatorNode node);
	void visitLeave(CopyOperatorNode node);
	
	void visitEnter(BlockStatementNode node);
	void visitLeave(BlockStatementNode node);

	void visitEnter(DeclarationNode node);
	void visitLeave(DeclarationNode node);

	void visitEnter(AssignmentStatementNode node);
	void visitLeave(AssignmentStatementNode node);
	
	void visitEnter(ParseNode node);
	void visitLeave(ParseNode node);
	
	void visitEnter(PrintStatementNode node);
	void visitLeave(PrintStatementNode node);
	
	void visitEnter(ProgramNode node);
	void visitLeave(ProgramNode node);
	
	void visitEnter(TypeCastingNode node);
	void visitLeave(TypeCastingNode node);
	
	void visitEnter(ExpressionListNode node);
	void visitLeave(ExpressionListNode node);
	
	void visitEnter(NewArrayTypeLengthNode node);
	void visitLeave(NewArrayTypeLengthNode node);
	
	void visitEnter(TypeNode node);
	void visitLeave(TypeNode node);
	
	void visitEnter(IfStatementNode node);
	void visitLeave(IfStatementNode node);
	
	void visitEnter(WhileStatementNode node);
	void visitLeave(WhileStatementNode node);
	
	void visitEnter(ArrayIndexingNode node);
	void visitLeave(ArrayIndexingNode node);
	
	void visitEnter(ReleaseStatementNode node);
	void visitLeave(ReleaseStatementNode node);
	
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

	public static class Default implements ParseNodeVisitor
	{
		public void defaultVisit(ParseNode node) {	}
		
		public void defaultVisitEnter(ParseNode node) {
			defaultVisit(node);
		}
		
		public void defaultVisitLeave(ParseNode node) {
			defaultVisit(node);
		}
		
		public void defaultVisitForLeaf(ParseNode node) {
			defaultVisit(node);
		}
		
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
		
		public void visitEnter(CopyOperatorNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(CopyOperatorNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(DeclarationNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(DeclarationNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(BlockStatementNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(BlockStatementNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(ParseNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(ParseNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(PrintStatementNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(PrintStatementNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(AssignmentStatementNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(AssignmentStatementNode node) {
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
		
		public void visitLeave(ArrayIndexingNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(ArrayIndexingNode node) {
			defaultVisitEnter(node);
		}
		
		public void visitLeave(NewArrayTypeLengthNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(TypeNode node) {
			defaultVisitEnter(node);
		}
		
		public void visitLeave(TypeNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(IfStatementNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(IfStatementNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(WhileStatementNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(WhileStatementNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(ReleaseStatementNode node){
			defaultVisitEnter(node);
		}
		public void visitLeave(ReleaseStatementNode node) {
			defaultVisitLeave(node);
		}
		
		public void visitEnter(ProgramNode node) {
			defaultVisitEnter(node);
		}
		public void visitLeave(ProgramNode node) {
			defaultVisitLeave(node);
		}
		
		public void visit(BooleanConstantNode node) {
			defaultVisitForLeaf(node);
		}
		
		public void visit(ErrorNode node) {
			defaultVisitForLeaf(node);
		}
		
		public void visit(IdentifierNode node) {
			defaultVisitForLeaf(node);
		}
		
		public void visit(IntegerConstantNode node) {
			defaultVisitForLeaf(node);
		}
		
		public void visit(FloatingConstantNode node) {
			defaultVisitForLeaf(node);
		}
		
		public void visit(CharConstantNode node){
			defaultVisitForLeaf(node);
		}
		
		public void visit(StringConstantNode node){
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
		
		public void visit(TypeCastedToNode node) {
			defaultVisitForLeaf(node);
		}
	}
}
