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
		return ((BlockStatementNode)this.getParent()).getTargetLabel();
	}
	
	public static ParseNode findFunctionDefinitionNode(ParseNode node) {
		// Track up the node to find the functionDefinitionNode
		for(ParseNode current : node.pathToRoot()) {
			if(current instanceof FunctionDefinitionNode) {
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
