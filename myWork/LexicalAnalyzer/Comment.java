	// continue finding next char until find a non-space char
	private LocatedChar nextNonWhitespaceChar() {
		LocatedChar ch = input.next();
		while(ch.isWhitespace()) {
			ch = input.next();
		}
		return ch;
	}

	// continue finding next char until find a newline or #
	private LocatedChar nextNonCommentChar(){
		LocatedChar ch = input.next();

		while(!ch.isCommentSymbol() && !ch.isNewLine())
			ch = input.next();

		return ch;
	}

	protected Token findNextToken() {
		LocatedChar ch = nextNonWhitespaceChar();
		if(ch.isCommentSymbol()){
			ch = nextNonCommentChar();
			return findNextToken();
		}
		else if(ch.isDigit()) {
			return scanNumber(ch);
		}
		else if(ch.isLowerCase()) {
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


	public boolean isCommentSymbol() {
		return Character.matches("#");
	}

	public boolean isCommentSymbol() {
		return Character.isNewLine();
	}


