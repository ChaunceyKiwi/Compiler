package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class LambdaNode extends ParseNode {

	public LambdaNode(Token token) {
		super(token);
	}

	public LambdaNode(ParseNode node) {
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
	
	public static LambdaNode withChildren(Token token, ParseNode lambdaParamType, ParseNode blockStatement) {
		LambdaNode node = new LambdaNode(token);
		node.appendChild(lambdaParamType);
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
