package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import semanticAnalyzer.types.Type;
import semanticAnalyzer.types.PrimitiveType;

public class TypeCastedToNode extends ParseNode {
	private Type typeCastedTo;
	
	public TypeCastedToNode(Token token) {
		super(token);
		this.typeCastedTo = PrimitiveType.NO_TYPE;
		assert(token.isLextant(Keyword.BOOLEAN, Keyword.CHARACTER, Keyword.STRING,
							   Keyword.INTEGER, Keyword.FLOATING));
	}

	public TypeCastedToNode(ParseNode node) {
		super(node);
	}
	
	public void setTypeCastedTo(Type type){
		this.typeCastedTo = type;
	}
	
	public Type getTypeCastedTo(){
		return this.typeCastedTo;
	}
	
	
	////////////////////////////////////////////////////////////
	// attributes
	
	public Lextant getOperator() {
		return lextantToken().getLextant();
	}
	public LextantToken lextantToken() {
		return (LextantToken)token;
	}	
	
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visit(this);
	}
}
