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
	public final static int header_size = startsForElement;
	
	private final static int typeIdentifier = 7;
	private final Boolean immutability;
	private final Boolean subtype_is_reference;
	private final Boolean is_deleted;
	private final Boolean permanent;
	private final int length;
	
	private Type subType;
	
    public int getLength() {
//        assert(length >= 0);
        return length;
    }
    
	public ArrayType(){
		subType = null;
		immutability = false;
		subtype_is_reference = false;
		is_deleted = false;
		permanent = false;
		length = -1;
	}
	
	public ArrayType(Type type){
		subType = type;
		immutability = false;
		subtype_is_reference = type.isReferenceType();
		is_deleted = false;
		permanent = false;
		length = -1;
	}
	
	public ArrayType(Type type, int nChildren){
		subType = type;
		immutability = false;
		subtype_is_reference = type.isReferenceType();
		is_deleted = false;
		permanent = false;
		length = nChildren;
	}
	
	public Type getTypeWithoutVariable() {
		if(subType instanceof TypeVariable) {
			return new ArrayType(((TypeVariable) subType).getSubtype());
		}
		
		return this;
	}
	
	public void resetTypeVariable(){
		subType.resetTypeVariable();
	}
	
	public Type getSubType(){
		if(subType instanceof TypeVariable)
			return ((TypeVariable)subType).getSubtype();
		else
			return subType;
	}
	
	public int getTypeIdentifier(){
		return typeIdentifier;
	}
	
	public boolean match(Type type){
		if(!(type instanceof ArrayType))
			return false;
		else{
			ArrayType arrayType = (ArrayType)type;
			return subType.match(arrayType.getSubType());
		}
	}
	
	public int getStatus() {
		int status = 0;
		
		// bit 0 immutability
		if(immutability)
			status += 1;
		
		// bit 1 sub_type_is_reference
		if(subtype_is_reference)
			status += 2;
		
		// bit 2 is_deleted
		if(is_deleted)
			status += 4;
		
		// bit 3 permanent
		if(permanent)
			status += 8;
		
		return status;
	}

	public int getSize() {
		// return the size of the reference type
		return 4; 
	}
	
	public int getHeaderSize(){
		return header_size;
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
