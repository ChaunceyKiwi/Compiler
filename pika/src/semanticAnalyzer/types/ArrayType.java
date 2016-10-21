package semanticAnalyzer.types;

public class ArrayType implements Type{
	public final static int typeID_size = 4;
	public final static int status_size = 4;
	public final static int subTypeSize_size = 4;
	public final static int length_size = 4;
	
	public final static int startsForTypeID = 0;
	public final static int startsForStatus = startsForTypeID + typeID_size;
	public final static int startsForSubTypeSize = startsForStatus + status_size;
	public final static int startsForLength = startsForSubTypeSize + subTypeSize_size;
	public final static int startsForElement = startsForLength + length_size;
	
	private Type subType;
	
	public ArrayType(){
		subType = null;
	}
	
	public ArrayType(Type type){
		subType = type;
	}
	
	public Type getSubType(){
		return subType;
	}
	
	public boolean match(Type type){
		if(!(type instanceof ArrayType))
			return false;
		else{
			ArrayType arrayType = (ArrayType)type;
			return subType.match(arrayType.getSubType());
		}
	}

	public int getSize() {
		// return the size of the reference type
		return 4; 
	}

	public String infoString() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isReferenceType() {
		return true;
	}
}
