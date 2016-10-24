package semanticAnalyzer.types;

public final class TypeVariable implements Type {
	private Type subType;
	
	public TypeVariable(){
		subType = null;
	}
	
	public void setSubType(Type type){
		subType = type;
	}
	
	public int getSize(){
		return 0;
	}
	
	public String infoString(){
		return "";
	}
	
	public boolean match(Type type){
		if(subType == null){
			setSubType(type);
			return true;
		}else{
			return subType.match(type);
		}
	}
	
	public boolean isReferenceType(){
		return false;
	}	
}
