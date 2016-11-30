package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import asmCodeGenerator.Labeller;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class ForStatementNode extends ParseNode {
  private String labelForContinue = null;
  private String labelForBreak = null;
  private Labeller labeller = null;

  public ForStatementNode(Token token) {
    super(token);
    assert (token.isLextant(Keyword.INDEX, Keyword.ELEM));
  }

  public ForStatementNode(ParseNode node) {
    super(node);
  }

  ////////////////////////////////////////////////////////////
  // attributes
  public void setLabeller(Labeller labeller) {
    this.labeller = labeller;
  }
  
  public Labeller getLabeller() {
    return this.labeller;
  }
  
  public Lextant getOperator() {
    return lextantToken().getLextant();
  }

  public LextantToken lextantToken() {
    return (LextantToken) token;
  }

  public void setLabelForContinue(String label) {
    labelForContinue = label;
  }

  public void setLabelForBreak(String label) {
    labelForBreak = label;
  }

  public String getLabelForContinue() {
    return labelForContinue;
  }

  public String getLabelForBreak() {
    return labelForBreak;
  }

  public static ForStatementNode withChildren(Token token, ParseNode identifier,
      ParseNode expression, ParseNode blockStatement) {
    ForStatementNode node = new ForStatementNode(token);
    node.appendChild(identifier);
    node.appendChild(expression);
    node.appendChild(blockStatement);
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
