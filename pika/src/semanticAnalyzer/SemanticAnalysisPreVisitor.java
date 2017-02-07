package semanticAnalyzer;

import parseTree.ParseNode;
import parseTree.ParseNodeVisitor;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.Type;
import symbolTable.Scope;
import symbolTable.Binding;


public class SemanticAnalysisPreVisitor extends ParseNodeVisitor.Default {
  ///////////////////////////////////////////////////////////////////////////
  // constructs larger than statements
  @Override
  public void visitEnter(ProgramNode node) {
    createProgramScope(node);
  }

  @Override
  public void visitLeave(ProgramNode node) {
    for (int i = node.nChildren() - 1; i > 0 ; i--) {
      for (int j = 0; j < i; j++) {
        ParseNode child1 = node.child(j);
        ParseNode child2 = node.child(j + 1);
        if(child1 instanceof GlobalDefinitionNode && child2 instanceof GlobalDefinitionNode) {
          ParseNode childchild1 = child1.child(0);
          ParseNode childchild2 = child2.child(0);
          if(childchild1 instanceof FunctionDefinitionNode && childchild2 instanceof DeclarationNode) {
            ParseNode temp = child1;
            node.getChildren().set(j, child2);
            node.getChildren().set(j + 1, temp);
          }
        }
      }
    }
  }

  @Override
  public void visitEnter(BlockStatementNode node) {
    if (node.getParent() instanceof LambdaNode) {
      // if it is a function body
      createProcedureScope(node);
    } else {
      createSubscope(node);
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // Function related
  @Override
  public void visitEnter(FunctionDefinitionNode node) {
    node.setLambdaType();
    IdentifierNode identifierNode = (IdentifierNode)node.child(0);
    addBinding(identifierNode, node.getLambdaType(), false, true);
  }

  public void visitEnter(LambdaNode node) {
    createParameterScope(node);
    node.setLambdaType();
    node.setType(node.getLambdaType());
  }

//  private void setBinding(FunctionDefinitionNode node) {
//    Scope scope = node.getRootScope();
//    IdentifierNode identifierNode = (IdentifierNode) node.child(0);
//    scope.getSymbolTable().errorIfAlreadyDefined(identifierNode.getToken());
//    Binding binding = scope.createBinding(identifierNode, node.getLambdaType(), false, true);
//    identifierNode.setBinding(binding);
//  }
  
  private void addBinding(IdentifierNode identifierNode, Type type, boolean isMutable,
      boolean isStatic) {
    if (isStatic) {
      Scope localScope = identifierNode.getLocalScope();
      Scope globalScope = identifierNode.getRootScope();
      Binding binding = globalScope.createBinding(identifierNode, type, isMutable, isStatic);
      localScope.getSymbolTable().install(identifierNode.getToken().getLexeme(), binding);
      identifierNode.setBinding(binding);
    } else {
      Scope scope = identifierNode.getLocalScope();
      Binding binding = scope.createBinding(identifierNode, type, isMutable, isStatic);
      identifierNode.setBinding(binding);
    }
  }

  ///////////////////////////////////////////////////////////////////////////
  // helper methods for scoping.
  private void createProgramScope(ParseNode node) {
    Scope scope = Scope.createProgramScope();
    node.setScope(scope);
  }

  private void createParameterScope(ParseNode node) {
    Scope baseScope = node.getLocalScope();
    Scope scope = baseScope.createParameterScope();
    node.setScope(scope);
  }

  private void createProcedureScope(ParseNode node) {
    Scope baseScope = node.getLocalScope();
    Scope scope = baseScope.createProcedureScope();
    node.setScope(scope);
  }

  private void createSubscope(ParseNode node) {
    Scope baseScope = node.getLocalScope();
    Scope scope = baseScope.createSubscope();
    node.setScope(scope);
  }
}
