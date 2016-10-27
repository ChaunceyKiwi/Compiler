package semanticAnalyzer.types;

public interface Type {
	// Returns the size of an instance of this type, in bytes.
	public int getSize(); 
	
	// Yields a printable string for information about this type.
	// Use this rather than toString() if you want an abbreviated string.
	// In particular, this yields an empty string for PrimitiveType.NO_TYPE.
	public String infoString();

	public boolean isReferenceType();	
	
	public boolean match(Type type);
	
	public void resetTypeVariable();
}
