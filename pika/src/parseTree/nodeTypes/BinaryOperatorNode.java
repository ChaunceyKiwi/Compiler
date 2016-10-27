package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class BinaryOperatorNode extends ParseNode {
	public final static String RATIONAL_MULTIPLY = "ration_multiply";
	public final static String RATIONAL_DIVIDE   = "ration_divide";
	public final static String RATIONAL_ADD     = "ration_add";
	public final static String RATIONAL_SUBSTRCT = "ration_substract";
	public final static String ARRAY_EUQAL = "array_equal";
	public final static String ARRAY_NOT_EUQAL = "array_not_equal";


	

	public BinaryOperatorNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
	}

	public BinaryOperatorNode(ParseNode node) {
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
	
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static BinaryOperatorNode withChildren(Token token, ParseNode left, ParseNode right) {
		BinaryOperatorNode node = new BinaryOperatorNode(token);
		node.appendChild(left);
		node.appendChild(right);
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
