package semanticAnalyzer.signatures;

import java.util.List;

import semanticAnalyzer.types.*;

// immutable
public class FunctionSignature {
  private Type resultType;
  private Type[] paramTypes;
  private boolean promotable;
  Object whichVariant;

  ///////////////////////////////////////////////////////////////
  // construction

  public boolean ifPromotable() {
    return promotable;
  }

  public FunctionSignature(Object whichVariant, Boolean promotable, Type... types) {
    assert (types.length >= 1);
    storeParamTypes(types);
    this.promotable = promotable;
    resultType = types[types.length - 1];
    this.whichVariant = whichVariant;
  }
  
  // Should be only used to generated signature used for funciton invocation
  public FunctionSignature(LambdaType lambdaType) {
    Type[] types =
        (lambdaType.getTypeList()).toArray(new Type[(lambdaType.getTypeList()).size() + 1]);
    types[types.length - 1] = lambdaType.getResultType();
    assert (types.length >= 1);
    storeParamTypes(types);
    this.promotable = true;
    resultType = types[types.length - 1];
    this.whichVariant = false;
  }

  private void storeParamTypes(Type[] types) {
    paramTypes = new Type[types.length - 1];
    for (int i = 0; i < types.length - 1; i++) {
      paramTypes[i] = types[i];
    }
  }

  ///////////////////////////////////////////////////////////////
  // accessors

  public Object getVariant() {
    return whichVariant;
  }

  public Type resultType() {
    return resultType;
  }

  public Type[] getParameterType() {
    return paramTypes;
  }
  
  public boolean isNull() {
    return false;
  }

  ///////////////////////////////////////////////////////////////
  // main query

  public boolean accepts(List<Type> types) {
    // the number of parameters should be the same
    if (types.size() != paramTypes.length) {
      return false;
    }

    // initialize
    for (Type paramType : paramTypes) {
      paramType.resetTypeVariable();
    }

    for (int i = 0; i < paramTypes.length; i++) {
      if (!assignableTo(paramTypes[i], types.get(i))) {
        return false;
      }
    }
    return true;
  }

  private boolean assignableTo(Type variableType, Type valueType) {
    if (valueType == PrimitiveType.ERROR) {
      return false;
    } else if (variableType instanceof ArrayType && valueType instanceof ArrayType) {
      return ((ArrayType) variableType).match((ArrayType) valueType);
    } else {
      return variableType.match(valueType);
    }
  }

  // Null object pattern
  private static FunctionSignature neverMatchedSignature =
      new FunctionSignature(1, false, PrimitiveType.ERROR) {
        public boolean accepts(List<Type> types) {
          return false;
        }

        public boolean isNull() {
          return true;
        }
      };

  public static FunctionSignature nullInstance() {
    return neverMatchedSignature;
  }

}
