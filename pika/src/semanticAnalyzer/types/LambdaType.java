package semanticAnalyzer.types;

import java.util.List;

public class LambdaType implements Type{
	List<Type> typeList = null;
	Type resultType = null;
	
	public LambdaType(List<Type> _typeList, Type _resultType) {
		typeList = _typeList;
		resultType = _resultType;
	}
	
	public void setTypeList(List<Type> _typeList) {
		typeList = _typeList;
	}
	
	public void setResultType(Type _resultType) {
		resultType = _resultType;
	}
	
	public List<Type> getTypeList() {
		return typeList;
	}
	
	public Type getResultType() {
		return resultType;
	}
	
	public String infoString() {
		String infoString = "<";
		
		if(typeList.size() > 0) {
    		for (Type type: typeList) {
    			infoString += type.infoString();
    			infoString += ", ";
    		}
    		infoString = infoString.substring(0, infoString.length() - 2);
		}
		
		infoString += ">";
		infoString += " -> ";
		infoString += resultType.infoString();
		
		return infoString;
	}
	
	@Override
	public String toString() {
		return infoString();
	}

	@Override
	public int getSize() {
		return 0;
	}

	@Override
	public boolean isReferenceType() {
		return false;
	}

	@Override
	public boolean match(Type type) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void resetTypeVariable() {
	}

	@Override
	public Type getTypeWithoutVariable() {
		return null;
	}
}
