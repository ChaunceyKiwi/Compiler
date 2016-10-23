package asmCodeGenerator;

import static asmCodeGenerator.codeStorage.ASMOpcode.*;
import parseTree.ParseNode;
import parseTree.nodeTypes.NewlineNode;
import parseTree.nodeTypes.TabNode;
import parseTree.nodeTypes.PrintStatementNode;
import parseTree.nodeTypes.SpaceNode;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.ArrayType;
import semanticAnalyzer.types.Type;
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
			}else if(child.getType() instanceof ArrayType){
				code.append(visitor.removeValueCode(child));
				appendPrintCodeForArrayType((ArrayType)child.getType());
			}else {
				appendPrintCode(child);
			}
		}
	}

	private void appendPrintCode(ParseNode node) {
		String format = printFormat(node.getType());

		code.append(visitor.removeValueCode(node));
		convertToStringIfBoolean(node);
		code.add(PushD, format);
		code.add(Printf);
	}
	
	private void appendPrintCodeForArrayType(ArrayType type) {
		Type subType = type.getSubType();
		int subTypeSize = type.getSubType().getSize();
		
		Labeller labeller = new Labeller("-print-array");
		String beginLabel = labeller.newLabel("-begin-");
		String endLabel = labeller.newLabel("-end-");
		String loopBeginLabel = labeller.newLabel("-loop-begin-");
		String loopEndLabel = labeller.newLabel("-loop-end-");
		String loopCounterLabel = labeller.newLabel("-loop-counter-");
		
		code.add(Label, beginLabel);
		// get the address of the array
		code.add(Duplicate);
		
		// store the length of array as the loop counter
		code.append(ArrayBuilder.pushArrayLength(labeller));
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
