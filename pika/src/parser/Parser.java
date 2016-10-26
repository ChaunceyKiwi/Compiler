package parser;

import java.util.Arrays;

import logging.PikaLogger;
import parseTree.*;
import parseTree.nodeTypes.*;
import tokens.*;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import lexicalAnalyzer.Scanner;


public class Parser {
	private Scanner scanner;
	private Token nowReading;
	private Token previouslyRead;
	
	public static ParseNode parse(Scanner scanner) {
		Parser parser = new Parser(scanner);
		return parser.parse();
	}
	public Parser(Scanner scanner) {
		super();
		this.scanner = scanner;
	}
	
	public ParseNode parse() {
		readToken();
		return parseProgram();
	}

	////////////////////////////////////////////////////////////
	// "program" is the start symbol S
	// S -> EXEC blockStatement
	
	private ParseNode parseProgram() {
		if(!startsProgram(nowReading)) {
			return syntaxErrorNode("program");
		}
		ParseNode program = new ProgramNode(nowReading);
		
		expect(Keyword.EXEC);
		ParseNode blockStatement = parseBlockStatement();
		program.appendChild(blockStatement);
		
		if(!(nowReading instanceof NullToken)) {
			return syntaxErrorNode("end of program");
		}
		
		return program;
	}
	private boolean startsProgram(Token token) {
		return token.isLextant(Keyword.EXEC);
	}
	
	
	///////////////////////////////////////////////////////////
	// blockStatement
	
	// blockStatement -> { statement* }
	private ParseNode parseBlockStatement() {
		if(!startsBlockStatement(nowReading)) {
			return syntaxErrorNode("block statement");
		}
		ParseNode blockStatement = new BlockStatementNode(nowReading);
		expect(Punctuator.OPEN_BRACE);
		
		while(startsStatement(nowReading)) {
			ParseNode statement = parseStatement();
			blockStatement.appendChild(statement);
		}
		
		expect(Punctuator.CLOSE_BRACE);
		return blockStatement;
	}
	
	private boolean startsBlockStatement(Token token) {
		return token.isLextant(Punctuator.OPEN_BRACE);
	}
	
	
	///////////////////////////////////////////////////////////
	// Statements
	
	// statement -> declaration | printStatement
	private ParseNode parseStatement() {
		if(!startsStatement(nowReading)) {
			return syntaxErrorNode("statement");
		}
			
		if(startsDeclaration(nowReading)) {
			return parseDeclaration();
		}
		
		if(startsAssignmentStatement(nowReading)) {
			return parseAssignmentStatement();
		}
		
		if(startsIfStatement(nowReading)){
			return parseIfStatement();
		}
		
		if(startsWhileStatement(nowReading)){
			return parseWhileStatement();
		}
		
		if(startsPrintStatement(nowReading)) {
			return parsePrintStatement();
		}
		
		if(startsBlockStatement(nowReading)){
			return parseBlockStatement();
		}
		
		if(startsReleaseStatement(nowReading)){
			return parseReleaseStatement();
		}
		
		return syntaxErrorNode("statement");
	}
	
	private boolean startsStatement(Token token) {
		return  startsDeclaration(token) || 
				startsAssignmentStatement(token) ||   
				startsIfStatement(token) ||
				startsWhileStatement(token) ||
				startsPrintStatement(token) ||
				startsBlockStatement(token) ||
				startsReleaseStatement(token);
	}
	
	///////////////////////////////////////////////////////////
	// Declaration
	
	// declaration -> CONST(or VAR) identifier := expression .
	private ParseNode parseDeclaration() {
		if(!startsDeclaration(nowReading)) {
			return syntaxErrorNode("declaration");
		}
		Token declarationToken = nowReading;
		readToken();
		
		ParseNode identifier = parseIdentifier();
		expect(Punctuator.ASSIGN);
		ParseNode initializer = parseExpression();
		expect(Punctuator.TERMINATOR);
		
		return DeclarationNode.withChildren(declarationToken, identifier, initializer);
	}
	
	private boolean startsDeclaration(Token token) {
		return token.isLextant(Keyword.CONST) || token.isLextant(Keyword.VAR);
	}
	
	///////////////////////////////////////////////////////////
	// Assignment Statement
	
	private ParseNode parseAssignmentStatement() {
		if(!startsAssignmentStatement(nowReading)) {
			return syntaxErrorNode("assignment statement");
		}
		Token assignmentStatementToken = nowReading;
		ParseNode identifier = parseTarget();
		expect(Punctuator.ASSIGN);
		ParseNode initializer = parseExpression();
		expect(Punctuator.TERMINATOR);
		
		return AssignmentStatementNode.withChildren(assignmentStatementToken, identifier, initializer);
	}
	
	private boolean startsAssignmentStatement(Token token) {
		return startsTarget(token);
	}
	
	private ParseNode parseTarget() {
		if(!startsTarget(nowReading)) {
			return syntaxErrorNode("target");
		}
		
		if(startsArrayIndexingExpression(nowReading)) {
			return parseArrayIndexingExpression();
		}else if (startsParenthesesExpression(nowReading)){
			return parseParenthesesExpression();
		}else{
			return parseIdentifier();
		}
	}
	
	private boolean startsTarget(Token token) {
		return	startsIdentifier(token) || 
				startsArrayIndexingExpression(token) ||
				startsParenthesesExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// If Statement
	
	private ParseNode parseIfStatement() {
		if(!startsIfStatement(nowReading)) {
			return syntaxErrorNode("if statement");
		}
		
		Token ifStatementToken = nowReading;
		IfStatementNode ifStatementNode = new IfStatementNode(ifStatementToken);
		readToken();
		expect(Punctuator.OPEN_BRACKET);
		ParseNode expression = parseExpression();
		ifStatementNode.appendChild(expression);
		expect(Punctuator.CLOSE_BRACKET);
		
		ParseNode trueBlockStatement = parseBlockStatement();
		ifStatementNode.appendChild(trueBlockStatement);
		
		if(nowReading.isLextant(Keyword.ELSE)){
			readToken();
			ParseNode falseBlockStatement = parseBlockStatement();
			ifStatementNode.appendChild(falseBlockStatement);
		}
				
		return ifStatementNode;
	}
	
	private boolean startsIfStatement(Token token) {
		return token.isLextant(Keyword.IF);
	}
	
	///////////////////////////////////////////////////////////
	// While Statement
	
	private ParseNode parseWhileStatement() {
		if(!startsWhileStatement(nowReading)) {
			return syntaxErrorNode("while statement");
		}
		
		Token whileStatementToken = nowReading;
		WhileStatementNode whileStatementNode = new WhileStatementNode(whileStatementToken);
		readToken();
		expect(Punctuator.OPEN_BRACKET);
		ParseNode expression = parseExpression();
		whileStatementNode.appendChild(expression);
		expect(Punctuator.CLOSE_BRACKET);
		
		ParseNode trueBlockStatement = parseBlockStatement();
		whileStatementNode.appendChild(trueBlockStatement);
				
		return whileStatementNode;
	}
	
	private boolean startsWhileStatement(Token token) {
		return token.isLextant(Keyword.WHILE);
	}
	
	///////////////////////////////////////////////////////////
	// PrintStatement
	
	// printStatement -> PRINT printExpressionList .
	private ParseNode parsePrintStatement() {
		if(!startsPrintStatement(nowReading)) {
			return syntaxErrorNode("print statement");
		}
		PrintStatementNode result = new PrintStatementNode(nowReading);
		
		readToken();
		result = parsePrintExpressionList(result);	
		expect(Punctuator.TERMINATOR);
		
		return result;
	}
	
	private boolean startsPrintStatement(Token token) {
		return token.isLextant(Keyword.PRINT);
	}	
	
	///////////////////////////////////////////////////////////
	// Release Statement
	
	private ParseNode parseReleaseStatement() {
		if(!startsReleaseStatement(nowReading)) {
			return syntaxErrorNode("while statement");
		}
		
		Token releaseStatementToken = nowReading;
		ReleaseStatementNode releaseStatementNode = new ReleaseStatementNode(releaseStatementToken);
		readToken();
		ParseNode expression = parseExpression();
		releaseStatementNode.appendChild(expression);
		expect(Punctuator.TERMINATOR);				
		
		return releaseStatementNode;
	}
	
	private boolean startsReleaseStatement(Token token) {
		return token.isLextant(Keyword.RELEASE);
	}

	///////////////////////////////////////////////////////////
	// PrintExpressionList
	
	// This adds the printExpressions it parses to the children of the given parent
	// printExpressionList -> printExpression* bowtie (,|;)  (note that this is nullable)
	private PrintStatementNode parsePrintExpressionList(PrintStatementNode parent) {
		while(startsPrintExpression(nowReading) || startsPrintSeparator(nowReading)) {
			parsePrintExpression(parent);
			parsePrintSeparator(parent);
		}
		return parent;
	}
	
	///////////////////////////////////////////////////////////
	// PrintExpression

	// This adds the printExpression it parses to the children of the given parent
	// printExpression -> (expr | nl)?     (nullable)
	private void parsePrintExpression(PrintStatementNode parent) {
		if(startsExpression(nowReading)) {
			ParseNode child = parseExpression();
			parent.appendChild(child);
		}
		else if(nowReading.isLextant(Keyword.NEWLINE)) {
			readToken();
			ParseNode child = new NewlineNode(previouslyRead);
			parent.appendChild(child);
		}else if(nowReading.isLextant(Keyword.TAB)) {
			readToken();
			ParseNode child = new TabNode(previouslyRead);
			parent.appendChild(child);
		}
		// else we interpret the printExpression as epsilon, and do nothing
	}	
	
	private boolean startsPrintExpression(Token token) {
		return startsExpression(token) || token.isLextant(Keyword.NEWLINE, Keyword.TAB);
	}
	
	///////////////////////////////////////////////////////////
	// PrintSeparator
	
	// This adds the printExpression it parses to the children of the given parent
	// printExpression -> expr? ,? ;? nl? 
	private void parsePrintSeparator(PrintStatementNode parent) {
		if(!startsPrintSeparator(nowReading) && !nowReading.isLextant(Punctuator.TERMINATOR)) {
			ParseNode child = syntaxErrorNode("print separator");
			parent.appendChild(child);
			return;
		}
		
		if(nowReading.isLextant(Punctuator.SPACE)) {
			readToken();
			ParseNode child = new SpaceNode(previouslyRead);
			parent.appendChild(child);
		}
		else if(nowReading.isLextant(Punctuator.SEPARATOR)) {
			readToken();
		}		
		else if(nowReading.isLextant(Punctuator.TERMINATOR)) {
			// we're at the end of the bowtie and this printSeparator is not required.
			// do nothing.  Terminator is handled in a higher-level nonterminal.
		}
	}
	
	// Separator can be SEPARATOR(',') and Space(';') 
	private boolean startsPrintSeparator(Token token) {
		return token.isLextant(Punctuator.SEPARATOR, Punctuator.SPACE);
	}
	
	///////////////////////////////////////////////////////////
	// expressions
	// expr                     -> comparisonExpression
	// comparisonExpression     -> additiveExpression [> additiveExpression]?
	// additiveExpression       -> multiplicativeExpression [+ multiplicativeExpression]*  (left-assoc)
	// multiplicativeExpression -> atomicExpression [MULT atomicExpression]*  (left-assoc)
	// atomicExpression         -> literal
	// literal                  -> intNumber | identifier | booleanConstant
	
	///////////////////////////////////////////////////////////
	// Expression
	
	// expression  -> comparisonExpression
	private ParseNode parseExpression() {		
		if(!startsExpression(nowReading)) {
			return syntaxErrorNode("expression");
		}
		return parseBooleanOrExpression();
	}
	
	private boolean startsExpression(Token token) {
		return startsComparisonExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// Or expression
	private ParseNode parseBooleanOrExpression() {
		if(!startsBooleanOrExpression(nowReading)) {
			return syntaxErrorNode("comparison expression");
		}
		
		ParseNode left = parseBooleanAndExpression();
		while(nowReading.isLextant(Punctuator.OR)) {
			Token booleanOrToken = nowReading;
			readToken();
			ParseNode right = parseBooleanAndExpression();
			left = BinaryOperatorNode.withChildren(booleanOrToken, left, right);
		  }
		return left;
	}
	
	private boolean startsBooleanOrExpression(Token token) {
		return startsBooleanAndExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// And expression
	private ParseNode parseBooleanAndExpression() {
		if(!startsBooleanAndExpression(nowReading)) {
			return syntaxErrorNode("comparison expression");
		}
		
		ParseNode left = parseComparisonExpression();
		while(nowReading.isLextant(Punctuator.AND)){
			Token booleanAndToken = nowReading;
			readToken();
			ParseNode right = parseComparisonExpression();
			left = BinaryOperatorNode.withChildren(booleanAndToken, left, right);
		  }
		return left;
	}
	
	private boolean startsBooleanAndExpression(Token token){
		return startsComparisonExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// comparisonExpression
	
	// comparisonExpression -> additiveExpression [> additiveExpression]*
	private ParseNode parseComparisonExpression() {
		if(!startsComparisonExpression(nowReading)) {
			return syntaxErrorNode("comparison expression");
		}
		
		ParseNode left = parseAdditiveExpression();
		while(nowReading.isLextant(Punctuator.LESSER)  || nowReading.isLextant(Punctuator.LESSEROREQUAL) ||
		   nowReading.isLextant(Punctuator.EQUAL)   || nowReading.isLextant(Punctuator.NOTEQUAL) ||
		   nowReading.isLextant(Punctuator.GREATER) || nowReading.isLextant(Punctuator.GREATEROREQUAL)){
			
			Token compareToken = nowReading;
			readToken();
			ParseNode right = parseAdditiveExpression();
			left = BinaryOperatorNode.withChildren(compareToken, left, right);
		  }
		return left;
	}
	
	private boolean startsComparisonExpression(Token token) {
		return startsAdditiveExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// AdditiveExpression
	
	// additiveExpression -> multiplicativeExpression [+\- multiplicativeExpression]*  (left-assoc)
	private ParseNode parseAdditiveExpression() {
		if(!startsAdditiveExpression(nowReading)) {
			return syntaxErrorNode("additiveExpression");
		}
		
		ParseNode left = parseMultiplicativeExpression();
		while(nowReading.isLextant(Punctuator.ADD, Punctuator.SUBTRACT)) {
			Token additiveToken = nowReading;
			readToken();
			ParseNode right = parseMultiplicativeExpression();
			left = BinaryOperatorNode.withChildren(additiveToken, left, right);
		}
		
		return left;
	}
	
	private boolean startsAdditiveExpression(Token token) {
		return startsMultiplicativeExpression(token);
	}	
	
	///////////////////////////////////////////////////////////
	// MultiplicativeExpression
	
	// multiplicativeExpression -> atomicExpression [MULT\DIVIDE atomicExpression]*  (left-assoc)
	// And also the operator for rational number
	private ParseNode parseMultiplicativeExpression() {
		if(!startsUnaryExpression(nowReading)) {
			return syntaxErrorNode("multiplicativeExpression");
		}
		
		ParseNode left = parseUnaryExpression();
		while(isMultiplicativeOperator(nowReading)) {
			Token multiplicativeToken = nowReading;
			readToken();
			ParseNode right = parseUnaryExpression();
			left = BinaryOperatorNode.withChildren(multiplicativeToken, left, right);
		}
		
		return left;
	}
	
	private boolean isMultiplicativeOperator(Token token){
		return token.isLextant(Punctuator.MULTIPLY, Punctuator.DIVIDE,
			Punctuator.OVER, Punctuator.EXPRESSOVER, Punctuator.RATIONALIZE);
	}
	
	private boolean startsMultiplicativeExpression(Token token) {
		return startsUnaryExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// UnaryExpression
	private ParseNode parseUnaryExpression() {
		if(!startsUnaryExpression(nowReading)) {
			return syntaxErrorNode("unaryExpression");
		}
		
		if(startsUnaryOperator(nowReading)) {
			Token unaryToken = nowReading;
			readToken();
			ParseNode right = parseArrayIndexingExpression();
			return UnaryOperatorNode.withChildren(unaryToken, right);
		}else {
			ParseNode right = parseArrayIndexingExpression();
			return right;
		}
	}
	
	private boolean startsUnaryExpression(Token token) {
		return startsUnaryOperator(token) || startsAtomicExpression(token);
	}
	
	private boolean startsUnaryOperator(Token token) {
		return token.isLextant(Punctuator.NOT) || token.isLextant(Keyword.LENGTH);
	}
	
	///////////////////////////////////////////////////////////
	// ArrayIndexingExpression
	
	private ParseNode parseArrayIndexingExpression(){
		if(!startsArrayIndexingExpression(nowReading)){
			return syntaxErrorNode("arrayIndexingExpression");
		}
		
		ParseNode expressionToBeIndexed = parseAtomicExpression();
		Token nextToken = nowReading;
		
		if(nextToken.isLextant(Punctuator.OPEN_SQUARE_BRACKET)) {
			expect(Punctuator.OPEN_SQUARE_BRACKET);
			ParseNode expressionToGetIndex = parseExpression();
			expect(Punctuator.CLOSE_SQUARE_BRACKET);	
			return ArrayIndexingNode.withChildren(nextToken, expressionToBeIndexed, expressionToGetIndex);
		}else{
			return expressionToBeIndexed;
		}
	}
	
	private boolean startsArrayIndexingExpression(Token token){
		return startsAtomicExpression(token);
	}
	
	///////////////////////////////////////////////////////////
	// AtomicExpression
	
	// atomicExpression -> typeCastingExpression \ parenthesesExpression \ literal
	private ParseNode parseAtomicExpression() {
		if(!startsAtomicExpression(nowReading)) {
			return syntaxErrorNode("atomic expression");
		}
		
		if(startsParenthesesExpression(nowReading))
			return parseParenthesesExpression();
		else if(startsTypeCastingExpression(nowReading))
			return parseTypeCastingExpression();
		else if(startsArrayExpression(nowReading))
			return parseArrayExpression();
		else
			return parseLiteral();
	}
	
	private boolean startsAtomicExpression(Token token) {
		return startsParenthesesExpression(token) || 
			   startsTypeCastingExpression(token) ||
			   startsArrayExpression(token)||
			   startsLiteral(token);
	}
	
	///////////////////////////////////////////////////////////
	// ParenthesesExpression
	
	private ParseNode parseParenthesesExpression(){
		if(!startsParenthesesExpression(nowReading)) {
			return syntaxErrorNode("parenthesesExpression");
		}
				
		expect(Punctuator.OPEN_BRACKET);
		ParseNode expressionInParentheses = parseExpression();
		expect(Punctuator.CLOSE_BRACKET);
		
		return expressionInParentheses;
	}
	
	private boolean startsParenthesesExpression(Token token){
		return token.isLextant(Punctuator.OPEN_BRACKET);
	}
	
	///////////////////////////////////////////////////////////
	// TypeCastingExpression
	
	private ParseNode parseTypeCastingExpression(){
		if(!startsTypeCastingExpression(nowReading)){
			return syntaxErrorNode("typeCastingExpression");
		}
		
		expect(Punctuator.OPEN_SQUARE_BRACKET);
		ParseNode expressionToBeCasted = parseExpression();
		Token verticalBarToken = nowReading;
		if(verticalBarToken.isLextant(Punctuator.VERITICAL_BAR)){
			expect(Punctuator.VERITICAL_BAR);
			Token typeToken = nowReading;
			readToken();
			expect(Punctuator.CLOSE_SQUARE_BRACKET);
			ParseNode typeNode = new TypeCastedToNode(typeToken);
			return TypeCastingNode.withChildren(verticalBarToken, expressionToBeCasted, typeNode);
		}else if(verticalBarToken.isLextant(Punctuator.SEPARATOR, Punctuator.CLOSE_SQUARE_BRACKET)){
			ParseNode expressionListNode = parseArrayExpression(expressionToBeCasted);
			return expressionListNode;
		}else{
			return syntaxErrorNode("Neither typeCastingExpression nor arrayExpression");
		}
	}
	
	private boolean startsTypeCastingExpression(Token token){
		return token.isLextant(Punctuator.OPEN_SQUARE_BRACKET);
	}
	
	///////////////////////////////////////////////////////////
	// ArrayExpression
	
	private ParseNode parseArrayExpression(){
		if(!startsArrayExpression(nowReading)) {
			return syntaxErrorNode("arrayExpression");
		}
				
		if(nowReading.isLextant(Keyword.NEW)){
			Token newToken = nowReading;
			readToken();
			ParseNode arrayType = parseArrayType();
			ParseNode arrayLength = parseExpression();
			return NewArrayTypeLengthNode.withChildren(newToken, arrayType, arrayLength);
		}else if(nowReading.isLextant(Keyword.COPY)){
			Token copyToken = nowReading;			
			readToken();
			ParseNode expressionNode = parseExpression();
			return CopyOperatorNode.withChildren(copyToken, expressionNode);
		}else
			return syntaxErrorNode("Neither new nor clone for arrayExpression");
	}
	
	private ParseNode parseArrayExpression(ParseNode firstNode){
		if(!nowReading.isLextant(Punctuator.SEPARATOR, Punctuator.CLOSE_SQUARE_BRACKET)) {
			return syntaxErrorNode("arrayExpression");
		}
		
		ParseNode expressionListNode = new ExpressionListNode(nowReading);
		expressionListNode.appendChild(firstNode);
		while(nowReading.isLextant(Punctuator.SEPARATOR)){
			readToken();
			ParseNode expressionNode = parseExpression();
			expressionListNode.appendChild(expressionNode);
		}
		expect(Punctuator.CLOSE_SQUARE_BRACKET);
		
		return expressionListNode;
	}
	
	private boolean startsArrayExpression(Token token){
		return token.isLextant(Keyword.NEW, Punctuator.OPEN_SQUARE_BRACKET, Keyword.COPY);
	}
	
	private ParseNode parseType(){
		if(startsArrayType(nowReading)) {
			return parseArrayType();
		}else if(startsPrimitiveType(nowReading)){
			return parsePrimitiveType();
		}else
			return syntaxErrorNode("Neither arrayType nor primitiveType");
	}
	
	private ParseNode parseArrayType(){
		Token token = nowReading;
		
		if(!startsArrayType(nowReading)) {
			return syntaxErrorNode("arrayType");
		}
		expect(Punctuator.OPEN_SQUARE_BRACKET);
		ParseNode innerTypeNode = parseType();
		expect(Punctuator.CLOSE_SQUARE_BRACKET);
		
		return TypeNode.withChildren(token, innerTypeNode);
	}
	
	private ParseNode parsePrimitiveType(){
		if(!startsPrimitiveType(nowReading)) {
			return syntaxErrorNode("primitiveType");
		}
		readToken();
		return new TypeNode(previouslyRead);
	}
	
	private boolean startsArrayType(Token token){
		return token.isLextant(Punctuator.OPEN_SQUARE_BRACKET);
	}
	
	private boolean startsPrimitiveType(Token token){
		return token.isLextant(Keyword.BOOLEAN, Keyword.CHARACTER, Keyword.STRING,
				Keyword.INTEGER, Keyword.FLOATING);
	}
	
	///////////////////////////////////////////////////////////
	// Literal
	
	// literal -> number | identifier | booleanConstant
	private ParseNode parseLiteral() {
		if(!startsLiteral(nowReading)) {
			return syntaxErrorNode("literal");
		}
		
		if(startsIntNumber(nowReading)) {
			return parseIntNumber();
		}
		if(startsFloatingNumber(nowReading)){
			return parseFloatingNumber();
		}
		if(startsChar(nowReading)){
			return parseChar();
		}
		if(startsString(nowReading)){
			return parseString();
		}
		if(startsIdentifier(nowReading)) {
			return parseIdentifier();
		}
		if(startsBooleanConstant(nowReading)) {
			return parseBooleanConstant();
		}

		return syntaxErrorNode("literal");
	}
	
	private boolean startsLiteral(Token token) {
		return startsIntNumber(token) || 
			   startsFloatingNumber(token)||
			   startsChar(token) ||
			   startsString(token) ||
			   startsIdentifier(token)||
			   startsBooleanConstant(token);
	}

	// number (terminal)
	private ParseNode parseIntNumber() {
		if(!startsIntNumber(nowReading)) {
			return syntaxErrorNode("integer constant");
		}
		readToken();
		return new IntegerConstantNode(previouslyRead);
	}
	
	private ParseNode parseFloatingNumber() {
		if(!startsFloatingNumber(nowReading)) {
			return syntaxErrorNode("floating constant");
		}
		readToken();
		return new FloatingConstantNode(previouslyRead);
	}
	
	private ParseNode parseChar() {
		if(!startsChar(nowReading)) {
			return syntaxErrorNode("char constant");
		}
		readToken();
		return new CharConstantNode(previouslyRead);
	}
	
	private ParseNode parseString(){	
		if(!startsString(nowReading)){
			return syntaxErrorNode("string constant");
		}
		
		ParseNode expressionListNode = new ExpressionListNode(nowReading);
		
		for(CharToken charToken : ((StringToken)nowReading).getCharTokens()) {
			expressionListNode.appendChild(new CharConstantNode(charToken));
		}
		readToken();
		
		return expressionListNode;
	}
	
	
	private boolean startsIntNumber(Token token) {
		return token instanceof NumberToken;
	}
	
	private boolean startsFloatingNumber(Token token) {
		return token instanceof FloatingToken;
	}
	
	private boolean startsChar(Token token){
		return token instanceof CharToken;
	}
	
	private boolean startsString(Token token){
		return token instanceof StringToken;
	}

	// identifier (terminal)
	private ParseNode parseIdentifier() {
		if(!startsIdentifier(nowReading)) {
			return syntaxErrorNode("identifier");
		}
		readToken();
		return new IdentifierNode(previouslyRead);
	}
	private boolean startsIdentifier(Token token) {
		return token instanceof IdentifierToken;
	}

	// boolean constant (terminal)
	private ParseNode parseBooleanConstant() {
		if(!startsBooleanConstant(nowReading)) {
			return syntaxErrorNode("boolean constant");
		}
		readToken();
		return new BooleanConstantNode(previouslyRead);
	}
	
	private boolean startsBooleanConstant(Token token) {
		return token.isLextant(Keyword.TRUE, Keyword.FALSE);
	}

	private void readToken() {
		previouslyRead = nowReading;
		nowReading = scanner.next();
	}	
	
	// if the current token is one of the given lextants, read the next token.
	// otherwise, give a syntax error and read next token (to avoid endless looping).
	private void expect(Lextant ...lextants ) {
		if(!nowReading.isLextant(lextants)) {
			syntaxError(nowReading, "expecting " + Arrays.toString(lextants));
		}
		readToken();
	}
	
	private ErrorNode syntaxErrorNode(String expectedSymbol) {
		syntaxError(nowReading, "expecting " + expectedSymbol);
		ErrorNode errorNode = new ErrorNode(nowReading);
		readToken();
		return errorNode;
	}
	
	private void syntaxError(Token token, String errorDescription) {
		String message = "" + token.getLocation() + " " + errorDescription;
		error(message);
	}
	
	private void error(String message) {
		PikaLogger log = PikaLogger.getLogger("compiler.Parser");
		log.severe("syntax error: " + message);
	}	
}

