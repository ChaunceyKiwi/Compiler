package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.codeStorage.ASMOpcode;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.SemanticAnalysisVisitor;


public class FunctionSignatures extends ArrayList<FunctionSignature> {
  private static final long serialVersionUID = -4907792488209670697L;
  private static Map<Object, FunctionSignatures> signaturesForKey =
      new HashMap<Object, FunctionSignatures>();

  Object key;

  public FunctionSignatures(Object key, FunctionSignature... functionSignatures) {
    this.key = key;
    for (FunctionSignature functionSignature : functionSignatures) {
      add(functionSignature);
    }
    signaturesForKey.put(key, this);
  }

  public Object getKey() {
    return key;
  }

  public boolean hasKey(Object key) {
    return this.key.equals(key);
  }

  // To get the signature for a list of types
  // For a signatures try each signature in it
  // If such a signature is find, then stop and return it
  // Otherwise return null
  public FunctionSignature acceptingSignature(List<Type> types) {

    // We first check if the operands match a signature
    for (FunctionSignature functionSignature : this) {
      if (functionSignature.accepts(types)) {
        return functionSignature;
      }
    }

    if (!this.get(0).ifPromotable())
      return FunctionSignature.nullInstance();

    // If not, we check if promoting one argument
    // will allow a signature to match
    int skip = 0;
    if (this.get(0).getVariant() instanceof Integer) {
      skip = (Integer) this.get(0).getVariant();
    }

    for (int i = skip; i < types.size(); i++) {
      List<List<Type>> unaryPromotionLists = PromotionHelper.getUnaryPromotionLists(types, i);
      List<List<Type>> matchingSet = new ArrayList<List<Type>>();
      for (List<Type> item : unaryPromotionLists) {
        for (FunctionSignature functionSignature : this) {
          if (functionSignature.accepts(item)) {
            matchingSet.add(item);
          }
        }
      }

      List<Type> matching = PromotionHelper.getValidMatching(matchingSet);
      if (matching != null) {
        for (FunctionSignature functionSignature : this) {
          if (functionSignature.accepts(matching)) {
            return functionSignature;
          }
        }
      } else if (matching == null && matchingSet.size() > 0) {
        SemanticAnalysisVisitor.logError("Promotion failure due to multiple matchings");
      }
    }

    // If still not, we check if promoting two arguments
    // will allow a signature to match
    if (this.get(0).getVariant() instanceof Integer) {
      skip = (Integer) this.get(0).getVariant();
    }

    for (int i = skip; i < types.size(); i++) {
      for (int j = i + 1; j < types.size(); j++) {
        List<List<Type>> binaryPromotionLists =
            PromotionHelper.getBinaryPromotionLists(types, i, j);
        List<List<Type>> matchingSet = new ArrayList<List<Type>>();
        for (List<Type> item : binaryPromotionLists) {
          for (FunctionSignature functionSignature : this) {
            if (functionSignature.accepts(item)) {
              matchingSet.add(item);
            }
          }
        }

        List<Type> matching = PromotionHelper.getValidMatching(matchingSet);
        if (matching != null) {
          for (FunctionSignature functionSignature : this) {
            if (functionSignature.accepts(matching)) {
              return functionSignature;
            }
          }
        }
      }
    }

    return FunctionSignature.nullInstance();
  }

  // Accept as long as there is one found
  public boolean accepts(List<Type> types) {
    return !acceptingSignature(types).isNull();
  }


  /////////////////////////////////////////////////////////////////////////////////
  // access to FunctionSignatures by key object.

  public static FunctionSignatures nullSignatures =
      new FunctionSignatures(0, FunctionSignature.nullInstance());

  public static FunctionSignatures signaturesOf(Object key) {
    if (signaturesForKey.containsKey(key)) {
      return signaturesForKey.get(key);
    }
    return nullSignatures;
  }

  public static FunctionSignature signature(Object key, List<Type> types) {
    FunctionSignatures signatures = FunctionSignatures.signaturesOf(key);
    return signatures.acceptingSignature(types);
  }


  /////////////////////////////////////////////////////////////////////////////////
  // Put the signatures for operators in the following static block.

  static {
    TypeVariable typeVariable = new TypeVariable();

    /////////////////////////////////////////////////////////////////////////////////
    // Arithmetic Operator (all promotable)
    new FunctionSignatures(Punctuator.ADD,
        new FunctionSignature(ASMOpcode.Add, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.INTEGER),
        new FunctionSignature(ASMOpcode.FAdd, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.FLOATING),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_ADD, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL));

    new FunctionSignatures(Punctuator.SUBTRACT,
        new FunctionSignature(ASMOpcode.Subtract, true, PrimitiveType.INTEGER,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER),
        new FunctionSignature(ASMOpcode.FSubtract, true, PrimitiveType.FLOATING,
            PrimitiveType.FLOATING, PrimitiveType.FLOATING),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_SUBSTRCT, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL));

    new FunctionSignatures(Punctuator.MULTIPLY,
        new FunctionSignature(ASMOpcode.Multiply, true, PrimitiveType.INTEGER,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER),
        new FunctionSignature(ASMOpcode.FMultiply, true, PrimitiveType.FLOATING,
            PrimitiveType.FLOATING, PrimitiveType.FLOATING),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_MULTIPLY, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL));

    new FunctionSignatures(Punctuator.DIVIDE,
        new FunctionSignature(ASMOpcode.Divide, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.INTEGER),
        new FunctionSignature(ASMOpcode.FDivide, true, PrimitiveType.FLOATING,
            PrimitiveType.FLOATING, PrimitiveType.FLOATING),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_DIVIDE, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL));

    /////////////////////////////////////////////////////////////////////////////////
    // Rational Number Operator(all promotable)

    new FunctionSignatures(Punctuator.OVER, new FunctionSignature(Punctuator.OVER, true,
        PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.RATIONAL));

    new FunctionSignatures(Punctuator.EXPRESSOVER,
        new FunctionSignature(Punctuator.EXPRESSOVER, true, PrimitiveType.RATIONAL,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER),
        new FunctionSignature(Punctuator.EXPRESSOVER, true, PrimitiveType.FLOATING,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER));

    new FunctionSignatures(Punctuator.RATIONALIZE,
        new FunctionSignature(Punctuator.RATIONALIZE, true, PrimitiveType.RATIONAL,
            PrimitiveType.INTEGER, PrimitiveType.RATIONAL),
        new FunctionSignature(Punctuator.RATIONALIZE, true, PrimitiveType.FLOATING,
            PrimitiveType.INTEGER, PrimitiveType.RATIONAL));

    /////////////////////////////////////////////////////////////////////////////////
    // Comparison Operator (promotable)

    new FunctionSignatures(Punctuator.LESSER,
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_LESSER, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.BOOLEAN));

    new FunctionSignatures(Punctuator.LESSEROREQUAL,
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_LESSEROREQUAL, true,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL, PrimitiveType.BOOLEAN));

    new FunctionSignatures(Punctuator.EQUAL,
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_EQUAL, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.BOOLEAN));

    new FunctionSignatures(BinaryOperatorNode.ARRAY_COMPARISON, new FunctionSignature(1, false,
        new ArrayType(typeVariable), new ArrayType(typeVariable), PrimitiveType.BOOLEAN));

    new FunctionSignatures(Punctuator.NOTEQUAL,
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_NOTEQUAL, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.BOOLEAN));

    new FunctionSignatures(Punctuator.GREATER,
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_GREATER, true, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL, PrimitiveType.BOOLEAN));

    new FunctionSignatures(Punctuator.GREATEROREQUAL,
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(BinaryOperatorNode.RATIONAL_GREATEROREQUAL, true,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL, PrimitiveType.BOOLEAN));

    /////////////////////////////////////////////////////////////////////////////////
    // Boolean Operator (all promotable)

    new FunctionSignatures(Punctuator.AND, new FunctionSignature(1, true, PrimitiveType.BOOLEAN,
        PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN));

    new FunctionSignatures(Punctuator.OR, new FunctionSignature(1, true, PrimitiveType.BOOLEAN,
        PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN));

    new FunctionSignatures(UnaryOperatorNode.BOOLEAN_NOT, new FunctionSignature(
        UnaryOperatorNode.BOOLEAN_NOT, true, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN));

    /////////////////////////////////////////////////////////////////////////////////
    // Other Operator
    // Following castings are allowed
    // selfType -> selfType
    // Char -> Int , Int -> Char
    // Int -> Float , Float -> Int
    // Int -> Bool, Char -> Bool
    // Rat -> Int, Rat-> Float,
    // Char -> Rat, Int -> Rat, Float -> Rat


    new FunctionSignatures(TypeCastingNode.TYPE_CASTING,
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.CHARACTER,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.INTEGER,
            PrimitiveType.CHARACTER, PrimitiveType.CHARACTER),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.INTEGER,
            PrimitiveType.FLOATING, PrimitiveType.FLOATING),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.FLOATING,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.INTEGER,
            PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.CHARACTER,
            PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.RATIONAL,
            PrimitiveType.INTEGER, PrimitiveType.INTEGER),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.RATIONAL,
            PrimitiveType.FLOATING, PrimitiveType.FLOATING),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.CHARACTER,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.INTEGER,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, PrimitiveType.FLOATING,
            PrimitiveType.RATIONAL, PrimitiveType.RATIONAL),
        new FunctionSignature(TypeCastingNode.TYPE_CASTING, false, typeVariable, typeVariable,
            typeVariable));

    new FunctionSignatures(NewArrayTypeLengthNode.EMPTY_ARRAY_CREATION,
        new FunctionSignature(NewArrayTypeLengthNode.EMPTY_ARRAY_CREATION, false,
            new ArrayType(typeVariable), PrimitiveType.INTEGER, new ArrayType(typeVariable)));

    new FunctionSignatures(UnaryOperatorNode.ARRAY_CLONE,
        new FunctionSignature(UnaryOperatorNode.ARRAY_CLONE, false, new ArrayType(typeVariable),
            new ArrayType(typeVariable)));

    new FunctionSignatures(ArrayIndexingNode.ARRAY_INDEXING,
        new FunctionSignature(ArrayIndexingNode.ARRAY_INDEXING, false, new ArrayType(typeVariable),
            PrimitiveType.INTEGER, typeVariable));

    new FunctionSignatures(AssignmentStatementNode.VALUE_ASSIGNMENT,
        new FunctionSignature(1, true, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN,
            PrimitiveType.BOOLEAN),
        new FunctionSignature(1, true, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER,
            PrimitiveType.CHARACTER),
        new FunctionSignature(1, true, PrimitiveType.STRING, PrimitiveType.STRING,
            PrimitiveType.STRING),
        new FunctionSignature(1, true, PrimitiveType.INTEGER, PrimitiveType.INTEGER,
            PrimitiveType.INTEGER),
        new FunctionSignature(1, true, PrimitiveType.FLOATING, PrimitiveType.FLOATING,
            PrimitiveType.FLOATING),
        new FunctionSignature(1, true, PrimitiveType.RATIONAL, PrimitiveType.RATIONAL,
            PrimitiveType.RATIONAL),
        new FunctionSignature(1, true, new ArrayType(typeVariable), new ArrayType(typeVariable),
            new ArrayType(typeVariable)));

    new FunctionSignatures(UnaryOperatorNode.ARRAY_LENGTH, new FunctionSignature(
        UnaryOperatorNode.ARRAY_LENGTH, false, typeVariable, PrimitiveType.INTEGER));
  }
}
