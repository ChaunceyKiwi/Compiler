package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class GlobalDefinitionNode extends ParseNode {

  public GlobalDefinitionNode(Token token) {
    super(token);
  }

  public GlobalDefinitionNode(ParseNode node) {
    super(node);
  }

  ////////////////////////////////////////////////////////////
  // attributes

  public Lextant getOperator() {
    return lextantToken().getLextant();
  }

  public LextantToken lextantToken() {
    return (LextantToken) token;
  }

  public static GlobalDefinitionNode withChildren(Token token, ParseNode child) {
    GlobalDefinitionNode node = new GlobalDefinitionNode(token);
    node.appendChild(child);
    return node;
  }

  ///////////////////////////////////////////////////////////
  // boilerplate for visitors

  public void accept(ParseNodeVisitor visitor) {
    visitor.visitEnter(this);
    visitChildren(visitor);
    visitor.visitLeave(this);
  }
}
