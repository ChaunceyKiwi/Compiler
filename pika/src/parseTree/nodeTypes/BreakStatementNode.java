package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class BreakStatementNode extends ParseNode {

	private ParseNode loopStatementNode = null; 

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
	
	public void setLoopStatementNode(ParseNode node) {
		loopStatementNode = node;
	}
	
	public String getTargetLabelForBreak(){
	    if (loopStatementNode instanceof WhileStatementNode) {
	      return ((WhileStatementNode)loopStatementNode).getLabelForBreak();
	    } else if (loopStatementNode instanceof ForStatementNode) {
	      return ((ForStatementNode)loopStatementNode).getLabelForBreak();
	    } else {
	      return null;
	    }
	}
	
	public static ParseNode findLoopStatementNode(ParseNode node) {
		// Track up the node to find the loop statement
		for(ParseNode current : node.pathToRoot()) {
			if(current instanceof WhileStatementNode || current instanceof ForStatementNode) {
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
