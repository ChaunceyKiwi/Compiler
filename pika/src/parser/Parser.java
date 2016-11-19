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
  // program -> globalDefinition? EXEC blockStatement
  private ParseNode parseProgram() {
    if (!startsProgram(nowReading)) {
      return syntaxErrorNode("program");
    }

    ParseNode program = new ProgramNode(nowReading);

    // check if exist globalDefinition
    if (startsGlobalDefinition(nowReading)) {
      ParseNode globalDefinitoin = parseGlobalDefinition();
      program.appendChild(globalDefinitoin);
    }

    expect(Keyword.EXEC);
    ParseNode blockStatement = parseBlockStatement();
    program.appendChild(blockStatement);

    if (!(nowReading instanceof NullToken)) {
      return syntaxErrorNode("end of program");
    }

    return program;
  }

  private boolean startsProgram(Token token) {
    return token.isLextant(Keyword.EXEC) || startsGlobalDefinition(token);
  }

  ///////////////////////////////////////////////////////////
  // Function Related

  /* globalDefinition -> functionDefinition */
  /* functionDefinition -> func identifier lambda */
  /* lambda -> lambdaParamType blockStatement */
  /* lambdaParamType -> <parameterList> -> type */
  /* parameterList -> parameterSpecification* (,) */
  /* parameterSpecification -> type identifier */

  ///////////////////////////////////////////////////////////
  // globalDefinition -> functionDefinition*
  private ParseNode parseGlobalDefinition() {
    if (!startsGlobalDefinition(nowReading)) {
      return syntaxErrorNode("global definition");
    }

    ParseNode globalDefinition = new GlobalDefinitionNode(nowReading);

    while (startsFunctionDefinition(nowReading)) {
      ParseNode functionDefinition = parseFunctionDefinition();
      globalDefinition.appendChild(functionDefinition);
    }

    return globalDefinition;
  }

  private boolean startsGlobalDefinition(Token token) {
    return startsFunctionDefinition(token);
  }

  ///////////////////////////////////////////////////////////
  // FunctionDefinition -> func identifier lambda
  private ParseNode parseFunctionDefinition() {
    if (!startsFunctionDefinition(nowReading)) {
      return syntaxErrorNode("function definition");
    }

    Token functionDefinitionToken = nowReading;
    expect(Keyword.FUNC);
    ParseNode identifier = parseIdentifier();
    ParseNode lambda = parseLambda();
    return FunctionDefinitionNode.withChildren(functionDefinitionToken, identifier, lambda);
  }

  private boolean startsFunctionDefinition(Token token) {
    return token.isLextant(Keyword.FUNC);
  }

  ///////////////////////////////////////////////////////////
  // lambda -> lambdaParamType blockStatement
  private ParseNode parseLambda() {
    if (!startsLambda(nowReading)) {
      return syntaxErrorNode("lambda");
    }

    Token lambdaToken = nowReading;
    ParseNode lambdaParamType = parseLambdaParamType();
    ParseNode blockStatement = parseBlockStatement();
    return LambdaNode.withChildren(lambdaToken, lambdaParamType, blockStatement);
  }

  private boolean startsLambda(Token token) {
    return startsLambdaParamType(token);
  }

  ///////////////////////////////////////////////////////////
  // lambdaParamType -> <parameterList> -> type
  private ParseNode parseLambdaParamType() {
    if (!startsLambdaParamType(nowReading)) {
      return syntaxErrorNode("lambda param type");
    }

    Token lambdaParamTypeToken = nowReading;
    expect(Punctuator.LESSER);
    ParseNode parameterList = parseParameterList();
    expect(Punctuator.GREATER);
    expect(Punctuator.RESULTIN);
    ParseNode type = parseType();
    return LambdaParamTypeNode.withChildren(lambdaParamTypeToken, parameterList, type);
  }

  private boolean startsLambdaParamType(Token token) {
    return token.isLextant(Punctuator.LESSER);
  }

  ///////////////////////////////////////////////////////////
  // parameterList -> parameterSpecification*(,)
  private ParseNode parseParameterList() {
    if (!startsParameterList(nowReading) && !endsParameterList(nowReading)) {
      return syntaxErrorNode("parameter list");
    }

    ParseNode parameterListNode = new ParameterListNode(nowReading);

    while (startsParameterSpecification(nowReading) || startsParameterSeparator(nowReading)) {
      parameterListNode.appendChild(parseParameterSpecification());
      parseParameterSeparator();
    }

    return parameterListNode;
  }

  private boolean startsParameterList(Token token) {
    return startsParameterSpecification(token);
  }

  private boolean endsParameterList(Token token) {
    return token.isLextant(Punctuator.GREATER);
  }

  private void parseParameterSeparator() {
    if (!startsParameterSeparator(nowReading) && !nowReading.isLextant(Punctuator.GREATER)) {
      syntaxError(nowReading, "parameter separator not found Error");
      return;
    }

    if (nowReading.isLextant(Punctuator.SEPARATOR)) {
      readToken();
    }
  }

  private boolean startsParameterSeparator(Token token) {
    return token.isLextant(Punctuator.SEPARATOR);
  }

  ///////////////////////////////////////////////////////////
  // parameterSpecification -> type identifier
  private ParseNode parseParameterSpecification() {
    if (!startsParameterSpecification(nowReading)) {
      return syntaxErrorNode("parameter specification");
    }
    Token typeToken = nowReading;
    ParseNode type = parseType();
    ParseNode identifier = parseIdentifier();
    return ParameterSpecificationNode.withChildren(typeToken, type, identifier);
  }

  private boolean startsParameterSpecification(Token token) {
    return startsType(token);
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

  ///////////////////////////////////////////////////////////////////////////
  // statements
  private ParseNode parseStatement() {
    if (!startsStatement(nowReading)) {
      return syntaxErrorNode("statement");
    }

    if (startsDeclaration(nowReading)) {
      return parseDeclaration();
    }

    if (startsAssignmentStatement(nowReading)) {
      return parseAssignmentStatement();
    }

    if (startsIfStatement(nowReading)) {
      return parseIfStatement();
    }

    if (startsWhileStatement(nowReading)) {
      return parseWhileStatement();
    }

    if (startsPrintStatement(nowReading)) {
      return parsePrintStatement();
    }

    if (startsBlockStatement(nowReading)) {
      return parseBlockStatement();
    }

    if (startsReturnStatement(nowReading)) {
      return parseReturnStatement();
    }

    if (startsCallStatement(nowReading)) {
      return parseCallStatement();
    }

    if (startsReleaseStatement(nowReading)) {
      return parseReleaseStatement();
    }

    if (startsBreakStatement(nowReading)) {
      return parseBreakStatement();
    }

    if (startsContinueStatement(nowReading)) {
      return parseContinueStatement();
    }

    return syntaxErrorNode("statement");
  }

  private boolean startsStatement(Token token) {
    return startsDeclaration(token) || startsAssignmentStatement(token) || startsIfStatement(token)
        || startsWhileStatement(token) || startsPrintStatement(token) || startsBlockStatement(token)
        || startsReturnStatement(token) || startsCallStatement(token)
        || startsReleaseStatement(token) || startsBreakStatement(token)
        || startsContinueStatement(token);
  }

  ///////////////////////////////////////////////////////////
  // blockStatement -> { statement* }
  private ParseNode parseBlockStatement() {
    if (!startsBlockStatement(nowReading)) {
      return syntaxErrorNode("block statement");
    }

    ParseNode blockStatement = new BlockStatementNode(nowReading);
    expect(Punctuator.OPEN_BRACE);

    while (startsStatement(nowReading)) {
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
  // printStatement -> PRINT printExpressionList .
  private ParseNode parsePrintStatement() {
    if (!startsPrintStatement(nowReading)) {
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
  // printExpressionList -> printExpression* bowtie (,|;) (note that this is nullable)
  private PrintStatementNode parsePrintExpressionList(PrintStatementNode parent) {
    while (startsPrintExpression(nowReading) || startsPrintSeparator(nowReading)) {
      parsePrintExpression(parent);
      parsePrintSeparator(parent);
    }
    return parent;
  }

  ///////////////////////////////////////////////////////////
  // printExpression -> (expr | nl)? (nullable)
  private void parsePrintExpression(PrintStatementNode parent) {
    if (startsExpression(nowReading)) {
      ParseNode child = parseExpression();
      parent.appendChild(child);
    } else if (nowReading.isLextant(Keyword.NEWLINE)) {
      readToken();
      ParseNode child = new NewlineNode(previouslyRead);
      parent.appendChild(child);
    } else if (nowReading.isLextant(Keyword.TAB)) {
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
  // printExpression -> expr? ,? ;? nl?
  private void parsePrintSeparator(PrintStatementNode parent) {
    if (!startsPrintSeparator(nowReading) && !nowReading.isLextant(Punctuator.TERMINATOR)) {
      ParseNode child = syntaxErrorNode("print separator");
      parent.appendChild(child);
      return;
    }

    if (nowReading.isLextant(Punctuator.SPACE)) {
      readToken();
      ParseNode child = new SpaceNode(previouslyRead);
      parent.appendChild(child);
    } else if (nowReading.isLextant(Punctuator.SEPARATOR)) {
      readToken();
    }
  }

  // Separator can be SEPARATOR(',') and Space(';')
  private boolean startsPrintSeparator(Token token) {
    return token.isLextant(Punctuator.SEPARATOR, Punctuator.SPACE);
  }

  ///////////////////////////////////////////////////////////
  // declaration -> CONST | VAR identifier := expression .
  private ParseNode parseDeclaration() {
    if (!startsDeclaration(nowReading)) {
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
  // assignmentStatement -> target := expression .
  private ParseNode parseAssignmentStatement() {
    if (!startsAssignmentStatement(nowReading)) {
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

  // target -> expression
  // Only following three cases can be tagetable:
  // 1). an array indexing expression
  // 2). a parenthesized expression
  // 3). an identifier

  private ParseNode parseTarget() {
    if (!startsTarget(nowReading)) {
      return syntaxErrorNode("target");
    }

    if (startsOperatorExpression(nowReading)) {
      return parseOperatorExpression();
    } else if (startsParenthesesExpression(nowReading)) {
      return parseParenthesesExpression();
    } else {
      return parseIdentifier();
    }
  }

  private boolean startsTarget(Token token) {
    return startsOperatorExpression(token) || startsParenthesesExpression(token)
        || startsIdentifier(token);
  }

  ///////////////////////////////////////////////////////////
  // ifStatement -> if (expression) blockStatement (else blockStatement)?
  private ParseNode parseIfStatement() {
    if (!startsIfStatement(nowReading)) {
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

    // Might have else condition
    if (nowReading.isLextant(Keyword.ELSE)) {
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
  // whileStatement -> while (expression) blockStatement
  private ParseNode parseWhileStatement() {
    if (!startsWhileStatement(nowReading)) {
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
  // releaseStatement -> release expression
  private ParseNode parseReleaseStatement() {
    if (!startsReleaseStatement(nowReading)) {
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
  // returnStatement -> return expression? .
  private ParseNode parseReturnStatement() {
    if (!startsReturnStatement(nowReading)) {
      return syntaxErrorNode("return statement");
    }

    Token returnStatementToken = nowReading;
    ReturnStatementNode returnStatementNode = new ReturnStatementNode(returnStatementToken);
    readToken();

    // Expression is optional
    if (startsExpression(nowReading)) {
      ParseNode expression = parseExpression();
      returnStatementNode.appendChild(expression);
    }

    expect(Punctuator.TERMINATOR);
    return returnStatementNode;
  }

  private boolean startsReturnStatement(Token token) {
    return token.isLextant(Keyword.RETURN);
  }

  ///////////////////////////////////////////////////////////
  // callStatement -> call functionInvocation .
  private ParseNode parseCallStatement() {
    if (!startsCallStatement(nowReading)) {
      return syntaxErrorNode("call statement");
    }

    Token callStatementToken = nowReading;
    expect(Keyword.CALL);
    ParseNode functionInvocation = parseExpression();
    expect(Punctuator.TERMINATOR);
    return CallStatementNode.withChildren(callStatementToken, functionInvocation);
  }

  private boolean startsCallStatement(Token token) {
    return token.isLextant(Keyword.CALL);
  }

  ///////////////////////////////////////////////////////////
  // expressionList -> expression*(,)
  private ParseNode parseExpressionList() {
    if (!startsExpressionList(nowReading) && !endsExpressionList(nowReading)) {
      return syntaxErrorNode("expression list");
    }

    ParseNode expressionListNode = new ExpressionListNode(nowReading);

    while (startsExpression(nowReading) || startsExpressionSeparator(nowReading)) {
      expressionListNode.appendChild(parseExpression());
      parseExpressionSeparator();
    }

    return expressionListNode;
  }

  private boolean startsExpressionList(Token token) {
    return startsExpression(token);
  }

  private boolean endsExpressionList(Token token) {
    return token.isLextant(Punctuator.CLOSE_BRACKET);
  }

  private void parseExpressionSeparator() {
    if (!startsExpressionSeparator(nowReading) && !nowReading.isLextant(Punctuator.CLOSE_BRACKET)) {
      syntaxError(nowReading, "expression separator not found Error");
      return;
    }

    if (nowReading.isLextant(Punctuator.SEPARATOR)) {
      readToken();
    }
  }

  private boolean startsExpressionSeparator(Token token) {
    return token.isLextant(Punctuator.SEPARATOR);
  }

  ///////////////////////////////////////////////////////////
  // breakStatement -> break.
  private ParseNode parseBreakStatement() {
    if (!startsBreakStatement(nowReading)) {
      return syntaxErrorNode("break statement");
    }

    Token breakStatementToken = nowReading;
    BreakStatementNode breakStatementNode = new BreakStatementNode(breakStatementToken);
    readToken();
    expect(Punctuator.TERMINATOR);
    return breakStatementNode;
  }

  private boolean startsBreakStatement(Token token) {
    return token.isLextant(Keyword.BREAK);
  }

  ///////////////////////////////////////////////////////////
  // continueStatement -> continue.
  private ParseNode parseContinueStatement() {
    if (!startsContinueStatement(nowReading)) {
      return syntaxErrorNode("break statement");
    }

    Token continueStatementToken = nowReading;
    ContinueStatementNode continueStatementNode = new ContinueStatementNode(continueStatementToken);
    readToken();
    expect(Punctuator.TERMINATOR);
    return continueStatementNode;
  }

  private boolean startsContinueStatement(Token token) {
    return token.isLextant(Keyword.CONTINUE);
  }

  ///////////////////////////////////////////////////////////
  // Expressions
  // expression -> booleanOrExpression
  // booleanOrExpression -> booleanAndExpression [|| booleanAndExpression]? (left-assoc)
  // booleanAndExpression -> comparisonExpression [&& comparisonExpression]? (left-assoc)
  // comparisonExpression -> additiveExpression [compareOperator additiveExpression]? (left-assoc)
  // additiveExpression -> multiplicativeExpression [+|- multiplicativeExpression]* (left-assoc)
  // multiplicativeExpression -> unaryExpression [*|/|//|//|/// unaryExpression]* (left-assoc)
  // unaryExpression -> !operatorExpression | length operatorExpression | copyExpression (right-associative)
  // operatorExpression -> atomicExpression[expression] | atomicExpression(expressionList)
  // atomicExpression -> literal
  // literal -> intNumber | identifier | booleanConstant

  ///////////////////////////////////////////////////////////
  // expression -> booleanOrExpression
  private ParseNode parseExpression() {
    if (!startsExpression(nowReading)) {
      return syntaxErrorNode("expression");
    }
    return parseBooleanOrExpression();
  }

  private boolean startsExpression(Token token) {
    return startsBooleanOrExpression(token);
  }

  ///////////////////////////////////////////////////////////
  // booleanOrExpression -> booleanAndExpression [|| booleanAndExpression]? (left-assoc)
  private ParseNode parseBooleanOrExpression() {
    if (!startsBooleanOrExpression(nowReading)) {
      return syntaxErrorNode("comparison expression");
    }

    ParseNode left = parseBooleanAndExpression();
    while (nowReading.isLextant(Punctuator.OR)) {
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
  // booleanAndExpression -> comparisonExpression [&& comparisonExpression]? (left-assoc)
  private ParseNode parseBooleanAndExpression() {
    if (!startsBooleanAndExpression(nowReading)) {
      return syntaxErrorNode("comparison expression");
    }

    ParseNode left = parseComparisonExpression();

    while (nowReading.isLextant(Punctuator.AND)) {
      Token booleanAndToken = nowReading;
      readToken();
      ParseNode right = parseComparisonExpression();
      left = BinaryOperatorNode.withChildren(booleanAndToken, left, right);
    }

    return left;
  }

  private boolean startsBooleanAndExpression(Token token) {
    return startsComparisonExpression(token);
  }

  ///////////////////////////////////////////////////////////
  // comparisonExpression -> additiveExpression [compareOperator additiveExpression]? (left-assoc)
  private ParseNode parseComparisonExpression() {
    if (!startsComparisonExpression(nowReading)) {
      return syntaxErrorNode("comparison expression");
    }

    ParseNode left = parseAdditiveExpression();
    while (nowReading.isLextant(Punctuator.LESSER) || nowReading.isLextant(Punctuator.LESSEROREQUAL)
        || nowReading.isLextant(Punctuator.EQUAL) || nowReading.isLextant(Punctuator.NOTEQUAL)
        || nowReading.isLextant(Punctuator.GREATER)
        || nowReading.isLextant(Punctuator.GREATEROREQUAL)) {
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
  // additiveExpression -> multiplicativeExpression [+|- multiplicativeExpression]* (left-assoc)
  private ParseNode parseAdditiveExpression() {
    if (!startsAdditiveExpression(nowReading)) {
      return syntaxErrorNode("additiveExpression");
    }

    ParseNode left = parseMultiplicativeExpression();

    while (nowReading.isLextant(Punctuator.ADD, Punctuator.SUBTRACT)) {
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
  // multiplicativeExpression -> unaryExpression [*|/|//|//|/// unaryExpression]* (left-assoc)
  private ParseNode parseMultiplicativeExpression() {
    if (!startsUnaryExpression(nowReading)) {
      return syntaxErrorNode("multiplicativeExpression");
    }

    ParseNode left = parseUnaryExpression();

    while (startsMultiplicativeOperator(nowReading)) {
      Token multiplicativeToken = nowReading;
      readToken();
      ParseNode right = parseUnaryExpression();
      left = BinaryOperatorNode.withChildren(multiplicativeToken, left, right);
    }

    return left;
  }

  private boolean startsMultiplicativeOperator(Token token) {
    return token.isLextant(Punctuator.MULTIPLY, Punctuator.DIVIDE, Punctuator.OVER,
        Punctuator.EXPRESSOVER, Punctuator.RATIONALIZE);
  }

  private boolean startsMultiplicativeExpression(Token token) {
    return startsUnaryExpression(token);
  }

  ///////////////////////////////////////////////////////////
  // unaryExpression -> !operatorExpression | length operatorExpression | copyExpression
  /////////////////////////////////////////////////////////// (right-associative)
  private ParseNode parseUnaryExpression() {
    if (!startsUnaryExpression(nowReading)) {
      return syntaxErrorNode("unaryExpression");
    }

    if (startsUnaryOperator(nowReading)) {
      Token unaryToken = nowReading;
      readToken();
      ParseNode right = parseOperatorExpression();
      return UnaryOperatorNode.withChildren(unaryToken, right);
    } else {
      ParseNode right = parseOperatorExpression();
      return right;
    }
  }

  private boolean startsUnaryExpression(Token token) {
    return startsUnaryOperator(token) || startsAtomicExpression(token);
  }

  private boolean startsUnaryOperator(Token token) {
    return token.isLextant(Punctuator.NOT, Keyword.LENGTH, Keyword.COPY);
  }

  ///////////////////////////////////////////////////////////
  // operatorExpression -> atomicExpression[expression] | atomicExpression(expressionList)
  // expression[expression] as arrayIndexing and expression (expressionList) as functionInvocation
  private ParseNode parseOperatorExpression() {
    if (!startsOperatorExpression(nowReading)) {
      return syntaxErrorNode("arrayIndexingExpression");
    }

    ParseNode expressionToBeOperated = parseAtomicExpression();
    Token nextToken = nowReading;

    // arrayIndexing
    while (nowReading.isLextant(Punctuator.OPEN_SQUARE_BRACKET)) {
      expect(Punctuator.OPEN_SQUARE_BRACKET);
      ParseNode expressionToGetIndex = parseExpression();
      expect(Punctuator.CLOSE_SQUARE_BRACKET);
      expressionToBeOperated =
          ArrayIndexingNode.withChildren(nextToken, expressionToBeOperated, expressionToGetIndex);
    }

    // functionInvocation
    if (nowReading.isLextant(Punctuator.OPEN_BRACKET)) {
      expect(Punctuator.OPEN_BRACKET);
      ParseNode expressionToGetArgument = parseExpressionList();
      expect(Punctuator.CLOSE_BRACKET);
      expressionToBeOperated = FunctionInvocationNode.withChildren(nextToken,
          expressionToBeOperated, expressionToGetArgument);
    }

    return expressionToBeOperated;
  }

  private boolean startsOperatorExpression(Token token) {
    return startsAtomicExpression(token);
  }

  ///////////////////////////////////////////////////////////
  // atomicExpression -> parenthesesExpression
  // -> typeCastingOrArrayPopulationExpression
  // -> emptyArrayCreationExpression
  // -> literal
  private ParseNode parseAtomicExpression() {
    if (!startsAtomicExpression(nowReading)) {
      return syntaxErrorNode("atomic expression");
    }

    if (startsParenthesesExpression(nowReading)) {
      return parseParenthesesExpression();
    }

    if (startsCastingOrArrayPopulationExpression(nowReading)) {
      return parseCastingOrArrayPopulationExpression();
    }

    if (startsEmptyArrayCreationExpression(nowReading)) {
      return parseEmptyArrayCreationExpression();
    }

    if (startsLambda(nowReading)) {
      return parseLambda();
    }

    return parseLiteral();
  }

  private boolean startsAtomicExpression(Token token) {
    return startsParenthesesExpression(token) || startsCastingOrArrayPopulationExpression(token)
        || startsEmptyArrayCreationExpression(token) || startsLambda(token) || startsLiteral(token);
  }

  ///////////////////////////////////////////////////////////
  // ParenthesesExpression
  private ParseNode parseParenthesesExpression() {
    if (!startsParenthesesExpression(nowReading)) {
      return syntaxErrorNode("parenthesesExpression");
    }

    expect(Punctuator.OPEN_BRACKET);
    ParseNode expressionInParentheses = parseExpression();
    expect(Punctuator.CLOSE_BRACKET);
    return expressionInParentheses;
  }

  private boolean startsParenthesesExpression(Token token) {
    return token.isLextant(Punctuator.OPEN_BRACKET);
  }

  ///////////////////////////////////////////////////////////
  // castingOrArrayPopulationExpression
  // functionCasting    -> expression[expression]
  // functionInvocation -> expression(expressionList)
  
  private ParseNode parseCastingOrArrayPopulationExpression() {
    if (!startsCastingOrArrayPopulationExpression(nowReading)) {
      return syntaxErrorNode("typeCastingOrArrayPopulationExpression");
    }

    expect(Punctuator.OPEN_SQUARE_BRACKET);

    if (!startsExpression(nowReading)) {
      return syntaxErrorNode("Neither typeCastingExpression nor arrayExpression");
    }

    ParseNode expressionToBePerform = parseExpression();
    Token token = nowReading;

    if (token.isLextant(Punctuator.VERITICAL_BAR)) {
      expect(Punctuator.VERITICAL_BAR);
      ParseNode typeNode = parseType();
      expect(Punctuator.CLOSE_SQUARE_BRACKET);
      return TypeCastingNode.withChildren(token, expressionToBePerform, typeNode);
    } else if (token.isLextant(Punctuator.SEPARATOR, Punctuator.CLOSE_SQUARE_BRACKET)) {
      ParseNode expressionListNode = new ExpressionListNode(nowReading);
      expressionListNode.appendChild(expressionToBePerform);

      while (nowReading.isLextant(Punctuator.SEPARATOR)) {
        readToken();
        ParseNode expressionNode = parseExpression();
        expressionListNode.appendChild(expressionNode);
      }

      expect(Punctuator.CLOSE_SQUARE_BRACKET);
      return expressionListNode;
    } else {
      return syntaxErrorNode("Neither typeCastingExpression nor arrayExpression");
    }
  }

  private boolean startsCastingOrArrayPopulationExpression(Token token) {
    return token.isLextant(Punctuator.OPEN_SQUARE_BRACKET);
  }

  ///////////////////////////////////////////////////////////
  // emptyArrayCreationExpression -> new arrayType (expression)
  private ParseNode parseEmptyArrayCreationExpression() {
    if (!startsEmptyArrayCreationExpression(nowReading)) {
      return syntaxErrorNode("arrayExpression");
    }

    Token newToken = nowReading;
    readToken();
    ParseNode arrayType = parseArrayType();
    ParseNode arrayLength = parseExpression();
    return NewArrayTypeLengthNode.withChildren(newToken, arrayType, arrayLength);
  }

  private boolean startsEmptyArrayCreationExpression(Token token) {
    return token.isLextant(Keyword.NEW);
  }

  ///////////////////////////////////////////////////////////
  // Literal -> integerConstant
  // floatingConstant
  // booleanConstant
  // characterConstant
  // stringConstant
  // identifier

  private ParseNode parseLiteral() {
    if (!startsLiteral(nowReading)) {
      return syntaxErrorNode("literal");
    }

    if (startsIntNumber(nowReading)) {
      return parseIntNumber();
    }

    if (startsFloatingNumber(nowReading)) {
      return parseFloatingNumber();
    }

    if (startsBooleanConstant(nowReading)) {
      return parseBooleanConstant();
    }

    if (startsChar(nowReading)) {
      return parseChar();
    }

    if (startsString(nowReading)) {
      return parseString();
    }

    if (startsIdentifier(nowReading)) {
      return parseIdentifier();
    }

    return syntaxErrorNode("literal");
  }

  private boolean startsLiteral(Token token) {
    return startsIntNumber(token) || startsFloatingNumber(token) || startsChar(token)
        || startsString(token) || startsIdentifier(token) || startsBooleanConstant(token);
  }

  ///////////////////////////////////////////////////////////
  // integerConstant (terminal)
  private ParseNode parseIntNumber() {
    if (!startsIntNumber(nowReading)) {
      return syntaxErrorNode("integer constant");
    }
    readToken();
    return new IntegerConstantNode(previouslyRead);
  }

  private boolean startsIntNumber(Token token) {
    return token instanceof NumberToken;
  }

  ///////////////////////////////////////////////////////////
  // floatingConstant (terminal)
  private ParseNode parseFloatingNumber() {
    if (!startsFloatingNumber(nowReading)) {
      return syntaxErrorNode("floating constant");
    }
    readToken();
    return new FloatingConstantNode(previouslyRead);
  }

  private boolean startsFloatingNumber(Token token) {
    return token instanceof FloatingToken;
  }

  ///////////////////////////////////////////////////////////
  // booleanConstant (terminal)
  private ParseNode parseBooleanConstant() {
    if (!startsBooleanConstant(nowReading)) {
      return syntaxErrorNode("boolean constant");
    }
    readToken();
    return new BooleanConstantNode(previouslyRead);
  }

  private boolean startsBooleanConstant(Token token) {
    return token.isLextant(Keyword.TRUE, Keyword.FALSE);
  }

  ///////////////////////////////////////////////////////////
  // characterConstant (terminal)
  private ParseNode parseChar() {
    if (!startsChar(nowReading)) {
      return syntaxErrorNode("char constant");
    }
    readToken();
    return new CharConstantNode(previouslyRead);
  }

  private boolean startsChar(Token token) {
    return token instanceof CharToken;
  }

  ///////////////////////////////////////////////////////////
  // stringConstant (terminal)
  private ParseNode parseString() {
    if (!startsString(nowReading)) {
      return syntaxErrorNode("string constant");
    }
    readToken();
    return new StringConstantNode(previouslyRead);
  }

  private boolean startsString(Token token) {
    return token instanceof StringToken;
  }

  ///////////////////////////////////////////////////////////
  // identifier (terminal)
  private ParseNode parseIdentifier() {
    if (!startsIdentifier(nowReading)) {
      return syntaxErrorNode("identifier");
    }
    readToken();
    return new IdentifierNode(previouslyRead);
  }

  private boolean startsIdentifier(Token token) {
    return token instanceof IdentifierToken;
  }

  ///////////////////////////////////////////////////////////
  // type -> primitiveType | arrayType | void | lambdaType
  // primitiveType -> bool | char | string | int | float | rat
  // arrayType -> [type]
  // lambdaType -> < typeList > -> type
  // typeList -> type*(,)

  private ParseNode parseType() {
    if (!startsType(nowReading)) {
      return syntaxErrorNode("parse type");
    }

    if (startsPrimitiveType(nowReading)) {
      return parsePrimitiveType();
    }

    if (startsArrayType(nowReading)) {
      return parseArrayType();
    }

    if (startsVoidType(nowReading)) {
      return parseVoidType();
    }

    if (startsLambdaType(nowReading)) {
      return parseLambdaType();
    }

    return syntaxErrorNode("Wrong type");
  }


  private boolean startsType(Token token) {
    return startsPrimitiveType(token) || startsArrayType(token) || startsVoidType(token)
        || startsLambdaType(token);
  }

  ///////////////////////////////////////////////////////////
  // primitiveType -> bool | char | string | int | float | rat
  private ParseNode parsePrimitiveType() {
    if (!startsPrimitiveType(nowReading)) {
      return syntaxErrorNode("primitiveType");
    }
    readToken();
    return new TypeNode(previouslyRead);
  }

  private boolean startsPrimitiveType(Token token) {
    return token.isLextant(Keyword.BOOLEAN, Keyword.CHARACTER, Keyword.STRING, Keyword.INTEGER,
        Keyword.FLOATING, Keyword.RATIONAL);
  }

  ///////////////////////////////////////////////////////////
  // arrayType -> [type]
  private ParseNode parseArrayType() {
    Token token = nowReading;

    if (!startsArrayType(nowReading)) {
      return syntaxErrorNode("arrayType");
    }
    expect(Punctuator.OPEN_SQUARE_BRACKET);
    ParseNode innerTypeNode = parseType();
    expect(Punctuator.CLOSE_SQUARE_BRACKET);
    return TypeNode.withChildren(token, innerTypeNode);
  }

  private boolean startsArrayType(Token token) {
    return token.isLextant(Punctuator.OPEN_SQUARE_BRACKET);
  }

  ///////////////////////////////////////////////////////////
  // void
  private ParseNode parseVoidType() {
    if (!startsVoidType(nowReading)) {
      return syntaxErrorNode("void type");
    }
    readToken();
    return new TypeNode(previouslyRead);
  }

  private boolean startsVoidType(Token token) {
    return token.isLextant(Keyword.VOID);
  }

  ///////////////////////////////////////////////////////////
  // lambdaType -> < typeList > -> type
  private ParseNode parseLambdaType() {
    if (!startsLambdaParamType(nowReading)) {
      return syntaxErrorNode("lambda param type");
    }

    Token lambdaTypeToken = nowReading;
    expect(Punctuator.LESSER);
    ParseNode typeList = parseTypeList();
    expect(Punctuator.GREATER);
    expect(Punctuator.RESULTIN);
    ParseNode type = parseType();
    return LambdaTypeNode.withChildren(lambdaTypeToken, typeList, type);
  }

  private boolean startsLambdaType(Token token) {
    return token.isLextant(Punctuator.LESSER);
  }

  ///////////////////////////////////////////////////////////
  // typeList -> type*(,)
  private ParseNode parseTypeList() {
    if (!startsTypeList(nowReading) && !endsTypeList(nowReading)) {
      return syntaxErrorNode("type list");
    }

    ParseNode typeListNode = new TypeListNode(nowReading);

    while (startsType(nowReading) || startsTypeSeparator(nowReading)) {
      typeListNode.appendChild(parseType());
      parseTypeSeparator();
    }
    return typeListNode;
  }

  private boolean startsTypeList(Token token) {
    return startsType(token);
  }

  private boolean endsTypeList(Token token) {
    return token.isLextant(Punctuator.GREATER);
  }

  private void parseTypeSeparator() {
    if (!startsTypeSeparator(nowReading) && !nowReading.isLextant(Punctuator.GREATER)) {
      syntaxError(nowReading, "type separator not found Error");
      return;
    }

    if (nowReading.isLextant(Punctuator.SEPARATOR)) {
      readToken();
    }
  }

  private boolean startsTypeSeparator(Token token) {
    return token.isLextant(Punctuator.SEPARATOR);
  }

  ///////////////////////////////////////////////////////////
  // Helper function below
  private void readToken() {
    previouslyRead = nowReading;
    nowReading = scanner.next();
  }

  // if the current token is one of the given lextants, read the next token.
  // otherwise, give a syntax error and read next token (to avoid endless looping).
  private void expect(Lextant... lextants) {
    if (!nowReading.isLextant(lextants)) {
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

