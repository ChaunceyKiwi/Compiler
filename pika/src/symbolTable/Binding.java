package symbolTable;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class Binding {

  private Type type;
  private TextLocation textLocation;
  private MemoryLocation memoryLocation;
  private String lexeme;
  private String lambdaName;
  private boolean isMutable;
  private boolean isStatic;

  // Binding for variable
  public Binding(Type type, TextLocation location, MemoryLocation memoryLocation, String lexeme,
      boolean ismutable, boolean isStatic) {
    super();
    this.type = type;
    this.textLocation = location;
    this.memoryLocation = memoryLocation;
    this.lexeme = lexeme;
    this.isMutable = ismutable;
    this.isStatic = isStatic;
    this.lambdaName = null;
  }
  
  public boolean isStatic() {
    return this.isStatic;
  }

  public String toString() {
    return "[" + lexeme + " " + type + // " " + textLocation +
        " " + memoryLocation + "]";
  }

  public String getLexeme() {
    return lexeme;
  }

  public String getLambdaName() {
    return lambdaName;
  }

  public boolean isMutable() {
    return isMutable;
  }

  public Type getType() {
    return type;
  }

  public void setType(Type type) {
    this.type = type;
  }

  public TextLocation getLocation() {
    return textLocation;
  }

  public MemoryLocation getMemoryLocation() {
    return memoryLocation;
  }

  public void generateAddress(ASMCodeFragment code) {
    memoryLocation.generateAddress(code, "%% " + lexeme);
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // Null Binding object
  ////////////////////////////////////////////////////////////////////////////////////

  public static Binding nullInstance() {
    return NullBinding.getInstance();
  }

  private static class NullBinding extends Binding {
    private static NullBinding instance = null;

    private NullBinding() {
      super(PrimitiveType.ERROR, TextLocation.nullInstance(), MemoryLocation.nullInstance(),
          "the-null-binding", false, false);
    }

    public static NullBinding getInstance() {
      if (instance == null)
        instance = new NullBinding();
      return instance;
    }
  }
}
