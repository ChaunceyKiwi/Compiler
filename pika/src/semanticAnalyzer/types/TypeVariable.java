package semanticAnalyzer.types;

public final class TypeVariable implements Type {
  private Type subType;

  public TypeVariable() {
    subType = null;
  }

  public void setSubType(Type type) {
    subType = type;
  }

  public int getSize() {
    return 0;
  }

  public Type getSubtype() {
    return subType;
  }

  public String infoString() {
    if(subType != null)
      return subType.infoString();
    else 
      return "Unset";
  }

  @Override
  public String toString() {
    return infoString();
  }

  public void resetTypeVariable() {
    subType = null;
  }

  public Type getTypeWithoutVariable() {
    return subType;
  }

  public boolean match(Type type) {
    if (subType == null) {
      setSubType(type);
      return true;
    } else {
      return subType.match(type);
    }
  }

  public boolean isReferenceType() {
    return false;
  }
}
