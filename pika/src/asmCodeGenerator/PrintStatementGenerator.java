package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import parseTree.ParseNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.TabNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.SpaceNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.*;
import asmCodeGenerator.ASMCodeGenerator.CodeVisitor;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.runtime.RunTime;

public class PrintStatementGenerator {
	ASMCodeFragment code;
	ASMCodeGenerator.CodeVisitor visitor;
	
	
	public PrintStatementGenerator(ASMCodeFragment code, CodeVisitor visitor) {
		super();
		this.code = code;
		this.visitor = visitor;
	}

	public void generate(PrintStatementNode node) {
		for(ParseNode child : node.getChildren()) {
			if(child instanceof NewlineNode || child instanceof SpaceNode || child instanceof TabNode) {
				ASMCodeFragment childCode = visitor.removeVoidCode(child);
				code.append(childCode);
			}else if(child.getType() instanceof ArrayType) {
				code.append(visitor.removeValueCode(child));
				appendPrintCodeForArrayType((ArrayType)child.getType());
			}else if(child.getType() instanceof TypeVariable) {
				Type subtype = ((TypeVariable)child.getType()).getSubtype();
				if(subtype instanceof ArrayType) {
					code.append(visitor.removeValueCode(child));
					code.add(LoadI);
					appendPrintCodeForArrayType((ArrayType)subtype);
				}else if(subtype instanceof PrimitiveType) {
					appendPrintCode(child);
				}
			}else if(child.getType() == PrimitiveType.RATIONAL){
				code.append(visitor.removeValueCode(child));
				appendPrintCodeForRational(child.getType());
			}
			else{
				appendPrintCode(child);
			}
		}
	}

	private void appendPrintCode(ParseNode node) {
		String format;
		
		if(node.getType() instanceof TypeVariable) {
			format = printFormat(((TypeVariable)node.getType()).getSubtype());
			code.append(visitor.removeValueCode(node));
			code.add(LoadI);
		}else {
			format = printFormat(node.getType());
			code.append(visitor.removeValueCode(node));
		}
		
		convertToStringIfBoolean(node);
		code.add(PushD, format);
		code.add(Printf);
	}
	
	// Assume rational number is n // m
	// The format to print is: a_b//c
	// a = int(n/m), b = sig(n) * (n-a*m), c = abs(m)
	private void appendPrintCodeForRational(Type type){
		Labeller labeller = new Labeller("-print-rational-");
		String beginLabel = labeller.newLabel("-begin-");
		String endLabel = labeller.newLabel("-end-");
		String jumpLabel1 = labeller.newLabel("jumpLabel1");
		String jumpLabel2 = labeller.newLabel("jumpLabel2");
		String jumpLabel3 = labeller.newLabel("jumpLabel3");
		String joinLabel = labeller.newLabel("joinLabel");
		String addressOfRationalLabel = labeller.newLabel("rational-addr");
		String format = printFormat(type);
					
		code.add(Label, beginLabel);
		ArrayBuilder.memoryPointer(code, addressOfRationalLabel);
		
		// get interger part and print: a = int(n/m)
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(LoadI);
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(PushI, 4);
		code.add(Add);
		code.add(LoadI);
		code.add(Divide);
		code.add(Duplicate);
		code.add(Duplicate);
		code.add(JumpFalse, jumpLabel3);
		
		// if a is not zero, print it
		code.add(PushD, format);
		code.add(Printf);
		code.add(Jump, joinLabel);
		
		// if a is zero and sigh should be negative
		// then print '-'
		code.add(Label, jumpLabel3);
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(LoadI);
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(PushI, 4);
		code.add(Add);
		code.add(LoadI);
		code.add(Multiply);
		code.add(JumpPos, joinLabel);
		code.add(PushD, RunTime.MINUS_SIGN_PRINT_FORMAT);
		code.add(Printf);
		code.add(Label, joinLabel);
		
		// second part b = sig(n) * (n-a*m)
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(PushI, 4);
		code.add(Add);
		code.add(LoadI);
		code.add(Multiply);
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(LoadI);
		code.add(Exchange);
		code.add(Subtract);
		code.add(Duplicate);
		code.add(JumpFalse, endLabel);
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(LoadI);
		code.add(JumpPos, jumpLabel1);
		code.add(Negate);
		code.add(Label, jumpLabel1);
		code.add(PushD, RunTime.AND_PRINT_FORMAT);
		code.add(Printf);
		code.add(PushD, format);
		code.add(Printf);
		code.add(PushD, RunTime.OVER_PRINT_FORMAT);
		code.add(Printf);
		
		// third part:get abs(m)
		code.add(PushD, addressOfRationalLabel);
		code.add(LoadI);
		code.add(PushI, 4);
		code.add(Add);
		code.add(LoadI);
		code.add(Duplicate);
		code.add(JumpPos, jumpLabel2);
		code.add(Negate);
		code.add(Label, jumpLabel2);
		code.add(PushD, format);
		code.add(Printf);
		
		code.add(Label, endLabel);
	}
	
	private void appendPrintCodeForArrayType(ArrayType type) {
		Type subType = type.getSubType();
		if(subType instanceof TypeVariable){
			subType = ((TypeVariable)subType).getSubtype();
		}
			
		int subTypeSize = type.getSubType().getSize();
		
		Labeller labeller = new Labeller("-print-array-");
		String beginLabel = labeller.newLabel("-begin-");
		String endLabel = labeller.newLabel("-end-");
		String loopBeginLabel = labeller.newLabel("-loop-begin-");
		String loopEndLabel = labeller.newLabel("-loop-end-");
		String loopCounterLabel = labeller.newLabel("-loop-counter-");
		
		code.add(Label, beginLabel);
		// get the address of the array
		code.add(Duplicate);
		
		// store the length of array as the loop counter
		code.append(ArrayBuilder.pushArrayLength(labeller.newLabel("-push-array-length")));
		createLoopCounter(loopCounterLabel);
		
		// get the address of first element
		code.add(PushI, ArrayType.header_size);
		code.add(Add);
		
		code.add(PushD, RunTime.OPEN_SQUARE_BRACKET_PRINT_FORMAT);
		code.add(Printf);
		code.add(Label, loopBeginLabel);
		code.add(PushD, loopCounterLabel);
		code.add(LoadI);
		
		// Counter counts from length to 0
		// If counter is 0, then exit loop
		code.add(JumpFalse, loopEndLabel);
		
		code.add(Duplicate);	
		code.add(PushI, subTypeSize);
		code.add(Add);
		code.add(Exchange);		
		code.add(LoadI);
		
		if(subType.isReferenceType()) {
			appendPrintCodeForArrayType((ArrayType)subType);
		}
		else {
			String format = printFormat(subType);
			code.add(PushD, format);
			code.add(Printf);
		}
		
		// Decrement the counter by 1
		Macros.decrementInteger(code, loopCounterLabel);
		
		// Print separator and space if not last element
		code.add(PushD, loopCounterLabel);
		code.add(LoadI);
		code.add(JumpFalse, loopEndLabel);
		code.add(PushD, RunTime.SEPARATOR_PRINT_FORMAT);
		code.add(Printf);
		code.add(PushD, RunTime.SPACE_PRINT_FORMAT);
		code.add(Printf);
		
		code.add(Jump, loopBeginLabel);
		code.add(Label, loopEndLabel);
		code.add(Pop);
		code.add(PushD, RunTime.CLOSE_SQUARE_BRACKET_PRINT_FORMAT);
		code.add(Printf);
		code.add(Label, endLabel);
	}
	
	private void createLoopCounter(String label){
		code.add(DLabel, label);
		code.add(DataI, 0);
		Macros.storeITo(code, label);
	}
	
	private void convertToStringIfBoolean(ParseNode node) {
		if(node.getType() != PrimitiveType.BOOLEAN) {
			return;
		}
		
		Labeller labeller = new Labeller("print-boolean");
		String trueLabel = labeller.newLabel("true");
		String endLabel = labeller.newLabel("join");

		code.add(JumpTrue, trueLabel);
		code.add(PushD, RunTime.BOOLEAN_FALSE_STRING);
		code.add(Jump, endLabel);
		code.add(Label, trueLabel);
		code.add(PushD, RunTime.BOOLEAN_TRUE_STRING);
		code.add(Label, endLabel);
	}


	private static String printFormat(Type type) {
		assert type instanceof PrimitiveType;
		
		switch((PrimitiveType)type) {
		case INTEGER:	 return RunTime.INTEGER_PRINT_FORMAT;
		case RATIONAL:	 return RunTime.INTEGER_PRINT_FORMAT;
		case BOOLEAN:	 return RunTime.BOOLEAN_PRINT_FORMAT;
		case FLOATING:   return RunTime.FLOATING_PRINT_FORMAT;
		case CHARACTER:  return RunTime.CHAR_PRINT_FORMAT;
		case STRING:     return RunTime.STRING_PRINT_FORMAT;


		default:		
			assert false : "Type " + type + " unimplemented in PrintStatementGenerator.printFormat()";
			return "";
		}
	}
}
