package semanticAnalyzer;

import java.util.Arrays;
import java.util.List;

import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import logging.PikaLogger;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.BinaryOperatorNode;
import parseTree.nodeTypes.UnaryOperatorNode;
import parseTree.nodeTypes.BooleanConstantNode;
import parseTree.nodeTypes.BlockStatementNode;
import parseTree.nodeTypes.DeclarationNode;
import parseTree.nodeTypes.AssignmentStatementNode;
import parseTree.nodeTypes.TypeCastedToNode;
import parseTree.nodeTypes.TypeCastingNode;
import parseTree.nodeTypes.ErrorNode;
import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.IntegerConstantNode;
import parseTree.nodeTypes.FloatingConstantNode;
import parseTree.nodeTypes.CharConstantNode;
import parseTree.nodeTypes.StringConstantNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.ProgramNode;
import parseTree.nodeTypes.SpaceNode;
import parseTree.nodeTypes.ExpressionListNode;
import semanticAnalyzer.signatures.FunctionSignatures;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.ArrayType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;
import tokens.LextantToken;
import tokens.Token;

class SemanticAnalysisVisitor extends ParseNodeVisitor.Default {
	@Override
	public void visitLeave(ParseNode node) {
		throw new RuntimeException("Node class unimplemented in SemanticAnalysisVisitor: " + node.getClass());
	}
	
	///////////////////////////////////////////////////////////////////////////
	// constructs larger than statements
	@Override
	public void visitEnter(ProgramNode node) {
		enterProgramScope(node);
	}
	
	public void visitLeave(ProgramNode node) {
		leaveScope(node);
	}
	
	public void visitEnter(BlockStatementNode node) {
		enterSubscope(node);
	}
	
	public void visitLeave(BlockStatementNode node) {
		leaveScope(node);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// helper methods for scoping.
	private void enterProgramScope(ParseNode node) {
		Scope scope = Scope.createProgramScope();
		node.setScope(scope);
	}
	
	private void enterSubscope(ParseNode node) {
		Scope baseScope = node.getLocalScope();
		Scope scope = baseScope.createSubscope();
		node.setScope(scope);
	}		
	private void leaveScope(ParseNode node) {
		node.getScope().leave();
	}
	
	///////////////////////////////////////////////////////////////////////////
	// statements and declarations
	@Override
	public void visitLeave(PrintStatementNode node) {
	}
	
	@Override
	public void visitLeave(DeclarationNode node) {
		IdentifierNode identifier = (IdentifierNode) node.child(0);
		ParseNode initializer = node.child(1);
		Scope scope = identifier.getLocalScope();
		
		Type declarationType = initializer.getType();
		node.setType(declarationType);
		identifier.setType(declarationType);
		
		// check if the identifier has already been declared
		scope.getSymbolTable().errorIfAlreadyDefined(identifier.getToken());
		
		// if the declaration is var then variable is mutable
		// if the declaration is const then variable is unmutable
		if(node.getToken().isLextant(Keyword.VAR))
			addBinding(identifier, declarationType, true);
		else if(node.getToken().isLextant(Keyword.CONST))
			addBinding(identifier, declarationType, false);
		else
			logError("Declaration type is neither var nor const");			
	}
	
	@Override
	public void visitLeave(TypeCastingNode node) {
		node.setType(node.child(1).getType());
	}
	
	///////////////////////////////////////////////////////////////////////////
	// assignment
	@Override
	public void visitLeave(AssignmentStatementNode node) {
		IdentifierNode identifier = (IdentifierNode) node.child(0);
		ParseNode initializer = node.child(1);
		Boolean ismutable = identifier.getBinding().isMutable();
		
		Type assignmentType = initializer.getType();
		Type identifierType = identifier.getType();
		
		// The assignment type should be the same as the identifier type
		if(assignmentType == identifierType) {
			node.setType(assignmentType);
			identifier.setType(assignmentType);
			addBinding(identifier, assignmentType, ismutable);
		}else		
			logError("Assignment operator := not defined for types " 
					 + Arrays.asList(assignmentType, identifierType)
					 + " at " + node.getToken().getLocation());	
	}
	

	///////////////////////////////////////////////////////////////////////////
	// expressions
	@Override
	public void visitLeave(BinaryOperatorNode node) {
		assert node.nChildren() == 2;
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
		
		Lextant operator = operatorFor(node);
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(operator);
		Type resultType = FunctionSignatures.signature(signatures.getKey(), childTypes).resultType();
		
		// the operands of operation should obey the rule in the signature
		if(signatures.accepts(childTypes)) {
			node.setType(resultType);
		}else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	
	private Lextant operatorFor(BinaryOperatorNode node) {
		LextantToken token = (LextantToken) node.getToken();
		return token.getLextant();
	}
	
	///////////////////////////////////////////////////////////////////////////
	// expressions
	@Override
	public void visitLeave(UnaryOperatorNode node) {
		assert node.nChildren() == 1;
		ParseNode right = node.child(0);
		List<Type> childTypes = Arrays.asList(right.getType());
		
		Lextant operator = operatorFor(node);
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(operator);
		Type resultType = FunctionSignatures.signature(signatures.getKey(), childTypes).resultType();
		
		// the operands of operation should obey the rule in the signature
		if(signatures.accepts(childTypes)) {
			node.setType(resultType);
		}
		else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	
	private Lextant operatorFor(UnaryOperatorNode node) {
		LextantToken token = (LextantToken) node.getToken();
		return token.getLextant();
	}
	
	@Override
	public void visitLeave(ExpressionListNode node){
		int numOfChildren = node.nChildren();
		
		if(numOfChildren == 0) {
			node.setType(PrimitiveType.NO_TYPE);
		}
		else if(numOfChildren == 1) {
			ParseNode child = node.child(0);
			node.setType(child.getType());
		}else{
			Type[] types = new Type[numOfChildren];
			for(int i = 0; i < numOfChildren - 1; i++){
				types[i] = node.child(i).getType();
			}
			node.setType(new ArrayType(types[0]));
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
	public void visit(NewlineNode node) {
	}
	@Override
	public void visit(SpaceNode node) {
	}
	
	@Override
	public void visit(TypeCastedToNode node){
		String type = node.getToken().getLexeme();
		
		// bool | char | string | int | float
		// Assign the lexeme of token to the node type
		switch(type){
			case("bool"):   node.setType(PrimitiveType.BOOLEAN);   break;
			case("char"):   node.setType(PrimitiveType.CHARACTER); break;
			case("string"): node.setType(PrimitiveType.STRING);    break;
			case("int"):    node.setType(PrimitiveType.INTEGER);   break;
			case("float"):  node.setType(PrimitiveType.FLOATING);  break;
			default:        node.setType(PrimitiveType.ERROR);     break;
		}	
	}
	
	///////////////////////////////////////////////////////////////////////////
	// IdentifierNodes, with helper methods
	
	@Override
	public void visit(IdentifierNode node) {
		if(!isBeingDeclared(node)) {		
			Binding binding = node.findVariableBinding();
			
			node.setType(binding.getType());
			node.setBinding(binding);
		}
		// else parent DeclarationNode does the processing.
	}
	
	private boolean isBeingDeclared(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof DeclarationNode) && (node == parent.child(0));
	}
	
	private void addBinding(IdentifierNode identifierNode, Type type, boolean ismutable) {
		Scope scope = identifierNode.getLocalScope();
		Binding binding = scope.createBinding(identifierNode, type, ismutable);
		identifierNode.setBinding(binding);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// error logging/printing

	private void typeCheckError(ParseNode node, List<Type> operandTypes) {
		Token token = node.getToken();
		
		logError("operator " + token.getLexeme() + " not defined for types " 
				 + operandTypes  + " at " + token.getLocation());	
	}
	private void logError(String message) {
		PikaLogger log = PikaLogger.getLogger("compiler.semanticAnalyzer");
		log.severe(message);
	}
}