package semanticAnalyzer.signatures;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import asmCodeGenerator.codeStorage.ASMOpcode;
import lexicalAnalyzer.Punctuator;
import semanticAnalyzer.types.*;
import parseTree.nodeTypes.ArrayIndexingNode;
import parseTree.nodeTypes.AssignmentStatementNode;
import parseTree.nodeTypes.CopyOperatorNode;
import parseTree.nodeTypes.NewArrayTypeLengthNode;


public class FunctionSignatures extends ArrayList<FunctionSignature> {
	private static final long serialVersionUID = -4907792488209670697L;
	private static Map<Object, FunctionSignatures> signaturesForKey = new HashMap<Object, FunctionSignatures>();
	
	Object key;
	
	public FunctionSignatures(Object key, FunctionSignature ...functionSignatures) {
		this.key = key;
		for(FunctionSignature functionSignature: functionSignatures) {
			add(functionSignature);
		}
		signaturesForKey.put(key, this);
	}
	
	public Object getKey() {
		return key;
	}
	public boolean hasKey(Object key) {
		return this.key.equals(key);
	}
	
	// To get the signature for a list of types
	// For a signatures try each signature in it
	// If such a signature is find, then stop and return it
	// Otherwise return null 
	public FunctionSignature acceptingSignature(List<Type> types) {
		for(FunctionSignature functionSignature: this) {
			if(functionSignature.accepts(types)) {
				return functionSignature;
			}
		}
		return FunctionSignature.nullInstance();
	}
	
	// Accept as long as there is one found
	public boolean accepts(List<Type> types) {
		return !acceptingSignature(types).isNull();
	}

	
	/////////////////////////////////////////////////////////////////////////////////
	// access to FunctionSignatures by key object.
	
	public static FunctionSignatures nullSignatures = new FunctionSignatures(0, FunctionSignature.nullInstance());

	public static FunctionSignatures signaturesOf(Object key) {
		if(signaturesForKey.containsKey(key)) {
			return signaturesForKey.get(key);
		}
		return nullSignatures;
	}
	
	public static FunctionSignature signature(Object key, List<Type> types) {
		FunctionSignatures signatures = FunctionSignatures.signaturesOf(key);
		return signatures.acceptingSignature(types);
	}


	/////////////////////////////////////////////////////////////////////////////////
	// Put the signatures for operators in the following static block.
	
	static {
		TypeVariable typeVariable = new TypeVariable();
		
		/////////////////////////////////////////////////////////////////////////////////
		// Arithmetic Operator
		new FunctionSignatures(Punctuator.ADD,
		    new FunctionSignature(ASMOpcode.Add, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.INTEGER),
		    new FunctionSignature(ASMOpcode.FAdd, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.FLOATING)
		);
		
		new FunctionSignatures(Punctuator.SUBTRACT,
			new FunctionSignature(ASMOpcode.Subtract, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.INTEGER),
			new FunctionSignature(ASMOpcode.FSubtract, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.FLOATING)
		);
		
		new FunctionSignatures(Punctuator.MULTIPLY,
			new FunctionSignature(ASMOpcode.Multiply, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.INTEGER),
			new FunctionSignature(ASMOpcode.FMultiply, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.FLOATING)
		);
		
		new FunctionSignatures(Punctuator.DIVIDE,
			new FunctionSignature(ASMOpcode.Divide, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.INTEGER),
			new FunctionSignature(ASMOpcode.FDivide, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.FLOATING)
		);
		
		/////////////////////////////////////////////////////////////////////////////////
		// Comparison Operator
		
		new FunctionSignatures(Punctuator.LESSER,
			new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.LESSEROREQUAL,
			new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.EQUAL,
			new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.NOTEQUAL,
			new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.GREATER,
			new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.GREATEROREQUAL,
			new FunctionSignature(1, PrimitiveType.INTEGER, PrimitiveType.INTEGER, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.FLOATING, PrimitiveType.FLOATING, PrimitiveType.BOOLEAN),
			new FunctionSignature(1, PrimitiveType.CHARACTER, PrimitiveType.CHARACTER, PrimitiveType.BOOLEAN)
		);
		
		/////////////////////////////////////////////////////////////////////////////////
		// Boolean Operator
		
		new FunctionSignatures(Punctuator.AND,
			new FunctionSignature(1, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.OR,
			new FunctionSignature(1, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN)
		);
		
		new FunctionSignatures(Punctuator.NOT,
			new FunctionSignature(1, PrimitiveType.BOOLEAN, PrimitiveType.BOOLEAN)
		);
		
		/////////////////////////////////////////////////////////////////////////////////
		// Other Operator
		new FunctionSignatures(NewArrayTypeLengthNode.EMPTY_ARRAY_CREATION,
				new FunctionSignature(NewArrayTypeLengthNode.EMPTY_ARRAY_CREATION,
					new ArrayType(typeVariable), PrimitiveType.INTEGER, new ArrayType(typeVariable))
		);
		
		new FunctionSignatures(CopyOperatorNode.ARRAY_CLONE,
				new FunctionSignature(CopyOperatorNode.ARRAY_CLONE,
					new ArrayType(typeVariable), new ArrayType(typeVariable))
		);
		
		new FunctionSignatures(ArrayIndexingNode.ARRAY_INDEXING,
				new FunctionSignature(ArrayIndexingNode.ARRAY_INDEXING,
						new ArrayType(typeVariable), PrimitiveType.INTEGER, typeVariable)
		);
		
		new FunctionSignatures(AssignmentStatementNode.VALUE_ASSIGNMENT,
				new FunctionSignature(AssignmentStatementNode.VALUE_ASSIGNMENT,
						typeVariable, typeVariable, typeVariable)
		);
		
	}
}
