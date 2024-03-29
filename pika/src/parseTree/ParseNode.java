package parseTree;

import java.util.ArrayList;
import java.util.List;

import semanticAnalyzer.types.*;
import symbolTable.Binding;
import symbolTable.Scope;
import symbolTable.SymbolTable;
import tokens.Token;
import semanticAnalyzer.signatures.*;

public class ParseNode {
  public static final ParseNode NO_PARENT = null;

  List<ParseNode> children;
  ParseNode parent;
  FunctionSignature signature;

  protected Token token;
  protected Type type; // used for expressions
  protected Type originalType;
  private Scope scope; // the scope created by this node, if any.

  public ParseNode(Token token) {
    this.token = token;
    this.type = PrimitiveType.NO_TYPE;
    this.originalType = PrimitiveType.NO_TYPE;
    this.scope = null;
    this.parent = NO_PARENT;
    this.signature = null;
    initChildren();
  }

  // "detached" copy constructor. Copies all info except tree info (parent and children)
  public ParseNode(ParseNode node) {
    this.token = node.token;
    this.type = node.type;
    this.originalType = node.originalType;
    this.scope = node.scope;
    this.signature = null;
  }

  public Token getToken() {
    return token;
  }


  ////////////////////////////////////////////////////////////////////////////////////
  // attributes

  public void setType(Type type) {
    this.type = type;
  }

  public void setOriginalType() {
    this.originalType = this.type;
  }

  public Type getType() {
    return type;
  }

  public Type getOriginalType() {
    return this.originalType;
  }

  public void setSignature(FunctionSignature signature) {
    this.signature = signature;
  }

  public FunctionSignature getSignature() {
    return this.signature;
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // scopes and bindings
  public Scope getScope() {
    return scope;
  }

  public void setScope(Scope scope) {
    this.scope = scope;
  }

  public boolean hasScope() {
    return scope != null;
  }

  // From current node to root, find the nearest scope
  public Scope getLocalScope() {
    for (ParseNode current : pathToRoot()) {
      if (current.hasScope()) {
        return current.getScope();
      }
    }
    return Scope.nullInstance();
  }

  public Scope getRootScope() {
    Scope scope = getLocalScope();
    while (scope.getBaseScope() != Scope.nullInstance()) {
      scope = scope.getBaseScope();
    }
    return scope;
  }

  // If ths symbol table for current parse node has such an identifier
  public boolean containsBindingOf(String identifier, Boolean outsideOfLambda) {
    if (!hasScope()) {
      return false;
    }
    SymbolTable symbolTable = scope.getSymbolTable();
    return symbolTable.containsKey(identifier, outsideOfLambda);
  }

  // Get the identifier from the sybol table for current parse node
  // Need to make sure such an identifier exists using containsBindingOf()
  public Binding bindingOf(String identifier) {
    if (!hasScope()) {
      return Binding.nullInstance();
    }
    SymbolTable symbolTable = scope.getSymbolTable();
    return symbolTable.lookup(identifier);
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // dealing with children and parent
  //
  // note: there is no provision as of yet for removal of children. Be sure to update
  // the removed child's parent pointer if you do implement it.

  public ParseNode getParent() {
    return parent;
  }

  protected void setParent(ParseNode parent) {
    this.parent = parent;
  }

  public List<ParseNode> getChildren() {
    return children;
  }

  public ParseNode child(int i) {
    return children.get(i);
  }

  public void initChildren() {
    children = new ArrayList<ParseNode>();
  }

  // adds a new child to this node (as first child) and sets its parent link.
  public void insertChild(ParseNode child) {
    children.add(0, child);
    child.setParent(this);
  }

  // adds a new child to this node (as last child) and sets its parent link.
  public void appendChild(ParseNode child) {
    children.add(child);
    child.setParent(this);
  }

  // do not do this in the middle of a visit; the children list traversal may be zapped if you do.
  // (throws a ConcurrentModificationException.)
  public void replaceChild(ParseNode oldChild, ParseNode newChild) {
    for (int index = 0; index < nChildren(); index++) {
      if (child(index) == oldChild) {
        children.remove(index);
        children.add(index, newChild);
        newChild.setParent(this);
        break;
      }
    }
  }

  public int nChildren() {
    return children.size();
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // Iterable<ParseNode> pathToRoot

  public Iterable<ParseNode> pathToRoot() {
    return new PathToRootIterable(this);
  }

  ////////////////////////////////////////////////////////////////////////////////////
  // toString()

  public String toString() {
    return ParseTreePrinter.print(this);
  }


  ////////////////////////////////////////////////////////////////////////////////////
  // for visitors

  public void accept(ParseNodeVisitor visitor) {
    visitor.visitEnter(this);
    visitChildren(visitor);
    visitor.visitLeave(this);
  }

  protected void visitChildren(ParseNodeVisitor visitor) {
    for (ParseNode child : children) {
      child.accept(visitor);
    }
  }

}
