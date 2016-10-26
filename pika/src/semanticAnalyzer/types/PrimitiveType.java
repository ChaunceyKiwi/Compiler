package semanticAnalyzer.types;
import lexicalAnalyzer.Keyword;

public enum PrimitiveType implements Type {
	BOOLEAN(1),
	CHARACTER(1),
	STRING(4),
	INTEGER(4),
	FLOATING(8),
	RATIONAL(8),
	ERROR(0),			// use as a value when a syntax error has occurred
	NO_TYPE(0, "");		// use as a value when no type has been assigned.
	
	
	private int sizeInBytes;
	private String infoString;
	
	private PrimitiveType(int size) {
		this.sizeInBytes = size;
		this.infoString = toString();
	}
	
	private PrimitiveType(int size, String infoString) {
		this.sizeInBytes = size;
		this.infoString = infoString;
	}
	
	public int getSize() {
		return sizeInBytes;
	}
	
	public String infoString() {
		return infoString;
	}
	
	public boolean match(Type type) {
		if(type instanceof PrimitiveType)
			return this == type;
		else if(type instanceof TypeVariable)
			return this == ((TypeVariable)type).getSubtype();
		else
			return false;
	}
	
	public boolean isReferenceType() {
		return false;
	}
	
	public static PrimitiveType returnPrimitiveTypeByLexeme(String Lexeme){		
		if(Lexeme.equals(Keyword.BOOLEAN.getLexeme())) return PrimitiveType.BOOLEAN;
		else if(Lexeme.equals(Keyword.CHARACTER.getLexeme())) return PrimitiveType.CHARACTER;
		else if(Lexeme.equals(Keyword.STRING.getLexeme())) return PrimitiveType.STRING;
		else if(Lexeme.equals(Keyword.INTEGER.getLexeme())) return PrimitiveType.INTEGER;
		else if(Lexeme.equals(Keyword.FLOATING.getLexeme())) return PrimitiveType.FLOATING;
		else if(Lexeme.equals(Keyword.RATIONAL.getLexeme())) return PrimitiveType.RATIONAL;
		else return PrimitiveType.ERROR;
	}
}