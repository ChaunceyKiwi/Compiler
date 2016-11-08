package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class WhileStatementNode extends ParseNode {
	private String labelForContinue = null;
	private String labelForBreak = null;

	public WhileStatementNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
	}

	public WhileStatementNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	public Lextant getOperator() {
		return lextantToken().getLextant();
	}
	public LextantToken lextantToken() {
		return (LextantToken)token;
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
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
