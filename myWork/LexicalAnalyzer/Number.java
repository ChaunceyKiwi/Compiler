	//////////////////////////////////////////////////////////////////////////////
	// Integer lexical analysis	
	
	private Token scanNumber(LocatedChar firstChar) {
		StringBuffer buffer = new StringBuffer();
		buffer.append(firstChar.getCharacter());
		appendSubsequentDigits(buffer);
		
		return NumberToken.make(firstChar.getLocation(), buffer.toString());
	}
	
	// If next char is also digit, append it and try next until not digit
	private void appendSubsequentDigits(StringBuffer buffer) {
		LocatedChar c = input.next();
		while(c.isDigit()) {
			buffer.append(c.getCharacter());
			c = input.next();
		}
		input.pushback(c);
	}


	//////////////////////////////////////////////////////////////////////////////
	// Number lexical analysis	
	
	private Token scanNumber(LocatedChar firstChar){
		StringBuffer buffer = new StringBuffer();
		buffer.append(furstChar.getCharacter());

		// type 0 means integer, type 1 means floating
		int type = appendSubsequentDigits(buffer);
	}

	private int appendSubsequentDigits(StringBuffer buffer){
		LocatedChar c = input.next();

		while（c.isDigit()）{
			buffer.append(c.getCharacter());
			c = input.next();
		}

		if(c.getCharacter() != '.') 
			return 0;
		else{
			buffer.append(c.getCharacter());
			c = input.next();
		}

		while（c.isDigit()）{
			buffer.append(c.getCharacter());
			c = input.next();
		}




	}