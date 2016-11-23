package symbolTable;

import asmCodeGenerator.codeStorage.ASMCodeFragment;
import inputHandler.TextLocation;
import semanticAnalyzer.types.PrimitiveType;
import semanticAnalyzer.types.Type;

public class Binding {
	public enum BindingType {
		VARIABLE,
		FUNCTION,
	}
	
	private Type type;
	private TextLocation textLocation;
	private MemoryLocation memoryLocation;
	private String lexeme;
	private String lambdaName;
	private boolean isMutable;
	private BindingType bindingType;
	
	//  Binding for variable
	public Binding(Type type, TextLocation location, MemoryLocation memoryLocation, String lexeme, boolean ismutable) {
		super();
		this.type = type;
		this.textLocation = location;
		this.memoryLocation = memoryLocation;
		this.lexeme = lexeme;
		this.isMutable = ismutable;
		this.bindingType = BindingType.VARIABLE;
		this.lambdaName = null;
	}
	
	// Binding for function
	public Binding(Type type, TextLocation location, String lexeme) {
		super();
		this.type = type;
		this.textLocation = location;
		this.memoryLocation = null;
		this.lexeme = lexeme;
		this.isMutable = false;
		this.bindingType = BindingType.FUNCTION;
		this.lambdaName = null;
	}
	
	public Binding(Type type, TextLocation location, String lexeme, String lambdaName) {
		super();
		this.type = type;
		this.textLocation = location;
		this.memoryLocation = null;
		this.lexeme = lexeme;
		this.isMutable = false;
		this.bindingType = BindingType.FUNCTION;
		this.lambdaName = lambdaName;
	}
	
	public String toString() {
		return "[" + lexeme +
				" " + type +  // " " + textLocation +	
				" " + memoryLocation +
				"]";
	}	
	public String getLexeme() {
		return lexeme;
	}
	
	public String getLambdaName() {
		return lambdaName;
	}
	public boolean isMutable(){
		return isMutable;
	}
	
	public Type getType() {
		return type;
	}
	
	public void setType(Type type) {
        this.type = type;
    }
	
	public TextLocation getLocation() {
		return textLocation;
	}
	
	public MemoryLocation getMemoryLocation() {
		return memoryLocation;
	}
	
	public BindingType getBindingType() {
		return bindingType;
	}
	
	public void generateAddress(ASMCodeFragment code) {
		memoryLocation.generateAddress(code, "%% " + lexeme);
	}
	
	
	
////////////////////////////////////////////////////////////////////////////////////
//Null Binding object
////////////////////////////////////////////////////////////////////////////////////

	public static Binding nullInstance() {
		return NullBinding.getInstance();
	}
	private static class NullBinding extends Binding {
		private static NullBinding instance=null;
		private NullBinding() {
			super(PrimitiveType.ERROR,
					TextLocation.nullInstance(),
					MemoryLocation.nullInstance(),
					"the-null-binding",
					false);
		}
		public static NullBinding getInstance() {
			if(instance==null)
				instance = new NullBinding();
			return instance;
		}
	}
}
