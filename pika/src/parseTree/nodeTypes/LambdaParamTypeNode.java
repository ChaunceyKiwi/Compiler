package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.ParameterListNode;
import semanticAnalyzer.types.LambdaType;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class LambdaParamTypeNode extends ParseNode {
	private LambdaType lambdaType = null;

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
		node.lambdaType.setTypeList(((ParameterListNode)parameterList).getTypeList());
		node.appendChild(type);
		node.lambdaType.setResultType(type.getType());
		return node;
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
