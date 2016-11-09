package semanticAnalyzer;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import symbolTable.Scope;
import symbolTable.Binding;


public class SemanticAnalysisPreVisitor extends ParseNodeVisitor.Default{
	///////////////////////////////////////////////////////////////////////////
	// constructs larger than statements
	@Override
	public void visitEnter(ProgramNode node) {
		createProgramScope(node);
	}
	
	@Override
	public void visitEnter(BlockStatementNode node) {
		if(node.getParent() instanceof FunctionDefinitionNode) {
			createProcedureScope(node);
		}else {
			createSubscope(node);
		}
	}
	
	///////////////////////////////////////////////////////////////////////////
	// Function related
	@Override
	public void visitEnter(FunctionDefinitionNode node) {
		createParameterScope(node);
		setBinding(node);
	}
	
	private void setBinding(FunctionDefinitionNode node) {
		Scope scope = node.getRootScope();
		Binding binding = scope.createFunctionBinding(node);
		IdentifierNode identifierNode = (IdentifierNode)node.child(0);
		
		identifierNode.setBinding(binding);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// helper methods for scoping.
	private void createProgramScope(ParseNode node) {
		Scope scope = Scope.createProgramScope();
		node.setScope(scope);
	}
	
	private void createParameterScope(ParseNode node) {
		Scope baseScope = node.getLocalScope();
		Scope scope = baseScope.createParameterScope();
		node.setScope(scope);
	}
	
	private void createProcedureScope(ParseNode node) {
		Scope baseScope = node.getLocalScope();
		Scope scope = baseScope.createProcedureScope();
		node.setScope(scope);
	}
	
	private void createSubscope(ParseNode node) {
		Scope baseScope = node.getLocalScope();
		Scope scope = baseScope.createSubscope();
		node.setScope(scope);
	}	
}
