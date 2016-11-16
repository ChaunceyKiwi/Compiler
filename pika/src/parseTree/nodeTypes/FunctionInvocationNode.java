package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class FunctionInvocationNode extends ParseNode {	
	String beginLabel = null;
	String endLabel = null;
	String callLabel = null;
	
	public FunctionInvocationNode(Token token) {
		super(token);
	}

	public FunctionInvocationNode(ParseNode node) {
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
	
	public void setBeginLabel(String label) {
		beginLabel = label;
	}
	
	public String getBeginLabel() {
		return beginLabel;
	}
	
	public void setEndLabel(String label) {
		endLabel = label;
	}
	
	public String getEndLabel() {
		return endLabel;
	}
	
	public void setCallLabel(String label) {
		callLabel = label;
	}
	
	public String getCallLabel() {
		return callLabel;
	}
	
	public static FunctionInvocationNode withChildren(Token token, ParseNode expression, ParseNode expressionList ) {
		FunctionInvocationNode node = new FunctionInvocationNode(token);
		node.appendChild(expression);
		node.appendChild(expressionList);
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
