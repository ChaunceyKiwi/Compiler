package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import parseTree.nodeTypes.WhileStatementNode;

public class ContinueStatementNode extends ParseNode {

  private ParseNode loopStatementNode = null;

  public ContinueStatementNode(Token token) {
    super(token);
    assert (token instanceof LextantToken);
  }

  public ContinueStatementNode(ParseNode node) {
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

  public void setLoopStatementNode(ParseNode node) {
    loopStatementNode = node;
  }

  public ParseNode getLoopStatementNode() {
    return loopStatementNode;
  }

  public String getTargetLabelForContinue() {
    if (loopStatementNode instanceof WhileStatementNode) {
      return ((WhileStatementNode) loopStatementNode).getLabelForContinue();
    } else if (loopStatementNode instanceof ForStatementNode) {
      return ((ForStatementNode) loopStatementNode).getLabelForContinue();
    } else {
      return null;
    }
  }

  public static ParseNode findLoopStatementNode(ParseNode node) {
    // Track up the node to find the loop statement
    for (ParseNode current : node.pathToRoot()) {
      if (current instanceof WhileStatementNode || current instanceof ForStatementNode) {
        return current;
      }
    }

    return null;
  }
  ///////////////////////////////////////////////////////////
  // boilerplate for visitors

  public void accept(ParseNodeVisitor visitor) {
    visitor.visitEnter(this);
    visitChildren(visitor);
    visitor.visitLeave(this);
  }
}
