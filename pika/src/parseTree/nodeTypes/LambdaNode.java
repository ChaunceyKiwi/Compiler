package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.LambdaType;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import parseTree.nodeTypes.LambdaParamTypeNode;

public class LambdaNode extends ParseNode {	
	private LambdaType lambdaType = null;

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
		node.lambdaType = ((LambdaParamTypeNode)lambdaParamType).getLambdaType();
		node.appendChild(blockStatement);
		return node;
	}
	
	public void setLambdaType() {
		LambdaParamTypeNode lambdaParamTypeNode = (LambdaParamTypeNode)child(0);
		lambdaType = lambdaParamTypeNode.getLambdaType();
	}
	
	public LambdaType getLambdaType() {
		return lambdaType;
	}
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
