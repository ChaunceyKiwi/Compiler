package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import tokens.IdentifierToken;
import tokens.LextantToken;
import tokens.Token;

public class AssignmentStatementNode extends ParseNode {
	public final static String VALUE_ASSIGNMENT = "value_assignment";

	public AssignmentStatementNode(Token token) {
		super(token);
		assert(token instanceof IdentifierToken);
	}

	public AssignmentStatementNode(ParseNode node) {
		super(node);
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes

	public LextantToken lextantToken() {
		return (LextantToken)token;
	}	
	
	////////////////////////////////////////////////////////////
	// convenience factory
	
	public static AssignmentStatementNode withChildren(Token token, ParseNode target, ParseNode expression) {
		AssignmentStatementNode node = new AssignmentStatementNode(token);
		node.appendChild(target);
		node.appendChild(expression);
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
