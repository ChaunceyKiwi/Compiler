package semanticAnalyzer.types;

import java.util.List;

public class LambdaType {
	List<Type> typeList = null;
	Type resultType = null;
	
	public LambdaType() {

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
}
