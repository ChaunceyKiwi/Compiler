package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import tokens.LextantToken;
import tokens.Token;
import semanticAnalyzer.types.*;

public class TypeNode extends ParseNode {
	
	public TypeNode(Token token) {
		super(token);
		assert(token instanceof LextantToken);
	}

	public TypeNode(ParseNode node) {
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
	
	public static TypeNode withChildren(Token token, ParseNode right) {
		TypeNode node = new TypeNode(token);
		node.appendChild(right);
		return node;
	}
	
	public void setType() {
		if(this.getToken().isLextant(Punctuator.OPEN_SQUARE_BRACKET)) {
			((TypeNode)this.child(0)).setType();
			type = new ArrayType(this.child(0).getType());
		}else if(this.getToken().isLextant(Keyword.BOOLEAN)) {
			type = PrimitiveType.BOOLEAN;
		}else if(this.getToken().isLextant(Keyword.CHARACTER)) {
			type = PrimitiveType.CHARACTER;
		}else if(this.getToken().isLextant(Keyword.STRING)) {
			type = PrimitiveType.STRING;
		}else if(this.getToken().isLextant(Keyword.INTEGER)) {
			type = PrimitiveType.INTEGER;
		}else if(this.getToken().isLextant(Keyword.FLOATING)) {
			type = PrimitiveType.FLOATING;
		}else if(this.getToken().isLextant(Keyword.VOID)) {
		    type = PrimitiveType.VOID;
		}
		
	}
	
	public Type getType() {
		return type;
	}
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
