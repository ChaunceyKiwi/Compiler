package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class LambdaParamTypeNode extends ParseNode {

	public LambdaParamTypeNode(Token token) {
		super(token);
	}

	public LambdaParamTypeNode(ParseNode node) {
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
	
	public static LambdaParamTypeNode withChildren(Token token, ParseNode parameterList, ParseNode type) {
		LambdaParamTypeNode node = new LambdaParamTypeNode(token);
		node.appendChild(parameterList);
		node.appendChild(type);
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
