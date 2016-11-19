package parseTree.nodeTypes;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import lexicalAnalyzer.Lextant;
import tokens.LextantToken;
import tokens.Token;
import java.util.ArrayList;
import java.util.List;
import semanticAnalyzer.types.*;

public class TypeListNode extends ParseNode {
    List<Type> typeList = new ArrayList<Type>();
    boolean isTypeListSet = false;
    
    public TypeListNode(Token token) {
        super(token);
    }

    public TypeListNode(ParseNode node) {
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
    
//    public void setTypeList() {
//        if(!isTypeListSet) {
//            for(int i = 0; i < this.nChildren(); i++) {
//                if(this.child(i).child(0) instanceof TypeNode) {
//                    ((TypeNode)this.child(i).child(0)).setType();
//                }
//                typeList.add(this.child(i).child(0).getType());
//            }
//            isTypeListSet = true;
//        }
//    }
//    
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
