package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import semanticAnalyzer.types.*;
import parseTree.nodeTypes.LambdaNode;

public class FunctionDefinitionNode extends ParseNode {
	private LambdaType lambdaType = null;
	
	public FunctionDefinitionNode(Token token) {
		super(token);
	}

	public FunctionDefinitionNode(ParseNode node) {
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
	
	public static FunctionDefinitionNode withChildren(Token token, ParseNode identifier, ParseNode lambda) {
		FunctionDefinitionNode node = new FunctionDefinitionNode(token);
		node.appendChild(identifier);
		node.appendChild(lambda);
		return node;
	}
	
	public void setLambdaType() {
		LambdaNode lambdaNode = (LambdaNode)child(1);
		lambdaNode.setLambdaType();
		lambdaType = lambdaNode.getLambdaType();
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
