package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class UnaryOperatorNode extends ParseNode {
  public final static String ARRAY_LENGTH = "array_length";
  public final static String BOOLEAN_NOT = "boolean_not";
  public final static String ARRAY_CLONE = "array_clone";

  public UnaryOperatorNode(Token token) {
    super(token);
    assert (token instanceof LextantToken);
  }

  public UnaryOperatorNode(ParseNode node) {
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


  ////////////////////////////////////////////////////////////
  // convenience factory

  public static UnaryOperatorNode withChildren(Token token, ParseNode right) {
    UnaryOperatorNode node = new UnaryOperatorNode(token);
    node.appendChild(right);
    return node;
  }

  public static UnaryOperatorNode withChildren(Token token, ParseNode expr1, ParseNode expr2,
      ParseNode expr3) {
    UnaryOperatorNode node = new UnaryOperatorNode(token);
    node.appendChild(expr1);
    node.appendChild(expr2);
    node.appendChild(expr3);
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
