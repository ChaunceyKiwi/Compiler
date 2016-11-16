package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class ReturnStatementNode extends ParseNode {	
	private LambdaNode lambdaNode = null; 

	public ReturnStatementNode(Token token) {
		super(token);
	}

	public ReturnStatementNode(ParseNode node) {
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
	
	
	public void setLambdaNode(LambdaNode _lambdaNode) {
		lambdaNode = _lambdaNode;
	}
	
	public ParseNode getLambdaNode() {
		return lambdaNode;
	}
	
	public String getTargetLabelForReturn(){
		return ((BlockStatementNode)lambdaNode.child(1)).getTargetLabel();
	}
	
	public ParseNode findLambdaNode(ParseNode node) {
		// Track up the node to find the lambdaNode
		for(ParseNode current : node.pathToRoot()) {
			if(current instanceof LambdaNode) {
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
