package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class BreakStatementNode extends ParseNode {

	private WhileStatementNode loopStatementNode = null; 

	public BreakStatementNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
	}

	public BreakStatementNode(ParseNode node) {
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
	
	public void setLoopStatementNode(WhileStatementNode node) {
		loopStatementNode = node;
	}
	
	public String getTargetLabelForBreak(){
		return loopStatementNode.getLabelForBreak();
	}
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
