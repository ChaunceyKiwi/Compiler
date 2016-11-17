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
		throw new RuntimeException("Node class unimplemented in SemanticAnalysisVisitor: " + node.getClass());
	}
	
	///////////////////////////////////////////////////////////////////////////
	// constructs larger than statements
	@Override
	public void visitEnter(ProgramNode node) {
		enterScope(node);
		//enterProgramScope(node);
	}
	
	@Override
	public void visitLeave(ProgramNode node) {
		leaveScope(node);
	}
	
	@Override
	public void visitEnter(BlockStatementNode node) {
		enterScope(node);
		//enterSubscope(node);
	}
	
	@Override
	public void visitLeave(BlockStatementNode node) {
		leaveScope(node);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// helper methods for scoping.
//	private void enterProgramScope(ParseNode node) {
//		Scope scope = Scope.createProgramScope();
//		node.setScope(scope);
//	}
//	
//	private void enterSubscope(ParseNode node) {
//		Scope baseScope = node.getLocalScope();
//		Scope scope = baseScope.createSubscope();
//		node.setScope(scope);
//	}	
	
	private void enterScope(ParseNode node) {
		node.getScope().enter();
	}
	
	private void leaveScope(ParseNode node) {
		node.getScope().leave();
	}
	
	///////////////////////////////////////////////////////////////////////////
	// Functions Related
	
	///////////////////////////////////////////////////////////////////////////
	// FunctionDefinition
	public void visitEnter(FunctionDefinitionNode node) {
	}
	
	public void visitLeave(FunctionDefinitionNode node) {
		assert node.nChildren() == 2;
	}
	
	///////////////////////////////////////////////////////////////////////////
	// ParameterList
	public void visitLeave(ParameterListNode node) {
		for(int i = 0; i < node.nChildren(); i++) {
			ParseNode paraSpecNode = node.child(i);
			ParseNode typeNode = paraSpecNode.child(0);
			IdentifierNode identifierNode = (IdentifierNode)(paraSpecNode.child(1));
			Type type = typeNode.getType();
			Scope scope = identifierNode.getLocalScope();

			identifierNode.setType(type);			
			scope.getSymbolTable().errorIfAlreadyDefined(identifierNode.getToken());
			addBinding(identifierNode, type, false);
		}
	}
	
	///////////////////////////////////////////////////////////////////////////
	// FunctionInvocation
	public void visitLeave(FunctionInvocationNode node) {
		assert node.nChildren() == 2;
		ParseNode expressionNode = node.child(0);
		if(!((expressionNode instanceof IdentifierNode) || (expressionNode instanceof LambdaNode))){
			functionInvocationExpressionNotLambdaTypeError(node);
		}
		
		ExpressionListNode expressionListNode = (ExpressionListNode)node.child(1);
		FunctionSignatures functionSignatures;
		List<Type> typeListFromExpNode = new ArrayList<Type>();
		LambdaType lambdaType;
		
		for(int i = 0; i < expressionListNode.nChildren(); i++) {
			typeListFromExpNode.add(expressionListNode.child(i).getType());
		}
		
		// Either IdentifierNode or LambdaNode
		if(expressionNode instanceof IdentifierNode) {		
			IdentifierNode identifierNode = (IdentifierNode)expressionNode;
			Type type = identifierNode.getType();
			if(type instanceof LambdaType) {
				lambdaType = (LambdaType)type; 
				functionSignatures = new FunctionSignatures(expressionNode.getToken().getLexeme(),
						getSignaturesFromTypeArray(lambdaType));
				setTypeAndCheckSignature(node, functionSignatures, typeListFromExpNode);
			}else {
				functionInvocationExpressionNotLambdaTypeError(node);
			}
		}else {
			LambdaNode lambdaNode = (LambdaNode)expressionNode;
			lambdaType = (LambdaType)lambdaNode.getType();
			functionSignatures = new FunctionSignatures(expressionNode.getToken().getLexeme(),
					getSignaturesFromTypeArray(lambdaType));
			setTypeAndCheckSignature(node, functionSignatures, typeListFromExpNode);
		}
	}
	
	private FunctionSignature getSignaturesFromTypeArray(LambdaType lambdaType) {
		Type[] typeArrayForSignature = (lambdaType.getTypeList()).toArray(new Type[(lambdaType.getTypeList()).size() + 1]);
		typeArrayForSignature[typeArrayForSignature.length-1] = lambdaType.getResultType();
		
		return new FunctionSignature(1, true, typeArrayForSignature);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// Lambda
	public void visitEnter(LambdaNode node) {
		enterScope(node);
	}
	
	public void visitLeave(LambdaNode node) {
		assert node.nChildren() == 2;
		leaveScope(node);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// ReturnStatement
	public void visitLeave(ReturnStatementNode node) {
		assert node.nChildren() <= 1;
				
		ParseNode lambdaNode = node.findLambdaNode(node);
		
		if(lambdaNode instanceof LambdaNode) {
			node.setLambdaNode((LambdaNode)lambdaNode);
		}else {
			returnFindNoLambdaError(node);
		}
		
		Type returnType;
		if(node.nChildren() == 0) {
			returnType = PrimitiveType.NO_TYPE;
		}else {
			returnType = node.child(0).getType();
		}
		
		Type expectedType = ((LambdaNode)lambdaNode).getLambdaType().getResultType();
		if(expectedType.match(returnType)) {
			node.setType(expectedType);
		}else{
			variableReturnDifferDefinitionError(node);
		}	
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////
	// Statements
	/*
	 *	Statements -> Declatation
	 *				  AssignmentStatement 
	 *			      IfStatement
	 *			      WhileStatement 
	 *			      PrintStatement
	 *			  	  BlockStatement
	 *				  ReleaseStatement
	 */
		
	// Declatation
	@Override
	public void visitLeave(DeclarationNode node) {
		IdentifierNode identifier = (IdentifierNode) node.child(0);
		ParseNode initializer = node.child(1);
		Scope scope = identifier.getLocalScope();
		
		Type declarationType = initializer.getType();
		node.setType(declarationType);
		identifier.setType(declarationType);
		
		// If identifier has already been declared in current scope, report error.
		scope.getSymbolTable().errorIfAlreadyDefined(identifier.getToken());
		
		if(initializer instanceof LambdaNode) {
			Binding binding = scope.createFunctionBinding(identifier, (LambdaNode)initializer);
			identifier.setBinding(binding);
		}else if((initializer instanceof IdentifierNode) && (initializer.getType() instanceof LambdaType)) {
			Binding binding = scope.createFunctionBinding(identifier, declarationType,
					((IdentifierNode)initializer).getBinding().getLexeme());
			identifier.setBinding(binding);
		}else {
			// If identifier has not been declared in current scope, 
			// binding it to current scope and its symbol table.
			// If the declaration is var then variable is mutable, const then unmutuable
			if(node.getToken().isLextant(Keyword.VAR))
				addBinding(identifier, declarationType, true);
			else if(node.getToken().isLextant(Keyword.CONST))
				addBinding(identifier, declarationType, false);
			else
				logError("Declaration type is neither var nor const");	
		}
	}
	
	// AssignmentStatement
	@Override
	public void visitLeave(AssignmentStatementNode node) {
		assert node.nChildren() == 2;
		ParseNode target = node.child(0);
		if(target instanceof IdentifierNode && ((IdentifierNode) target).getBinding().isMutable() == false){
			assignmentToConstantError(node);
		}
		ParseNode initializer = node.child(1);
		Type identifierType = target.getType();
		Type assignmentType = initializer.getType();
		List<Type> childTypes = Arrays.asList(identifierType, assignmentType);
		setTypeAndCheckSignature(node, AssignmentStatementNode.VALUE_ASSIGNMENT, childTypes);
	}
	
	// IfStatement
	@Override
	public void visitLeave(IfStatementNode node){
		assert node.nChildren() >= 2;
		checkIfExpressionIsBoolean(node.child(0));
	}
	
	// WhileStatement
	@Override
	public void visitLeave(WhileStatementNode node){
		assert node.nChildren() == 2;
		checkIfExpressionIsBoolean(node.child(0));
	}
	
	// PrintStatement
	@Override
	public void visitLeave(PrintStatementNode node) {
	}
	
	// ReleaseStatement
	@Override
	public void visitLeave(ReleaseStatementNode node){
		assert node.nChildren() == 1;
		Type type = node.child(0).getType();
		if(!(type instanceof ArrayType)) {
			releaseTypeError(node);
		}
	}
	
	// BreakStatement
	@Override
	public void visitLeave(BreakStatementNode node){
		assert node.nChildren() == 0;
		
		// Set target for loop control
		// Report error if no loop statement found
		ParseNode loopStatementNode = BreakStatementNode.findLoopStatementNode(node);
		if(loopStatementNode == null) {
			loopControlFindNoLoopError(node);
		}else {
			node.setLoopStatementNode((WhileStatementNode)loopStatementNode);
		}
	}
	
	// ContinueStatement
	@Override
	public void visitLeave(ContinueStatementNode node){
		assert node.nChildren() == 0;
		
		// Set target for loop control
		// Report error if no loop statement found
		ParseNode loopStatementNode = ContinueStatementNode.findLoopStatementNode(node);
		if(loopStatementNode == null) {
			loopControlFindNoLoopError(node);
		}else {
			node.setLoopStatementNode((WhileStatementNode)loopStatementNode);
		}
	}
	
	public void checkIfExpressionIsBoolean(ParseNode node){
		if(node.getType() != PrimitiveType.BOOLEAN){
			controlFlowError(node);
		}
	}

	///////////////////////////////////////////////////////////////////////////
	// Expressions
	
	/* Expression -> BinaryExpression
	 * 			  -> UnaryExpression
	 * 			  -> TypeCastingExpression
	 * 			  -> ArrayIndexingExpression 
	 */
	
	// BinaryExpression
	@Override
	public void visitLeave(BinaryOperatorNode node) {
		assert node.nChildren() == 2;
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
		Lextant operator = operatorFor(node);
		
		// if both sides is array type and is comparision, skip typechecking
		if((left.getType() instanceof ArrayType && right.getType() instanceof ArrayType &&
				(operator == Punctuator.EQUAL || operator == Punctuator.NOTEQUAL))){
			setTypeAndCheckSignature(node, BinaryOperatorNode.ARRAY_COMPARISON, childTypes);
		}else{
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
		assert node.nChildren() == 1;
		List<Type> childTypes = Arrays.asList(node.child(0).getType());
		
		Lextant operator = operatorFor(node);
		if(operator == Keyword.LENGTH){
			setTypeAndCheckSignature(node, UnaryOperatorNode.ARRAY_LENGTH, childTypes);
		}
		else if(operator == Punctuator.NOT){
			setTypeAndCheckSignature(node, UnaryOperatorNode.BOOLEAN_NOT, childTypes);
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
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
		setTypeAndCheckSignature(node, TypeCastingNode.TYPE_CASTING, childTypes);
	}
	
	// ArrayIndexingExpression
	@Override
	public void visitLeave(ArrayIndexingNode node){
		assert node.nChildren() == 2;
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
		
		setTypeAndCheckSignature(node, ArrayIndexingNode.ARRAY_INDEXING, childTypes);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// ArrayExpressions
	
	/* ArrayExpressions -> NewArrayTypeLengthExpression
	 * 			  		-> ExpressionList
	 * 			  		-> CloneExpression 
	 * 
	 */
	
	// NewArrayTypeLengthExpression
	@Override
	public void visitLeave(NewArrayTypeLengthNode node){
		assert node.nChildren() == 2;
		ParseNode left  = node.child(0);
		ParseNode right = node.child(1);
		List<Type> childTypes = Arrays.asList(left.getType(), right.getType());
		setTypeAndCheckSignature(node, NewArrayTypeLengthNode.EMPTY_ARRAY_CREATION, childTypes);
	}

	//ExpressionList
	@Override
	public void visitLeave(ExpressionListNode node){
		int numOfChildren = node.nChildren();
		
		if(numOfChildren == 0) {
			expressionNoElementError(node);
		}else{
			Type[] types = new Type[numOfChildren];
			
			// need type check here
			for(int i = 0; i < numOfChildren; i++){
				types[i] = node.child(i).getType();
			}
			node.setType(new ArrayType(types[0], node.nChildren()));
		}
	}
	
	// CloneExpression
	@Override
	public void visitLeave(CopyOperatorNode node) {
		assert node.nChildren() == 1;
		ParseNode right = node.child(0);
		List<Type> childTypes = Arrays.asList(right.getType());
		
		setTypeAndCheckSignature(node, CopyOperatorNode.ARRAY_CLONE, childTypes);
	}
	
	///////////////////////////////////////////////////////////////////////////
	// ArrayType
	
	@Override
	public void visitLeave(TypeNode node){
		assert node.nChildren() <= 1;
		// Primitive Type
		if(node.nChildren() == 0) {
			assert node.getType() instanceof PrimitiveType;
			String primitiveTypeLexeme = node.getToken().getLexeme();
			PrimitiveType primitiveType = PrimitiveType.returnPrimitiveTypeByLexeme(primitiveTypeLexeme);
			node.setType(primitiveType);
		// Array Type
		}else if(node.nChildren() == 1){
			assert node.child(0) instanceof TypeNode;
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
		// If the identifier is not in the delcaration statement
		if(!isBeingDeclared(node)) {		
			Binding binding = node.findVariableBinding();
			
			node.setType(binding.getType());
			node.setBinding(binding);
		}
		// else parent DeclarationNode does the processing.
	}
	
	private boolean isBeingDeclared(IdentifierNode node) {
		ParseNode parent = node.getParent();
		return (parent instanceof ParameterSpecificationNode) ||
				((parent instanceof DeclarationNode) && (node == parent.child(0)));
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
	private void setTypeAndCheckSignature(ParseNode node, Object operator, List<Type> childTypes){
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(operator);

		// the operands of operation should obey the rule in the signature
		if(signatures.accepts(childTypes)) {
			FunctionSignature signature = FunctionSignatures.signature(signatures.getKey(), childTypes);
			Type resultType = signature.resultType().getTypeWithoutVariable();
			node.setSignature(signature);			
			node.setType(resultType);
		}else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	
	private void setTypeAndCheckSignature(ParseNode node, FunctionSignatures signatures, List<Type> childTypes){
		// the operands of operation should obey the rule in the signature
		if(signatures.accepts(childTypes)) {
			FunctionSignature signature = FunctionSignatures.signature(signatures.getKey(), childTypes);
			Type resultType = signature.resultType().getTypeWithoutVariable();
			node.setSignature(signature);			
			node.setType(resultType);
		}else {
			typeCheckError(node, childTypes);
			node.setType(PrimitiveType.ERROR);
		}
	}
	
	///////////////////////////////////////////////////////////////////////////
	// error logging/printing

	private void typeCheckError(ParseNode node, List<Type> operandTypes) {
		Token token = node.getToken();
		logError("operator " + token.getLexeme() + " not defined for types " 
				 + operandTypes  + " at " + token.getLocation());	
	}
	
	private void controlFlowError(ParseNode node) {
		logError(node.getToken().getLexeme() + "Statement Expression Error");
	}
	
	private void releaseTypeError(ParseNode node) {
		logError(node.getToken().getLexeme() + " Release Type Error");
	}
	
//	private void expressionElementDifferentTypeError(ParseNode node){
//		logError(node.getToken().getLexeme() + " expression list different type Error");
//	}
	
	private void returnFindNoLambdaError(ParseNode node) {
		logError(node.getToken().getLexeme() + " return cannot find its lambda Error");
	}
	
	private void variableReturnDifferDefinitionError(ParseNode node) {
		logError(node.getToken().getLexeme() + " variable return does not match function definition error");
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
	
	private void assignmentToConstantError(ParseNode node) {
		logError(node.getToken().getLexeme() + " assignment to constant Error");
	}
	
	public static void logError(String message) {
		PikaLogger log = PikaLogger.getLogger("compiler.semanticAnalyzer");
		log.severe(message);
	}
}