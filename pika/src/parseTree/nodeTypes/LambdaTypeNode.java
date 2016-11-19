package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import semanticAnalyzer.types.LambdaType;
import semanticAnalyzer.types.Type;
import java.util.List;

import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;

public class LambdaTypeNode extends ParseNode {
    private LambdaType lambdaType = null;

    public LambdaTypeNode(Token token) {
        super(token);
    }

    public LambdaTypeNode(ParseNode node) {
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
    
    public static LambdaTypeNode withChildren(Token token, ParseNode typeList, ParseNode type) {
        LambdaTypeNode node = new LambdaTypeNode(token);
        node.appendChild(typeList);
        node.appendChild(type);
        return node;
    }
    
    public void setLambdaType() {
        ParseNode parameterList = child(0);
        ParseNode type = child(1);
        ((ParameterListNode)parameterList).setTypeList();
        ((TypeNode)type).setType();
        List<Type> _typeList = ((ParameterListNode)parameterList).getTypeList();
        lambdaType = new LambdaType(_typeList, type.getType());
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
