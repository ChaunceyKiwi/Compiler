package parseTree.nodeTypes;

import semanticAnalyzer.types.*;
import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class ParameterSpecificationNode extends ParseNode {
	Type type;
	ParseNode typeNode;
	
	public ParameterSpecificationNode(Token token) {
		super(token);
	}

	public ParameterSpecificationNode(ParseNode node) {
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
	
	public static ParameterSpecificationNode withChildren(Token token, ParseNode type, ParseNode identifier) {
		ParameterSpecificationNode node = new ParameterSpecificationNode(token);
		node.typeNode = type;
		node.appendChild(type);
		node.appendChild(identifier);
		return node;
	}
	
	public void setType() {		
		if(typeNode instanceof BooleanConstantNode) {
			type = PrimitiveType.BOOLEAN;
		}else if(typeNode instanceof CharConstantNode) {
			type = PrimitiveType.CHARACTER;
		}else if(typeNode instanceof StringConstantNode) {
			type = PrimitiveType.STRING;
		}else if(typeNode instanceof IntegerConstantNode) {
			type = PrimitiveType.INTEGER;
		}else if(typeNode instanceof FloatingConstantNode) {
			type = PrimitiveType.FLOATING;
		}else if(typeNode instanceof TypeNode) {
			type = ((TypeNode)typeNode).getType();
		}
		
		// To-Do add ratinoal and something else here
	}
	
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
