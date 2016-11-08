package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import parseTree.nodeTypes.WhileStatementNode;

public class ContinueStatementNode extends ParseNode {
	
	private WhileStatementNode loopStatementNode = null; 
	
	public ContinueStatementNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
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
		return (LextantToken)token;
	}	
	
	public void setLoopStatementNode(WhileStatementNode node) {
		loopStatementNode = node;
	}
	
	public WhileStatementNode getLoopStatementNode() {
		return loopStatementNode;
	}
	
	public String getTargetLabelForContinue(){
		return loopStatementNode.getLabelForContinue();
	}
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
