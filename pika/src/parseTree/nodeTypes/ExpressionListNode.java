package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class ExpressionListNode extends ParseNode {

	public ExpressionListNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
	}

	public ExpressionListNode(ParseNode node) {
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
	
	
//	////////////////////////////////////////////////////////////
//	// convenience factory
//	
//	public static ExpressionListNode withChildren(Token token, ParseNode left, ParseNode right) {
//		ExpressionListNode node = new ExpressionListNode(token);
//		node.appendChild(left);
//		node.appendChild(right);
//		return node;
//	}
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
