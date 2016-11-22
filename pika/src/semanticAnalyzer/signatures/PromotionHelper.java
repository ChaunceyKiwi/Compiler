package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.List;

import semanticAnalyzer.types.*;

public class PromotionHelper {
  public static List<List<Type>> getUnaryPromotionLists(List<Type> originalSignature,
      int indexOfArgument) {
    List<List<Type>> unaryPromotionLists = new ArrayList<List<Type>>();
    Type type = originalSignature.get(indexOfArgument);

    List<Type> successorTypes = new ArrayList<Type>();
    if (type instanceof PrimitiveType)
      successorTypes = getSuccessorTypes((PrimitiveType) type);

    for (Type items : successorTypes) {
      List<Type> unaryPromotionList = new ArrayList<Type>(originalSignature);
      unaryPromotionList.set(indexOfArgument, items);
      unaryPromotionLists.add(unaryPromotionList);
    }

    return unaryPromotionLists;
  }

  public static List<List<Type>> getBinaryPromotionLists(List<Type> originalSignature, int i,
      int j) {
    List<List<Type>> binaryPromotionLists = new ArrayList<List<Type>>();
    Type type1 = originalSignature.get(i);
    Type type2 = originalSignature.get(j);

    List<Type> successorTypes1 = getSuccessorTypes((PrimitiveType) type1);
    List<Type> successorTypes2 = getSuccessorTypes((PrimitiveType) type2);

    for (Type items1 : successorTypes1) {
      for (Type items2 : successorTypes2) {
        List<Type> binaryPromotionList = new ArrayList<Type>(originalSignature);
        binaryPromotionList.set(i, items1);
        binaryPromotionList.set(j, items2);
        binaryPromotionLists.add(binaryPromotionList);
      }
    }

    return binaryPromotionLists;
  }

  public static List<Type> getSuccessorTypes(PrimitiveType type) {
    List<Type> successorTypes = new ArrayList<Type>();

    if (type == PrimitiveType.CHARACTER) {
      successorTypes.add(PrimitiveType.INTEGER);
      successorTypes.add(PrimitiveType.RATIONAL);
      successorTypes.add(PrimitiveType.FLOATING);
    } else if (type == PrimitiveType.INTEGER) {
      successorTypes.add(PrimitiveType.RATIONAL);
      successorTypes.add(PrimitiveType.FLOATING);
    }

    return successorTypes;
  }

  public static boolean typeAIsPredecessorTypeOrSame(Type a, Type b) {
    if (a == PrimitiveType.CHARACTER) {
      return true;
    } else if (a == PrimitiveType.INTEGER) {
      return b == PrimitiveType.INTEGER || b == PrimitiveType.RATIONAL
          || b == PrimitiveType.FLOATING;
    } else if (a == PrimitiveType.RATIONAL) {
      return b == PrimitiveType.RATIONAL;
    } else if (a == PrimitiveType.FLOATING) {
      return b == PrimitiveType.FLOATING;
    } else {
      return a.match(b);
    }
  }

  public static boolean listAIsPredecessorListOrSame(List<Type> a, List<Type> b) {
    for (int i = 0; i < a.size(); i++) {
      if (!typeAIsPredecessorTypeOrSame(a.get(i), b.get(i)))
        return false;
    }
    return true;
  }

  public static List<Type> getValidMatching(List<List<Type>> matchingSet) {
    for (List<Type> items1 : matchingSet) {
      int count = 0;
      for (List<Type> items2 : matchingSet) {
        if (!listAIsPredecessorListOrSame(items1, items2))
          break;
        else
          count++;
      }
      if (count == matchingSet.size())
        return items1;
    }

    return null;
  }
}
