package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import java.util.ArrayList;
import java.util.List;
import semanticAnalyzer.types.*;

public class ParameterListNode extends ParseNode {
	List<Type> typeList = new ArrayList<Type>();
	
	public ParameterListNode(Token token) {
		super(token);
	}

	public ParameterListNode(ParseNode node) {
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
	
	public void appendToTypeList(Type type) {
		typeList.add(type);
	}
	
	public List<Type> getTypeList() {
		return typeList;
	}
	
	///////////////////////////////////////////////////////////
	// boilerplate for visitors
			
	public void accept(ParseNodeVisitor visitor) {
		visitor.visitEnter(this);
		visitChildren(visitor);
		visitor.visitLeave(this);
	}
}
