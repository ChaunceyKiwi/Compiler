package semanticAnalyzer.types;

public class StringType implements Type{
    public final static int typeID_size = 4;
    public final static int status_size = 4;
    public final static int length_size = 4;
    
    public final static int startsForTypeID = 0;
    public final static int startsForStatus = startsForTypeID + typeID_size;
    public final static int startsForSubTypeSize = startsForStatus + status_size;
    public final static int startsForElement = startsForSubTypeSize + length_size;
    public final static int header_size = startsForElement;
    
    private final static int typeIdentifier = 6;
    private final Boolean immutability;
    private final Boolean subtype_is_reference;
    private final Boolean is_deleted;
    private final Boolean permanent;
    private final int length;
        
    public int getLength() {
//        assert(length >= 0);
        return length;
    }
    
    public StringType(){
        immutability = true;
        subtype_is_reference = false;
        is_deleted = false;
        permanent = true;
        length = -1;
    }
    
    
    public void resetTypeVariable(){}
   
    public int getTypeIdentifier(){
        return typeIdentifier;
    }
    
    public boolean match(Type type){
        if(type instanceof StringType) {
          return true;
        } else {
          return false;
        }
    }
    
    public int getStatus() {
        int status = 0;
        if(immutability) status += 1;           // bit 0 immutability
        if(subtype_is_reference) status += 2;   // bit 1 sub_type_is_reference      
        if(is_deleted) status += 4;             // bit 2 is_deleted
        if(permanent) status += 8;              // bit 3 permanent
        return status;
    }

    public int getSize() {
        // return the size of the reference type
        return 4; 
    }
    
    public int getHeaderSize(){
        return header_size;
    }

//    public String infoString() {
//        return "[" + subType.infoString() + "]";
//    }
    
    @Override
    public String toString() {
        return infoString();
    }

    @Override
    public boolean isReferenceType() {
        return true;
    }

    @Override
    public Type getTypeWithoutVariable() {
      return this;
    }

    @Override
    public String infoString() {
      return "String";
    }
}
