package asmCodeGenerator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.FunctionStorage;
import asmCodeGenerator.ArrayHelper;
import asmCodeGenerator.RationalHelper;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import lexicalAnalyzer.Keyword;
import lexicalAnalyzer.Lextant;
import lexicalAnalyzer.Punctuator;
import parseTree.*;
import parseTree.nodeTypes.*;
import semanticAnalyzer.types.*;
import symbolTable.Binding;
import symbolTable.Scope;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

// do not call the code generator if any errors have occurred during analysis.
public class ASMCodeGenerator {
	ParseNode root;
	static String functionPrefix = "$function-";
	static String reg1ForFunction = "reg1-func";
	static String reg2ForFunction = "reg2-func";
	static String reg1 = "reg1-system";
	static String reg2 = "reg2-system";
	static String reg3 = "reg3-system";
	static String reg4 = "reg4-system";
	static String regCounter = "reg-counter"; 
	static String GCDCalculation = "GCDCalculation"; 
	
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
		
		code.append( MemoryManager.codeForInitialization());
		code.append( RunTime.getEnvironment() );
		code.append( globalVariableBlockASM() );
		code.append( programASM() );
		code.append( MemoryManager.codeForAfterApplication());
		code.append( FunctionStorage.GCDCalculation(GCDCalculation, reg1ForFunction, reg2ForFunction));
		
		return code;
	}
	
	private ASMCodeFragment globalVariableBlockASM() {
		assert root.hasScope();
		Scope scope = root.getScope();
		int globalBlockSize = scope.getAllocatedSize();
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		code.add(DLabel, RunTime.GLOBAL_MEMORY_BLOCK);
		code.add(DataZ, globalBlockSize);
		createRegister(code, reg1ForFunction);
		createRegister(code, reg2ForFunction);
		createRegister(code, reg1);
		createRegister(code, reg2);
		createRegister(code, reg3);
		createRegister(code, reg4);		
		createRegister(code, regCounter);
		return code;
	}
	
	public static void createRegister(ASMCodeFragment code, String label){
		code.add(DLabel, label);
		code.add(DataI, 0);
		Macros.storeITo(code, label);
	}
	
	private ASMCodeFragment programASM() {
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

		code.add(Label, RunTime.MAIN_PROGRAM_LABEL);
		code.append( programCode());
		code.add(Halt);
		
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
	    
	    public ASMCodeFragment removeBlockCode(ParseNode tree) {
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
			}else if(node.getType() == PrimitiveType.RATIONAL){
				code.add(LoadI);
			}else if(node.getType().isReferenceType()){
				code.add(LoadI);
			}else{
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
		// Function Related
		
		public void visitLeave(FunctionDefinitionNode node) {
			newVoidCode(node);
			Labeller labeller = new Labeller("function-definition");
			
			functionPreparation(labeller);
			functionProcess(labeller, node);
			functionLaterStage(labeller);
		}
		
		public void functionPreparation(Labeller labeller) {
			String dynamicLinkLabel = labeller.newLabel("dynamic-link");
			String returnAddressLabel = labeller.newLabel("return-address");
			String moveFPtoSPLabel = labeller.newLabel("move-fp-to-sp");

			// decrement SP and store FP in new SP as dynamic link
			code.add(Label, dynamicLinkLabel);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(LoadI);
			decrementStackPointer(4);
			Macros.storeITo(code, RunTime.STACK_POINTER);
			
			// Store return address
			code.add(Label, returnAddressLabel);
			decrementStackPointer(4);
			Macros.storeITo(code, RunTime.STACK_POINTER);
			
			// Move SP back to the end of dynamic link
			incrementStackPointer(8);
			
			// Move FP to SP
			code.add(Label, moveFPtoSPLabel);
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			Macros.storeITo(code, RunTime.FRAME_POINTER);
			
			// Move SP to the start of return address
			// a.k.a the end of storage for local variable
			decrementStackPointer(8);
		}
		public void functionProcess(Labeller labeller, FunctionDefinitionNode node) {
			BlockStatementNode blockStatementNode = (BlockStatementNode)node.child(1).child(1);
			ASMCodeFragment blockStatementCode =  removeVoidCode(blockStatementNode);
			code.append(blockStatementCode);
		}
		
		public void functionLaterStage(Labeller labeller) {
			String pushReturnAddressLabel = labeller.newLabel("push-return-address");
			String replaceFramePointerLabel = labeller.newLabel("replace-frame-pointer");
			String incrementSP = labeller.newLabel("increment-stack-pointer");
			String decrementSP = labeller.newLabel("decrement-stack-pointer");
			
			// Push return address (at FP - 8) to ASM stack
			code.add(Label, pushReturnAddressLabel);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(LoadI);
			Macros.readIOffset(code, -8);
			
			// Replace FP with dynamic link (at FP - 4)
			code.add(Label, replaceFramePointerLabel);
			code.add(PushD, RunTime.FRAME_POINTER);
			code.add(Duplicate);
			code.add(LoadI);
			Macros.readIOffset(code, -4);
			code.add(StoreI);
			
			// Exchange to put return value at the top of the ASM stack
			code.add(Exchange);
			
			// Increment SP by the size of parameter scope and procedure scope
			// incrementStackPointer(parameterScope.size() + procedureScope.size());
			code.add(Label, incrementSP);
			incrementStackPointer(8 + 8);
			
			// Decrement SP by the size of return value and store it
			code.add(Label, decrementSP);
			incrementStackPointer(4);
			Macros.storeITo(code, RunTime.STACK_POINTER);
			
			code.add(Return);
		}

		
		public void visitLeave(FunctionInvocationNode node) {
			Labeller labeller = new Labeller("function-invocation");
			String beginLabel = labeller.newLabel("begin");
			String endLabel = labeller.newLabel("end");

			if(node.getType() == PrimitiveType.VOID) {
				newVoidCode(node);
			} else {
				newValueCode(node);
			}
			
			ParseNode functionName = node.child(0);
			ParseNode exprList = node.child(1);
			
			code.add(Label, beginLabel);
			for(int i = 0; i < exprList.nChildren(); i++) {
				ParseNode expr = exprList.child(i);
				Type type = expr.getType();
				ASMCodeFragment exprCode = removeValueCode(expr);
				code.append(exprCode);
				pushElementToFrameStack(type);
			}
			
			code.add(Call, functionPrefix + functionName.getToken().getLexeme());
			
			// take the return value from the location pointed at 
			// by the stack counter and place it on the ASM stack
			popElementFromFrameToASMStack(node.getType());
			code.add(Label, endLabel);
		}
		
		// pop element from frame stack and increment SP
		public void popElementFromFrameToASMStack(Type type) {			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(opcodeForLoad(type));
			incrementStackPointer(type.getSize());
		}
		
		public void incrementStackPointer(int size) {
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, size);
			code.add(Add);
			Macros.storeITo(code, RunTime.STACK_POINTER);
		}
		
		public void decrementStackPointer(int size) {
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(LoadI);
			code.add(PushI, size);
			code.add(Subtract);
			Macros.storeITo(code, RunTime.STACK_POINTER);
		}
		
		public void pushElementToFrameStack(Type type) {			
			// Need a push before function
			// Pre-decrement style (get new address)
			decrementStackPointer(type.getSize());
			
			// Store the element into the address			
			code.add(PushD, RunTime.STACK_POINTER);
			code.add(Exchange);
			code.add(opcodeForStore(type));	
		}
		
		public void visitLeave(ReturnStatementNode node) {
			// might not be void here
			newVoidCode(node);
			if(node.getType() != PrimitiveType.VOID) {
				code.append(removeValueCode(node.child(0)));
			}
			code.add(Jump, "function_Signature");
		}
		
		
		

		///////////////////////////////////////////////////////////////////////////
		// Statements
		/*
		 *	Statements -> PrintStatement
		 *				  Declatation
		 *			      AssignmentStatement
		 *			      IfStatement 
		 *			      WhileStatement
		 *				  ReleaseStatement
		 *				  BreakStatement
		 *				  ContinueStatement
		 */
		
		// PrintStatement
		public void visitLeave(PrintStatementNode node) {
			newVoidCode(node);
			new PrintStatementGenerator(code, this).generate(node);	
		}
		
		// Declatation
		public void visitLeave(DeclarationNode node) {
			newVoidCode(node);
			Type type = node.getType();
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));	
			ASMCodeFragment rvalue = removeValueCode(node.child(1));
		
			code.append(lvalue);
			code.append(rvalue);
			code.add(opcodeForStore(type));
		}
		
		// AssignmentStatement
		public void visitLeave(AssignmentStatementNode node) {
			newVoidCode(node);
			Type type = node.getType();
			ASMCodeFragment lvalue = removeAddressCode(node.child(0));	
			ASMCodeFragment rvalue = removeValueCode(node.child(1));
			
			if(type == PrimitiveType.RATIONAL && node.child(1).getType() != PrimitiveType.RATIONAL){
				ASMCodeFragment rightValue = new ASMCodeFragment(GENERATES_VALUE);
				rightValue.add(PushI, 1);
				code.append(lvalue);
				code.append(RationalHelper.performOverPuntuator(
						rvalue, rightValue, GCDCalculation, reg1ForFunction, reg2ForFunction, reg1, reg2));
				code.add(opcodeForStore(type));
			}else if(type == PrimitiveType.FLOATING && node.child(1).getType() != PrimitiveType.FLOATING){
				code.append(lvalue);
				code.append(rvalue);
				code.add(ConvertF);
				code.add(opcodeForStore(type));
			}else{
				code.append(lvalue);
				code.append(rvalue);
				code.add(opcodeForStore(type));
			}
		}
		
		// IfStatement
		public void visitLeave(IfStatementNode node){
			newVoidCode(node);
			ASMCodeFragment booleanResult = removeValueCode(node.child(0));	
			ASMCodeFragment trueDoStatement = removeBlockCode(node.child(1));
			Labeller labeller = new Labeller("-if-statement-");
			String beginLabel = labeller.newLabel("begin");
			String falseDoStatementLabel = labeller.newLabel("false-do-expression");
			String endOfIfStatementLabel = labeller.newLabel("end-of-if-statement");
			
			code.append(booleanResult);
			code.add(Label, beginLabel);
			if(node.nChildren() == 3)
				code.add(JumpFalse, falseDoStatementLabel);
			else
				code.add(JumpFalse, endOfIfStatementLabel);
			code.append(trueDoStatement);
			code.add(Jump, endOfIfStatementLabel);
			if(node.nChildren() == 3){
				code.add(Label, falseDoStatementLabel);
				ASMCodeFragment falseDoStatement = removeBlockCode(node.child(2));
				code.append(falseDoStatement);
			}
			code.add(Label, endOfIfStatementLabel);
		}
		
		// WhileStatement
		public void visitEnter(WhileStatementNode node){
			Labeller labeller = new Labeller("-while-statement-");
			String beginLabel = labeller.newLabel("begin");
			String endOfWhileStatementLabel = labeller.newLabel("end-of-while-statement");
			
			node.setLabelForContinue(beginLabel);
			node.setLabelForBreak(endOfWhileStatementLabel);
		}
		
		public void visitLeave(WhileStatementNode node){
			newVoidCode(node);
			ASMCodeFragment booleanResult = removeValueCode(node.child(0));	
			ASMCodeFragment trueDoStatement = removeBlockCode(node.child(1));
			String beginLabel = node.getLabelForContinue();
			String endOfWhileStatementLabel = node.getLabelForBreak();
			
			code.add(Label, beginLabel);
			code.append(booleanResult);
			code.add(JumpFalse, endOfWhileStatementLabel);
			code.append(trueDoStatement);
			code.add(Jump, beginLabel);
			code.add(Label, endOfWhileStatementLabel);
		}
		
		public void visitLeave(ReleaseStatementNode node){
			newVoidCode(node);
			code.append(removeValueCode(node.child(0)));
			ArrayType arrayType = (ArrayType)node.child(0).getType(); 	
			code.append(ArrayHelper.arrayRelease(arrayType));
		}
		
		public void visitLeave(BreakStatementNode node){
			newVoidCode(node);
			code.add(Jump, node.getTargetLabelForBreak());
		}
		
		public void visitLeave(ContinueStatementNode node){
			newVoidCode(node);
			code.add(Jump, node.getTargetLabelForContinue());
		}
		
		
		///////////////////////////////////////////////////////////////////////////
		// Expressions
		
		/* Expression -> BinaryExpression
		 * 			  -> UnaryExpression
		 * 			  -> TypeCastingExpression
		 * 			  -> ArrayIndexingExpression 
		 */
		
		///////////////////////////////////////////////////////////////////////////
		// expressions
		public void visitLeave(BinaryOperatorNode node) {
			Lextant operator = node.getOperator();
			
			// Comparison Operator
			if (operator == Punctuator.LESSER ||
				operator == Punctuator.LESSEROREQUAL ||
				operator == Punctuator.NOTEQUAL ||
				operator == Punctuator.EQUAL ||
				operator == Punctuator.GREATER ||	
				operator == Punctuator.GREATEROREQUAL
			) visitComparisonOperatorNode(node);
			
			// Boolean Operator
			else if (operator == Punctuator.AND ||
					 operator == Punctuator.OR
			) visitBooleanOperatorNode(node);
			
			// Rational Operator
			else if (operator == Punctuator.OVER ||
					operator == Punctuator.EXPRESSOVER ||
					operator == Punctuator.RATIONALIZE
			) visitRationalOperatorNode(node);
			
			// Arithmetic Operator
			else {
				visitNormalBinaryOperatorNode(node);
			}
		}
		
		private void visitComparisonOperatorNode(BinaryOperatorNode node) {
			Lextant operator = node.getOperator();
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));
			newValueCode(node);
			
			if(node.child(0).getType() == PrimitiveType.RATIONAL) {
				code.append(RationalHelper.rationalComparison(arg1, 
					arg2, GCDCalculation, reg1, reg2, reg1ForFunction, reg2ForFunction, operator));
			}else{			
				Labeller labeller = new Labeller("compare");	
				String startLabel = labeller.newLabel("arg1");
				String arg2Label  = labeller.newLabel("arg2");
				String subLabel   = labeller.newLabel("sub");
				String trueLabel  = labeller.newLabel("true");
				String falseLabel = labeller.newLabel("false");
				String joinLabel  = labeller.newLabel("join");
				
				code.add(Label, startLabel);
				code.append(arg1);
				code.add(Label, arg2Label);
				code.append(arg2);
				code.add(Label, subLabel);
				
				if(node.child(0).getType() == PrimitiveType.FLOATING) {
					code.add(FSubtract);
					if(operator == Punctuator.GREATER){
						code.add(JumpFPos, trueLabel);
						code.add(Jump, falseLabel);
					}else if (operator == Punctuator.LESSER){
						code.add(JumpFNeg, trueLabel);
						code.add(Jump, falseLabel);
					}else if(operator == Punctuator.LESSEROREQUAL){
						code.add(JumpFPos, falseLabel);
						code.add(Jump, trueLabel);
					}else if(operator == Punctuator.EQUAL){
						code.add(JumpFZero,trueLabel);
						code.add(Jump, falseLabel);
					}else if(operator == Punctuator.NOTEQUAL){
						code.add(JumpFZero,falseLabel);
						code.add(Jump, trueLabel);
					}else if(operator == Punctuator.GREATEROREQUAL){
						code.add(JumpFNeg, falseLabel);
						code.add(Jump, trueLabel);
					}
				}else{
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
				}
					
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Jump, joinLabel);
				code.add(Label, falseLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, joinLabel);
			}
		}
		
		private void visitBooleanOperatorNode(BinaryOperatorNode node){
			newValueCode(node);
			Lextant operator = node.getOperator();
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));			
			Labeller labeller = new Labeller("boolean_operator");	
			String startLabel = labeller.newLabel("arg1");
			String arg2Label  = labeller.newLabel("arg2");
			String trueLabel  = labeller.newLabel("true");
			String falseLabel = labeller.newLabel("false");
			String joinLabel  = labeller.newLabel("join");
			
			if(operator == Punctuator.OR){
				code.add(Label, startLabel);
				code.append(arg1);
				code.add(JumpTrue, trueLabel);
				code.add(Label, arg2Label);
				code.append(arg2);
				code.add(JumpTrue, trueLabel);
				code.add(Jump, falseLabel);
			}
			else if(operator == Punctuator.AND){
				code.add(Label, startLabel);
				code.append(arg1);
				code.add(JumpFalse, falseLabel);
				code.add(Label,arg2Label);
				code.append(arg2);
				code.add(JumpFalse, falseLabel);
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
		
		private void visitRationalOperatorNode(BinaryOperatorNode node) {
			newValueCode(node);
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));
			Lextant operator = node.getOperator();
			Type type = node.child(0).getType();
			
			if(operator == Punctuator.OVER) {
				code.append(RationalHelper.performOverPuntuator(arg1, arg2, GCDCalculation,
						reg1ForFunction, reg2ForFunction, reg1, reg2));
			}else if(operator == Punctuator.EXPRESSOVER) {
				code.append(RationalHelper.performExpressOverPunctuator(arg1, arg2, type, reg1ForFunction));
			}else if(operator == Punctuator.RATIONALIZE) {
				code.append(RationalHelper.performRationalizePuntuator(arg1, arg2, type, GCDCalculation,
						reg1ForFunction, reg2ForFunction, reg1, reg2, reg3, reg4));
			}
		}
		
		private void visitNormalBinaryOperatorNode(BinaryOperatorNode node) {
			newValueCode(node);
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			ASMCodeFragment arg2 = removeValueCode(node.child(1));			
			Object operation = node.getSignature().getVariant();
			
			if(operation instanceof ASMOpcode) {
				ASMOpcode opcode = (ASMOpcode)operation;
				code.append(arg1);
				code.append(arg2);
				if(opcode == Divide) {
					code.add(Duplicate);
					code.add(JumpFalse, RunTime.INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
				}else if(opcode == FDivide) {
					code.add(Duplicate);
					code.add(JumpFZero, RunTime.FLOAT_DIVIDE_BY_ZERO_RUNTIME_ERROR);
				}
				code.add(opcode);
			}else if(operation instanceof String){
				if(operation == BinaryOperatorNode.RATIONAL_ADD){
					code.append(RationalHelper.rationAdd(arg1, arg2, 
							GCDCalculation, reg1, reg2, reg1ForFunction, reg2ForFunction));
				}else if(operation == BinaryOperatorNode.RATIONAL_SUBSTRCT){
					code.append(RationalHelper.rationSubtract(arg1, arg2, 
							GCDCalculation, reg1, reg2, reg1ForFunction, reg2ForFunction));
				}else if(operation == BinaryOperatorNode.RATIONAL_MULTIPLY){
					code.append(RationalHelper.rationMultiply(arg1, arg2, 
							GCDCalculation, reg1, reg2, reg1ForFunction, reg2ForFunction));
				}else if(operation == BinaryOperatorNode.RATIONAL_DIVIDE){
					code.append(RationalHelper.rationDivide(arg1, arg2, 
							GCDCalculation, reg1, reg2, reg1ForFunction, reg2ForFunction));
				}
			}
		}
		
		public void visitLeave(UnaryOperatorNode node) {
			newValueCode(node);
			Lextant operator = node.getOperator();
			ASMCodeFragment arg1 = removeValueCode(node.child(0));

			if (operator == Punctuator.NOT) {
				code.append(arg1);		
				code.add(BNegate);
			}
			
			if (operator == Keyword.LENGTH ) {
				Labeller labeller = new Labeller("-get-array-length");
				code.append(arg1);		
				code.append(ArrayHelper.pushArrayLength(labeller.newLabel("push-array-length")));
			}	
		}
		
		public void visitLeave(TypeCastingNode node){
			newValueCode(node);
			Type originalType = node.child(0).getType();
			Type targetType   = node.child(1).getType();
						
			Labeller labeller = new Labeller("-casting-");
			String trueLabel  = labeller.newLabel("true");
			String joinLabel  = labeller.newLabel("join");
			ASMCodeFragment value = removeValueCode(node.child(0));
			code.append(value);
			
			if(originalType == targetType) 
				return;
			else if(originalType == PrimitiveType.FLOATING && targetType == PrimitiveType.INTEGER)
				code.add(ConvertI);
			else if(originalType == PrimitiveType.INTEGER && targetType == PrimitiveType.FLOATING)
				code.add(ConvertF);
			else if(originalType == PrimitiveType.INTEGER && targetType == PrimitiveType.BOOLEAN) {
				code.add(JumpTrue, trueLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Label, joinLabel);		
			}else if(originalType == PrimitiveType.CHARACTER && targetType == PrimitiveType.BOOLEAN) {				
				code.add(JumpTrue, trueLabel);
				code.add(PushI, 0);
				code.add(Jump, joinLabel);
				code.add(Label, trueLabel);
				code.add(PushI, 1);
				code.add(Label, joinLabel);		
			}else if(originalType == PrimitiveType.INTEGER && targetType == PrimitiveType.CHARACTER) {
				code.add(PushI, 127);
				code.add(BTAnd);
			}
		}
		
		public void visitLeave(ArrayIndexingNode node){
			newAddressCode(node);
			Labeller labeller = new Labeller("-array-indexing-");
			ArrayType arrayType = (ArrayType)node.child(0).getType();
			ASMCodeFragment arrayAddress = removeValueCode(node.child(0));
			ASMCodeFragment index = removeValueCode(node.child(1));
			code.append(ArrayHelper.arrayElementAtIndex(arrayType, arrayAddress, index, labeller, reg1));
		}
		
		///////////////////////////////////////////////////////////////////////////
		// ArrayExpressions
		
		/* ArrayExpressions -> NewArrayTypeLengthExpression
		 * 			  		-> ExpressionList
		 * 			  		-> CloneExpression 
		 */
		
		public void visitLeave(NewArrayTypeLengthNode node){
			newValueCode(node);
			Labeller labeller = new Labeller("empty-array-creation");
			ArrayType arrayType = (ArrayType)(node.getType());
			ASMCodeFragment lengthOfArray = removeValueCode(node.child(1));
			code.append(ArrayHelper.arrayCreation(arrayType, lengthOfArray, labeller, reg1));
		}
		
		public void visitLeave(ExpressionListNode node){
			// Create array only when ExpressionList is an element of array
			if(!(node.getParent() instanceof FunctionInvocationNode)) {
				newValueCode(node);
				Labeller labeller = new Labeller("-expr-list-");
				ArrayType arrayType = (ArrayType)(node.getType());	
				List <ASMCodeFragment> arrayElement = new ArrayList<>();
				
				ASMCodeFragment lengthOfArray = new ASMCodeFragment(
						ASMCodeFragment.CodeType.GENERATES_VALUE);
				lengthOfArray.add(PushI, arrayType.getLength());
					
				for(int i = 0; i < node.nChildren();i++){
					arrayElement.add(removeValueCode(node.child(i)));
				}
				code.append(ArrayHelper.arrayCreation(arrayType, lengthOfArray, labeller, reg1));
				code.append(ArrayHelper.arrayInitialization(arrayType, arrayElement, 
						opcodeForStore(arrayType.getSubType()), labeller));
			}
		}

		public void visitLeave(CopyOperatorNode node){
			newValueCode(node);
			Labeller labeller = new Labeller("-copy-operator-");
			ArrayType arrayType = (ArrayType)node.getType();
			ASMCodeFragment arg1 = removeValueCode(node.child(0));
			code.append(ArrayHelper.arrayClone(arrayType, arg1, labeller, reg1, reg2, reg3));
		}
		
		///////////////////////////////////////////////////////////////////////////
		// Helper Function
		
		private ASMOpcode opcodeForStore(Type type) {
			if(type instanceof TypeVariable)
				type = ((TypeVariable)type).getSubtype();
			if(type == PrimitiveType.INTEGER) 	return StoreI;
			if(type == PrimitiveType.BOOLEAN)	return StoreC;
			if(type == PrimitiveType.FLOATING)	return StoreF;
			if(type == PrimitiveType.CHARACTER)	return StoreC;
			if(type == PrimitiveType.STRING) 	return StoreI;
			if(type == PrimitiveType.RATIONAL)  return StoreI;
			if(type.isReferenceType()) 			return StoreI;
			assert false: "Type " + type + " unimplemented in opcodeForStore()";
			return null;
		}
		
		private ASMOpcode opcodeForLoad(Type type) {
			if(type instanceof TypeVariable)
				type = ((TypeVariable)type).getSubtype();
			if(type == PrimitiveType.INTEGER) 	return LoadI;
			if(type == PrimitiveType.BOOLEAN)	return LoadC;
			if(type == PrimitiveType.FLOATING)	return LoadF;
			if(type == PrimitiveType.CHARACTER)	return LoadC;
			if(type == PrimitiveType.STRING) 	return LoadI;
			if(type == PrimitiveType.RATIONAL)  return LoadI;
			if(type.isReferenceType()) 			return LoadI;
			assert false: "Type " + type + " unimplemented in opcodeForLoad()";
			return null;
		}
		
		///////////////////////////////////////////////////////////////////////////
		// leaf nodes (ErrorNode not necessary)
		public void visit(BooleanConstantNode node) {
			newValueCode(node);
			code.add(PushI, node.getValue() ? 1 : 0);
		}
		
		public void visit(IdentifierNode node) {
			if(node.getBinding().getBindingType() == Binding.BindingType.VARIABLE) {
				newAddressCode(node);
				Binding binding = node.getBinding();
				binding.generateAddress(code);
			}
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
			
			code.add(DLabel, label.newLabel(value));
			code.add(DataI, 6);
			code.add(DataI, 9);
			code.add(DataI, value.length());
			code.add(DataS, value);
			code.add(PushD, label.newLabel(value));
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
	}
}
