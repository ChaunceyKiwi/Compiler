package asmCodeGenerator;

import java.util.HashMap;
import java.util.Map;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.runtime.RunTime;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.*;
import parseTree.nodeTypes.BinaryOperatorNode;
import parseTree.nodeTypes.UnaryOperatorNode;
import parseTree.nodeTypes.BooleanConstantNode;
import parseTree.nodeTypes.BlockStatementNode;
import parseTree.nodeTypes.DeclarationNode;
import parseTree.nodeTypes.AssignmentStatementNode;
import parseTree.nodeTypes.FloatingConstantNode;
import parseTree.nodeTypes.CharConstantNode;
import parseTree.nodeTypes.StringConstantNode;
import parseTree.nodeTypes.IdentifierNode;
import parseTree.nodeTypes.IntegerConstantNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.TabNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.ProgramNode;
import parseTree.nodeTypes.SpaceNode;
import parseTree.nodeTypes.TypeCastingNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;
import symbolTable.Binding;
import symbolTable.Scope;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import asmCodeGenerator.codeStorage.StringHashTable;;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
	ParseNode root;

	public static ASMCodeFragment generate(ParseNode syntaxTree) {
		ASMCodeGenerator codeGenerator = new ASMCodeGenerator(syntaxTree);
		return codeGenerator.makeASM();
	}
	public ASMCodeGenerator(ParseNode root) {
		super();
		this.root = root;
	}
	
	public ASMCodeFragment makeASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		
		code.append( RunTime.getEnvironment() );
		code.append( globalVariableBlockASM() );
		code.append( programASM() );
//		code.append( MemoryManager.codeForAfterApplication() );
		
		return code;
	}
	private ASMCodeFragment globalVariableBlockASM() {
		assert root.hasScope();
		Scope scope = root.getScope();
		int globalBlockSize = scope.getAllocatedSize();
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		code.add(DLabel, RunTime.GLOBAL_MEMORY_BLOCK);
		code.add(DataZ, globalBlockSize);
		return code;
	}
	private ASMCodeFragment programASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		
		code.add(    Label, RunTime.MAIN_PROGRAM_LABEL);
		code.append( programCode());
		code.add(    Halt );
		
		return code;
	}
	private ASMCodeFragment programCode() {
		CodeVisitor visitor = new CodeVisitor();
		root.accept(visitor);
		return visitor.removeRootCode(root);
	}


	protected class CodeVisitor extends ParseNodeVisitor.Default {
		private Map<ParseNode, ASMCodeFragment> codeMap;
		ASMCodeFragment code;
		
		public CodeVisitor() {
			codeMap = new HashMap<ParseNode, ASMCodeFragment>();
		}


		////////////////////////////////////////////////////////////////////
        // Make the field "code" refer to a new fragment of different sorts.
		private void newAddressCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_ADDRESS);
			codeMap.put(node, code);
		}
		private void newValueCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_VALUE);
			codeMap.put(node, code);
		}
		private void newVoidCode(ParseNode node) {
			code = new ASMCodeFragment(GENERATES_VOID);
			codeMap.put(node, code);
		}

	    ////////////////////////////////////////////////////////////////////
        // Get code from the map.
		private ASMCodeFragment getAndRemoveCode(ParseNode node) {
			ASMCodeFragment result = codeMap.get(node);
			codeMap.remove(result);
			return result;
		}
	    public  ASMCodeFragment removeRootCode(ParseNode tree) {
			return getAndRemoveCode(tree);
		}		
		ASMCodeFragment removeValueCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			makeFragmentValueCode(frag, node);
			return frag;
		}		
		private ASMCodeFragment removeAddressCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			assert frag.isAddress();
			return frag;
		}		
		ASMCodeFragment removeVoidCode(ParseNode node) {
			ASMCodeFragment frag = getAndRemoveCode(node);
			assert frag.isVoid();
			return frag;
		}
		
	    ////////////////////////////////////////////////////////////////////
        // convert code to value-generating code.
		private void makeFragmentValueCode(ASMCodeFragment code, ParseNode node) {
			assert !code.isVoid();
			
			if(code.isAddress()) {
				turnAddressIntoValue(code, node);
			}	
		}
		private void turnAddressIntoValue(ASMCodeFragment code, ParseNode node) {
			if(node.getType() == PrimitiveType.INTEGER) {
				code.add(LoadI);
			}else if(node.getType() == PrimitiveType.BOOLEAN) {
				code.add(LoadC);
			}else if(node.getType() == PrimitiveType.FLOATING){
				code.add(LoadF);
			}else if(node.getType() == PrimitiveType.CHARACTER){
				code.add(LoadC);
			}else if(node.getType() == PrimitiveType.STRING){
				code.add(LoadI);
			}else {
				assert false : "node " + node;
			}
			code.markAsValue();
		}
		
	    ////////////////////////////////////////////////////////////////////
        // ensures all types of ParseNode in given AST have at least a visitLeave	
		public void visitLeave(ParseNode node) {
			assert false : "node " + node + " not handled in ASMCodeGenerator";
		}
		
		
		
		///////////////////////////////////////////////////////////////////////////
		// constructs larger than statements
		public void visitLeave(ProgramNode node) {
			newVoidCode(node);
			for(ParseNode child : node.getChildren()) {
				ASMCodeFragment childCode = removeVoidCode(child);
				code.append(childCode);
			}
		}
		public void visitLeave(BlockStatementNode node) {
			newVoidCode(node);
			for(ParseNode child : node.getChildren()) {
				ASMCodeFragment childCode = removeVoidCode(child);
				code.append(childCode);
			}
		}

		///////////////////////////////////////////////////////////////////////////
		// statements and declarations

		public void visitLeave(PrintStatementNode node) {
			newVoidCode(node);
			new PrintStatementGenerator(code, this).generate(node);	
		}
		public void visit(NewlineNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.NEWLINE_PRINT_FORMAT);
			code.add(Printf);
		}
		public void visit(TabNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.TAB_PRINT_FORMAT);
			code.add(Printf);
		}
		public void visit(SpaceNode node) {
			newVoidCode(node);
			code.add(PushD, RunTime.SPACE_PRINT_FORMAT);
			code.add(Printf);
		}
		
		public void visitLeave(DeclarationNode node) {
			newVoidCode(node);
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));	
			ASMCodeFragment rvalue = removeValueCode(node.child(1));
			
			code.append(lvalue);
			code.append(rvalue);
			
			Type type = node.getType();
			code.add(opcodeForStore(type));
		}
		
		public void visitLeave(AssignmentStatementNode node) {
			newVoidCode(node);
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));	
			ASMCodeFragment rvalue = removeValueCode(node.child(1));
			
			code.append(lvalue);
			code.append(rvalue);
			
			Type type = node.getType();
			code.add(opcodeForStore(type));
		}
		
		public void visitLeave(TypeCastingNode node){
			Type originalType = node.child(0).getType();
			Type targetType = node.child(1).getType();
						
			newValueCode(node);
			ASMCodeFragment value = removeValueCode(node.child(0));
			code.append(value);
			Labeller labeller = new Labeller("casting");
			
			// Followed castings are allowed
			// Char -> Int , Int -> Char
			// Int -> Float , Float -> Int
			// Int -> Bool, Char -> Bool
			// selfType -> selfType
			
			if(originalType == targetType) 
				return;
			else if(originalType == PrimitiveType.FLOATING && targetType == PrimitiveType.INTEGER)
				code.add(ConvertI);
			else if(originalType == PrimitiveType.INTEGER && targetType == PrimitiveType.FLOATING)
				code.add(ConvertF);
			else if(originalType == PrimitiveType.INTEGER && targetType == PrimitiveType.BOOLEAN){
				String trueLabel  = labeller.newLabel("true");
				String joinLabel  = labeller.newLabel("join");
				
				code.add(JumpTrue, trueLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Label, joinLabel);		
			}else if(originalType == PrimitiveType.CHARACTER && targetType == PrimitiveType.BOOLEAN){
				String trueLabel  = labeller.newLabel("true");
				String joinLabel  = labeller.newLabel("join");
				
				code.add(JumpTrue, trueLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Label, joinLabel);		
			}
		}
		
		private ASMOpcode opcodeForStore(Type type) {
			if(type == PrimitiveType.INTEGER) {
				return StoreI;
			}
			if(type == PrimitiveType.BOOLEAN) {
				return StoreC;
			}
			if(type == PrimitiveType.FLOATING){
				return StoreF;
			}
			if(type == PrimitiveType.CHARACTER){
				return StoreC;
			}
			if(type == PrimitiveType.STRING){
				return StoreI;
			}
			assert false: "Type " + type + " unimplemented in opcodeForStore()";
			return null;
		}


		///////////////////////////////////////////////////////////////////////////
		// expressions
		public void visitLeave(BinaryOperatorNode node) {
			Lextant operator = node.getOperator();
			
			// Comparison Operator
			if (operator == Punctuator.LESSER ||operator == Punctuator.LESSEROREQUAL ||
				operator == Punctuator.NOTEQUAL ||operator == Punctuator.EQUAL ||
				operator == Punctuator.GREATER ||	operator == Punctuator.GREATEROREQUAL) {
				visitComparisonOperatorNode(node, operator);
			}
			// Arithmetic Operator
			else {
				visitNormalBinaryOperatorNode(node);
			}
		}
		
		private void visitComparisonOperatorNode(BinaryOperatorNode node,
				Lextant operator) {

			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));
			
			Labeller labeller = new Labeller("compare");
			
			String startLabel = labeller.newLabel("arg1");
			String arg2Label  = labeller.newLabel("arg2");
			String subLabel   = labeller.newLabel("sub");
			String trueLabel  = labeller.newLabel("true");
			String falseLabel = labeller.newLabel("false");
			String joinLabel  = labeller.newLabel("join");
			
			newValueCode(node);
			code.add(Label, startLabel);
			code.append(arg1);
			code.add(Label, arg2Label);
			code.append(arg2);
			code.add(Label, subLabel);
			code.add(Subtract);
			
			if(operator == Punctuator.GREATER){
				code.add(JumpPos, trueLabel);
				code.add(Jump, falseLabel);
			}else if (operator == Punctuator.LESSER){
				code.add(JumpNeg, trueLabel);
				code.add(Jump, falseLabel);
			}else if(operator == Punctuator.LESSEROREQUAL){
				code.add(JumpPos, falseLabel);
				code.add(Jump, trueLabel);
			}else if(operator == Punctuator.EQUAL){
				code.add(JumpFalse,trueLabel);
				code.add(Jump, falseLabel);
			}else if(operator == Punctuator.NOTEQUAL){
				code.add(JumpFalse,falseLabel);
				code.add(Jump, trueLabel);
			}else if(operator == Punctuator.GREATEROREQUAL){
				code.add(JumpNeg, falseLabel);
				code.add(Jump, trueLabel);
			}
			
			code.add(Label, trueLabel);
			code.add(PushI, 1);
			code.add(Jump, joinLabel);
			code.add(Label, falseLabel);
			code.add(PushI, 0);
			code.add(Jump, joinLabel);
			code.add(Label, joinLabel);
		}
		
		private void visitNormalBinaryOperatorNode(BinaryOperatorNode node) {
			newValueCode(node);
			Type typeOfLeftChild = node.child(0).getType();
			Type typeOfRightChild = node.child(1).getType();
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));
			
			code.append(arg1);
			code.append(arg2);
			
			ASMOpcode opcode = opcodeForOperator(node.getOperator(), typeOfLeftChild, typeOfRightChild);
			if(opcode == Divide){
				code.add(Duplicate);
				code.add(JumpFalse, RunTime.INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
			}else if(opcode == FDivide){
				code.add(Duplicate);
				code.add(JumpFZero, RunTime.FLOAT_DIVIDE_BY_ZERO_RUNTIME_ERROR);
			}
			
			code.add(opcode);							// type-dependent! (opcode is different for floats and for ints)
		}
		
		public void visitLeave(UnaryOperatorNode node) {
			Lextant operator = node.getOperator();
			
			// Comparison Operator
			if (operator == Punctuator.NOT) {
				visitUnaryOperatorNode(node);
			}
		}
		
		private void visitUnaryOperatorNode(UnaryOperatorNode node) {
			newValueCode(node);
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			code.append(arg1);		
			
			Labeller labeller = new Labeller("not");
			String trueLabel  = labeller.newLabel("true");
			String falseLabel = labeller.newLabel("false");
			String joinLabel  = labeller.newLabel("join");
			
			code.add(JumpTrue, falseLabel);
			code.add(Jump, trueLabel);
			code.add(Label, trueLabel);
			code.add(PushI, 1);
			code.add(Jump, joinLabel);
			code.add(Label, falseLabel);
			code.add(PushI, 0);
			code.add(Jump, joinLabel);
			code.add(Label, joinLabel);
		}
		

		private ASMOpcode opcodeForOperator(Lextant lextant, Type typeOfLeftChild, Type typeOfRightChild) {
			assert(lextant instanceof Punctuator);
			Punctuator punctuator = (Punctuator)lextant;
			
			if(typeOfLeftChild == PrimitiveType.INTEGER && typeOfRightChild == PrimitiveType.INTEGER ){
				switch(punctuator) {
				case ADD: 	   		return Add;				// type-dependent!
				case SUBTRACT:      return Subtract;
				case MULTIPLY: 		return Multiply;		// type-dependent!
				case DIVIDE:        return Divide;
				default:
					assert false : "unimplemented operator in opcodeForOperator";
				}
			}else if(typeOfLeftChild == PrimitiveType.FLOATING && typeOfRightChild == PrimitiveType.FLOATING ){
				switch(punctuator) {
				case ADD: 	   		return FAdd;				// type-dependent!
				case SUBTRACT:      return FSubtract;
				case MULTIPLY: 		return FMultiply;		// type-dependent!
				case DIVIDE:        return FDivide;
				default:
					assert false : "unimplemented operator in opcodeForOperator";
				}
			}
			
			return null;
		}

		///////////////////////////////////////////////////////////////////////////
		// leaf nodes (ErrorNode not necessary)
		public void visit(BooleanConstantNode node) {
			newValueCode(node);
			code.add(PushI, node.getValue() ? 1 : 0);
		}
		public void visit(IdentifierNode node) {
			newAddressCode(node);
			Binding binding = node.getBinding();
			binding.generateAddress(code);
		}		
		public void visit(IntegerConstantNode node) {
			newValueCode(node);
			code.add(PushI, node.getValue());
		}
		public void visit(FloatingConstantNode node){
			newValueCode(node);
			code.add(PushF, node.getValue());
		}
		public void visit(CharConstantNode node){
			newValueCode(node);
			code.add(PushI, node.getValue());
		}
		public void visit(StringConstantNode node){
			newValueCode(node);
			String value = node.getValue();
			Labeller label = new Labeller("stringConstant");
			
//			// My version 
//			String label = StringHashTable.getLabelFor(value);
//			if (label == null) {
//				label = StringHashTable.applyLabelFor(value);
//				code.add(DLabel, label);
//				code.add(DataS, value);
//			}
//			
//			code.add(PushD, label);
			
			// Testing version
			code.add(DLabel, label.newLabel(value));
			code.add(DataS, value);
			code.add(PushD, label.newLabel(value));
		}
	}

}
