package semanticAnalyzer.types;

public class TypeVariable implements Type {
	TypeVariable(){
		
	}
	
	public int getSize(){
		return 0;
	}
	
	public String infoString(){
		return "";
	}
	
	public boolean match(Type type){
		return false;
	}
	
	public boolean isReferenceType(){
		return false;
	}
}
