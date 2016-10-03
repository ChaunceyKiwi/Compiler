package lexicalAnalyzer;


import logging.PikaLogger;

import inputHandler.InputHandler;
import inputHandler.LocatedChar;
import inputHandler.LocatedCharStream;
import inputHandler.PushbackCharStream;
import inputHandler.TextLocation;
import tokens.*;

import static lexicalAnalyzer.PunctuatorScanningAids.*;

public class LexicalAnalyzer extends ScannerImp implements Scanner {
	public static LexicalAnalyzer make(String filename) {
		InputHandler handler = InputHandler.fromFilename(filename);
		PushbackCharStream charStream = PushbackCharStream.make(handler);
		return new LexicalAnalyzer(charStream);
	}

	public LexicalAnalyzer(PushbackCharStream input) {
		super(input);
	}

	
	//////////////////////////////////////////////////////////////////////////////
	// Token-finding main dispatch	

	@Override
	protected Token findNextToken() {
		LocatedChar ch = nextNonWhitespaceChar();
		
		if(isCommentSymbol(ch)){
			ch = nextNonCommentChar();
			return findNextToken();
		}
		else if(isNumberStart(ch)) {
			return scanNumber(ch);
		}
		else if(isCharStart(ch)){
			return scanChar(ch);
		}
		else if(isStringStart(ch)){
			return scanString(ch);
		}
		else if(isIdentifierStart(ch)) {
			return scanIdentifier(ch);
		}
		else if(isPunctuatorStart(ch)) {
			return PunctuatorScanner.scan(ch, input);
		}
		else if(isEndOfInput(ch)) {
			return NullToken.make(ch.getLocation());
		}
		else {
			lexicalError(ch);
			return findNextToken();
		}
	}
	
	// continue finding next char until find a newline or #
	private LocatedChar nextNonCommentChar(){
		LocatedChar ch = input.next();

		while(!isCommentSymbol(ch) && !isNewLine(ch))
			ch = input.next();

		return ch;
	}
	
	public boolean isCommentSymbol(LocatedChar ch ) {
		return (ch.getCharacter() == '#');
	}

	public boolean isNewLine(LocatedChar ch) {
		return (ch.getCharacter() == '\n' || ch.getCharacter() == '\r');
	}


	// continue finding next char until find a non-space char
	private LocatedChar nextNonWhitespaceChar() {
		LocatedChar ch = input.next();
		while(ch.isWhitespace()) {
			ch = input.next();
		}
		return ch;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Integer lexical analysis	
	
	private Token scanNumber(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		int flag = appendSubsequentDigits(buffer);
		
		if (flag == 0)
			return NumberToken.make(firstChar.getLocation(), buffer.toString());
		else
			return FloatingToken.make(firstChar.getLocation(), buffer.toString());
	}
	
	// If next char is also digit, append it and try next until not digit
	private int appendSubsequentDigits(StringBuffer buffer) {
		LocatedChar c = input.next();
		
		while(c.isDigit()) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		
		if(isDotFollowedByDigit(c)){
			buffer.append(c.getCharacter());
			c = input.next();
		}else{
			input.pushback(c);
			return 0;
		}
		
		while(c.isDigit()){
			buffer.append(c.getCharacter());
			c = input.next();			
		}
		
		input.pushback(c);
		
		return 1;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Character lexical analysis	
	
	private Token scanChar(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		LocatedChar c = input.next();
		buffer.append(c.getCharacter());
		input.next();
		
		return CharToken.make(firstChar.getLocation(), buffer.toString());
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Character lexical analysis	
	
	private Token scanString(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		LocatedChar c = input.next();
		while(c.getCharacter() != '"' && c.getCharacter() != '\n'){
			buffer.append(c.getCharacter());
			c = input.next();
		}
		if(c.getCharacter() == '"')
			return StringToken.make(firstChar.getLocation(), buffer.toString());
		else
			throw new IllegalArgumentException("String format error");	
	}
	
	//////////////////////////////////////////////////////////////////////////////
	// Identifier and keyword lexical analysis	

	private Token scanIdentifier(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentLetter(buffer);

		String lexeme = buffer.toString();
		if(Keyword.isAKeyword(lexeme)) {
			return LextantToken.make(firstChar.getLocation(), lexeme, Keyword.forLexeme(lexeme));
		}
		else {
			return IdentifierToken.make(firstChar.getLocation(), lexeme);
		}
	}
	private void appendSubsequentLetter(StringBuffer buffer) {
		LocatedChar c = input.next();
		while(Character.isLetter(c.getCharacter()) || c.getCharacter() == '_' || c.getCharacter() == '$') {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		input.pushback(c);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Punctuator lexical analysis	
	// old method left in to show a simple scanning method.
	// current method is the algorithm object PunctuatorScanner.java

	@SuppressWarnings("unused")
	private Token oldScanPunctuator(LocatedChar ch) {
		TextLocation location = ch.getLocation();
		
		switch(ch.getCharacter()) {
		case '*':
			return LextantToken.make(location, "*", Punctuator.MULTIPLY);
		case '+':
			return LextantToken.make(location, "+", Punctuator.ADD);
		case '>':
			return LextantToken.make(location, ">", Punctuator.GREATER);
		case ':':
			if(ch.getCharacter()=='=') {
				return LextantToken.make(location, ":=", Punctuator.ASSIGN);
			}
			else {
				throw new IllegalArgumentException("found : not followed by = in scanOperator");
			}
		case ',':
			return LextantToken.make(location, ",", Punctuator.SEPARATOR);
		case ';':
			return LextantToken.make(location, ";", Punctuator.TERMINATOR);
		default:
			throw new IllegalArgumentException("bad LocatedChar " + ch + "in scanOperator");
		}
	}

	

	//////////////////////////////////////////////////////////////////////////////
	// Character-classification routines specific to Pika scanning.	

	private boolean isPunctuatorStart(LocatedChar lc) {
		char c = lc.getCharacter();
		return isPunctuatorStartingCharacter(c);
	}
	
	private boolean isNumberStart(LocatedChar lc){
		return lc.isDigit() || isSignFollowedByDigit(lc);
	}
	
	private boolean isCharStart(LocatedChar lc){
		char c = lc.getCharacter();
		
		return c == '^' && input.peek().isCharInRange(32, 126);
	}
	
	private boolean isStringStart(LocatedChar lc){
		char c = lc.getCharacter();
		
		return c == '"';
	}
	
	private boolean isIdentifierStart(LocatedChar lc){
		char c = lc.getCharacter();
		
		return Character.isLetter(c) ||  c == '_';
	}
	
	private boolean isSignFollowedByDigit(LocatedChar lc){
		char c = lc.getCharacter();
		return (c == '+' || c == '-') && input.peek().isDigit();
	}
	
	private boolean isDotFollowedByDigit(LocatedChar lc){
		char c = lc.getCharacter();
		return (c == '.') && input.peek().isDigit();
	}
	
	private boolean isEndOfInput(LocatedChar lc) {
		return lc == LocatedCharStream.FLAG_END_OF_INPUT;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// Error-reporting	

	private void lexicalError(LocatedChar ch) {
		PikaLogger log = PikaLogger.getLogger("compiler.lexicalAnalyzer");
		log.severe("Lexical error: invalid character " + ch);
	}

	
}
