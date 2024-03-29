package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import logging.PikaLogger;
import symbolTable.Binding;
import symbolTable.Scope;
import tokens.IdentifierToken;
import tokens.Token;

public class IdentifierNode extends ParseNode {
  private Binding binding;
  private Scope declarationScope;
  private String lambdaName = null;

  public IdentifierNode(Token token) {
    super(token);
    assert (token instanceof IdentifierToken);
    this.binding = null;
  }

  public IdentifierNode(ParseNode node) {
    super(node);

    if (node instanceof IdentifierNode) {
      this.binding = ((IdentifierNode) node).binding;
    } else {
      this.binding = null;
    }
  }

  ////////////////////////////////////////////////////////////
  // attributes

  public IdentifierToken identifierToken() {
    return (IdentifierToken) token;
  }

  public void setBinding(Binding binding) {
    this.binding = binding;
  }

  public Binding getBinding() {
    return binding;
  }

  public void setLambdaName(String _lambdaName) {
    lambdaName = _lambdaName;
  }

  public String getLambdaName() {
    return lambdaName;
  }


  ////////////////////////////////////////////////////////////
  // Speciality functions

  // From current node to root, find nearst scope in which
  // variable is declared and return the binding
  public Binding findVariableBinding() {
    String identifier = token.getLexeme();
    boolean outsideOfLambda = false;
    
    for (ParseNode current : pathToRoot()) {
      // If outside of lambda, only look for global or static variable
      if (current.containsBindingOf(identifier, outsideOfLambda)) {
        declarationScope = current.getScope();
        return current.bindingOf(identifier);
      }
      if (current instanceof LambdaNode) {
        outsideOfLambda = true;
      }
    }
    useBeforeDefineError();
    return Binding.nullInstance();
  }

  public Scope getDeclarationScope() {
    findVariableBinding();
    return declarationScope;
  }

  public void useBeforeDefineError() {
    PikaLogger log = PikaLogger.getLogger("compiler.semanticAnalyzer.identifierNode");
    Token token = getToken();
    log.severe(
        "identifier " + token.getLexeme() + " used before defined at " + token.getLocation());
  }

  ///////////////////////////////////////////////////////////
  // accept a visitor

  public void accept(ParseNodeVisitor visitor) {
    visitor.visit(this);
  }
}
