package tokens;

import inputHandler.TextLocation;
import java.util.ArrayList;
import java.util.List;

public class StringToken extends TokenImp {
	protected String value;
	private List<CharToken> charTokens = null;
	
	protected StringToken(TextLocation location, String lexeme) {
		super(location, lexeme);
	}
	
	protected void setValue(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
	private void resolveToCharTokens(TextLocation location){		
		charTokens = new ArrayList<>();
		
		for(int i = 0; i < value.length(); i++) {
			TextLocation newLocation = new TextLocation(location.getFilename(),
					location.getLineNumber(), location.getPosition() + i + 1);
			charTokens.add(CharToken.make(newLocation, value.substring(i, i+1)));
		}
	}
	
	public List<CharToken> getCharTokens(){
		return charTokens;
	}
	
	public static StringToken make(TextLocation location, String lexeme) {
		StringToken result = new StringToken(location, lexeme);
		result.setValue(lexeme);
		result.resolveToCharTokens(location);
		return result;
	}
	
	@Override
	protected String rawString() {
		return "string, " + value;
	}
}
