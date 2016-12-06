package symbolTable;

import inputHandler.TextLocation;
import logging.PikaLogger;
import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.LambdaNode;
import parseTree.nodeTypes.FunctionDefinitionNode;
import semanticAnalyzer.Sequencer;
import semanticAnalyzer.types.Type;
import tokens.Token;

public class Scope {
  private Scope baseScope;
  private MemoryAllocator allocator;
  private SymbolTable symbolTable;

  //////////////////////////////////////////////////////////////////////
  // factories
  public static Scope createProgramScope() {
    return new Scope(programScopeAllocator(), nullInstance());
  }

  public Scope createParameterScope() {
    return new Scope(parameterScopeAllocator(), this);
  }

  public Scope createProcedureScope() {
    MemoryAllocator allocator = procedureScopeAllocator();
    // For procedure scopes, the runtime system will
    // need 8 bytes of memory to store FP and SP
    allocator.allocate(8);
    return new Scope(allocator, this);
  }

  public Scope createSubscope() {
    return new Scope(allocator, this);
  }

  private static MemoryAllocator programScopeAllocator() {
    return new PositiveMemoryAllocator(MemoryAccessMethod.DIRECT_ACCESS_BASE,
        MemoryLocation.GLOBAL_VARIABLE_BLOCK);
  }

  private static MemoryAllocator parameterScopeAllocator() {
    return new ParameterMemoryAllocator(MemoryAccessMethod.INDIRECT_ACCESS_BASE,
        MemoryLocation.FRAME_POINTER);
  }

  private static MemoryAllocator procedureScopeAllocator() {
    return new NegativeMemoryAllocator(MemoryAccessMethod.INDIRECT_ACCESS_BASE,
        MemoryLocation.FRAME_POINTER);
  }

  //////////////////////////////////////////////////////////////////////
  // private constructor.
  private Scope(MemoryAllocator allocator, Scope baseScope) {
    super();
    this.baseScope = (baseScope == null) ? this : baseScope;
    this.symbolTable = new SymbolTable();
    this.allocator = allocator;
  }

  ///////////////////////////////////////////////////////////////////////
  // basic queries
  public Scope getBaseScope() {
    return baseScope;
  }

  public MemoryAllocator getAllocationStrategy() {
    return allocator;
  }

  public SymbolTable getSymbolTable() {
    return symbolTable;
  }

  ///////////////////////////////////////////////////////////////////////
  // memory allocation
  public void enter() {
    allocator.saveState();
  }

  // must call leave() when destroying/leaving a scope.
  public void leave() {
    allocator.restoreState();
  }

  public int getAllocatedSize() {
    return allocator.getMaxAllocatedSize();
  }

  ///////////////////////////////////////////////////////////////////////
  // bindings
  public Binding createBinding(IdentifierNode identifierNode, Type type, boolean ismutable, boolean isStatic) {
    Token token = identifierNode.getToken();
    String lexeme = token.getLexeme();
    Binding binding;
        
    if(isStatic) {
      Sequencer sequencer = new Sequencer(lexeme);
      String lexemeWithSequence = sequencer.getLabel();
      symbolTable.errorIfAlreadyDefined(lexemeWithSequence, token);
      binding = allocateNewBinding(type, token.getLocation(), lexemeWithSequence, ismutable, isStatic);
      symbolTable.install(lexemeWithSequence, binding);
    } else {
      symbolTable.errorIfAlreadyDefined(token);
      binding = allocateNewBinding(type, token.getLocation(), lexeme, ismutable, isStatic);
      symbolTable.install(lexeme, binding);
    }

    return binding;
  }

  private Binding allocateNewBinding(Type type, TextLocation textLocation, String lexeme,
      boolean ismutable, boolean isStatic) {
    MemoryLocation memoryLocation = allocator.allocate(type.getSize());
    return new Binding(type, textLocation, memoryLocation, lexeme, ismutable, isStatic);
  }

  public Binding createFunctionBinding(FunctionDefinitionNode funcDefNode) {
    Token token = funcDefNode.child(0).getToken();
    String functionName = token.getLexeme();
    Type lambdaType = funcDefNode.getLambdaType();

    Binding binding = new Binding(lambdaType, token.getLocation(), functionName, functionName);
    symbolTable.install(functionName, binding);
    return binding;
  }

  public Binding createFunctionBinding(IdentifierNode identifierNode, LambdaNode lambdaNode) {
    Token token = identifierNode.getToken();
    String functionName = token.getLexeme();
    Type lambdaType = lambdaNode.getLambdaType();

    Binding binding = new Binding(lambdaType, token.getLocation(), functionName, functionName);
    symbolTable.install(functionName, binding);
    return binding;
  }

  public Binding createFunctionBinding(IdentifierNode identifierNode, Type declarationType,
      String lambdaName) {
    Token token = identifierNode.getToken();
    String functionName = token.getLexeme();

    Binding binding = new Binding(declarationType, token.getLocation(), functionName, lambdaName);
    symbolTable.install(functionName, binding);
    return binding;
  }

  ///////////////////////////////////////////////////////////////////////
  // toString
  public String toString() {
    String result = "scope: ";
    result += " hash " + hashCode() + "\n";
    result += symbolTable;
    return result;
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // Null Scope object - lazy singleton (Lazy Holder) implementation pattern
  public static Scope nullInstance() {
    return NullScope.instance;
  }

  private static class NullScope extends Scope {
    private static NullScope instance = new NullScope();

    private NullScope() {
      super(new PositiveMemoryAllocator(MemoryAccessMethod.NULL_ACCESS, "", 0), null);
    }

    public String toString() {
      return "scope: the-null-scope";
    }

    @Override
    public Binding createBinding(IdentifierNode identifierNode, Type type, boolean ismutable, boolean isStatic) {
      unscopedIdentifierError(identifierNode.getToken());
      return super.createBinding(identifierNode, type, ismutable, isStatic);
    }

    // subscopes of null scope need their own strategy. Assumes global block is static.
    public Scope createSubscope() {
      return new Scope(programScopeAllocator(), this);
    }
  }

  ///////////////////////////////////////////////////////////////////////
  // error reporting
  private static void unscopedIdentifierError(Token token) {
    PikaLogger log = PikaLogger.getLogger("compiler.scope");
    log.severe(
        "variable " + token.getLexeme() + " used outside of any scope at " + token.getLocation());
  }
}
