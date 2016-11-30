package semanticAnalyzer.types;

import java.util.List;

public class LambdaType implements Type {
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

    if (typeList.size() > 0) {
      for (Type type : typeList) {
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
    return 4;
  }

  @Override
  public boolean isReferenceType() {
    return true;
  }

  @Override
  public boolean match(Type type) {
    if (!(type instanceof LambdaType)) {
      return false;
    }

    LambdaType lambdaType = (LambdaType) type;
    
    // Should have the same size on parameter
    if (lambdaType.getTypeList().size() != this.getTypeList().size()) {
      return false;
    }
    
    for (int i = 0; i < lambdaType.getTypeList().size(); i++) {
      List<Type> thisList = this.getTypeList();
      List<Type> targetList = lambdaType.getTypeList();

      if (!thisList.get(i).match(targetList.get(i))) {
        return false;
      }
    }
    
    return this.getResultType().match(lambdaType.getResultType());
  }

  @Override
  public void resetTypeVariable() {
    for (Type type : this.typeList) {
      type.resetTypeVariable();
    }
    this.resultType.resetTypeVariable();
  }

  @Override
  public Type getTypeWithoutVariable() {
    return this;
  }
}
