package asmCodeGenerator;
import asmCodeGenerator.codeStorage.*;
import asmCodeGenerator.runtime.MemoryManager;
import asmCodeGenerator.runtime.RunTime;
import semanticAnalyzer.types.ArrayType;
import java.util.List;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

public class ArrayBuilder {
	
	public static ASMCodeFragment arrayCreation(ArrayType arrayType, 
			ASMCodeFragment lengthOfArray, Labeller labeller){
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		String beginLabel = labeller.newLabel("array-creation-begin");
		String getLengthLabel = labeller.newLabel("array-creation-get-length");
		String sizeLabel = labeller.newLabel("array-creation-size");
		String typeLabel = labeller.newLabel("array-creation-type");
		String statusLabel = labeller.newLabel("array-creation-status");
		String subTypeSize = labeller.newLabel("array-creation-subtype-size");
		String lengthLabel = labeller.newLabel("array-creation-length");
		String endLabel = labeller.newLabel("array-creation-end");
		
		
		code.add(Label, beginLabel);
		code.add(Label, getLengthLabel);
			
		// Length of array cannot be negative
		appendLengthCode(code, lengthOfArray);
		code.add(Duplicate);
		code.add(JumpNeg, RunTime.ARRAY_SIZE_NEGATIVE_ERROR);
		
		// Get the size of whole array including header and element
		code.add(Label, sizeLabel);
		code.add(PushI, arrayType.getSubType().getSize());
		code.add(Multiply);
		code.add(PushI, ArrayType.header_size);
		code.add(Add);
		
		// call the memory manager to get address allocated
		code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
		
		// add type identifier of array
		code.add(Label, typeLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getTypeIdentifier());
		code.add(Exchange);
		Macros.writeIOffset(code, 0);
		
		// add status of array
		code.add(Label, statusLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getStatus());
		code.add(Exchange);
		Macros.writeIOffset(code, 4);
		
		// add subtype size of array
		code.add(Label, subTypeSize);
		code.add(Duplicate);
		code.add(PushI, arrayType.getSubType().getSize());
		code.add(Exchange);
		Macros.writeIOffset(code, 8);
		
		// add length of array
		code.add(Label, lengthLabel);
		code.add(Duplicate);
		appendLengthCode(code, lengthOfArray);
		code.add(Exchange);
		Macros.writeIOffset(code, 12);
		
		code.add(Label, endLabel);
		return code;
	}
	
	public static ASMCodeFragment arrayInitialization(ArrayType arrayType,
			List<ASMCodeFragment> arrayElement, ASMOpcode op, Labeller labeller){
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
		int subTypeSize = arrayType.getSubType().getSize();
		int headerSize = arrayType.getHeaderSize();
		String beginLabel = labeller.newLabel("array-initialization-begin");
		String endLabel = labeller.newLabel("array-initialization-end");
		
		code.add(Label, beginLabel);
		for(int i = 0; i < arrayElement.size(); i++){
			code.add(Duplicate);
			code.append(arrayElement.get(i));
			code.add(Exchange);
			code.add(PushI, headerSize + subTypeSize * i);
			code.add(Add);
			code.add(Exchange);
			code.add(op);
		}
		code.add(Label, endLabel);
		
		return code;
	}
	
	public static ASMCodeFragment arrayClone(ArrayType arrayType,
			ASMCodeFragment originalArray, Labeller labeller){
		
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);

		String beginLabel = labeller.newLabel("array-copy-begin");
		String endLabel = labeller.newLabel("array-copy-end");
		
		String beginHeaderCopyLabel = labeller.newLabel("array-header-copy-begin");
		String endHeaderCopyLabel = labeller.newLabel("array-header-copy-end");
		
		String beginElementCopyLabel = labeller.newLabel("array-element-copy-begin");
		String endElementCopyLabel = labeller.newLabel("array-element-copy-end");
		
		String sizeLabel = labeller.newLabel("array-copy-size");
		String typeLabel = labeller.newLabel("array-copy-type");
		String statusLabel = labeller.newLabel("array-copy-status");
		String subTypeSizeLabel = labeller.newLabel("array-copy-subtype-size");
		String lengthLabel = labeller.newLabel("array-copy-length");
		String loopCounterLabel = labeller.newLabel("array-copy-counter");
		String originArrayMemoryPointer = labeller.newLabel("orinal-array-pointer");
		String newArrayMemoryPointer = labeller.newLabel("new-array-pointer");
		
		int subTypeSize = arrayType.getSubType().getSize();
		
		code.add(Duplicate);
		// Location of original array start
		code.add(Label, beginLabel);
		code.append(originalArray);
		
		// Get the address of original array
		// Store it in the originArrayMemoryPointer
		code.add(Duplicate);
		memoryPointer(code, originArrayMemoryPointer);
		
		// Get the length of array
		code.add(Label, sizeLabel);
		code.append(pushArrayLength(labeller.newLabel("push-array-length1")));
		
		// Copy length as a counter
		code.add(Duplicate);
		createLoopCounter(code, loopCounterLabel);
		
		// length * size = whole size for element part
		code.add(PushI, subTypeSize);
		code.add(Multiply);
		
		// length * size + headSize = whole size for origin array
		// which is also the space need for new array
		code.add(PushI, arrayType.getHeaderSize());
		code.add(Add);
		
		// Get the address for the new array
		code.add(Call, MemoryManager.MEM_MANAGER_ALLOCATE);
		
		// Get the address of the first element in new array
		// And store it in newArrayMemoryPointer
		code.add(Duplicate);
		memoryPointer(code, newArrayMemoryPointer);
		
		code.add(Label, beginHeaderCopyLabel);
		
		// add type identifier of array
		code.add(Label, typeLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getTypeIdentifier());
		code.add(Exchange);
		Macros.writeIOffset(code, 0);
		
		// add status of array
		code.add(Label, statusLabel);
		code.add(Duplicate);
		code.add(PushI, arrayType.getStatus());
		code.add(Exchange);
		Macros.writeIOffset(code, 4);
		
		// add subtype size of array
		code.add(Label, subTypeSizeLabel);
		code.add(Duplicate);
		code.add(PushI, subTypeSize);
		code.add(Exchange);
		Macros.writeIOffset(code, 8);
		
		// add length of array
		code.add(Label, lengthLabel);
		code.add(Duplicate);
		code.add(PushD, originArrayMemoryPointer);
		code.add(LoadI);
		code.append(pushArrayLength(labeller.newLabel("push-array-length2")));
		code.add(Exchange);
		Macros.writeIOffset(code, 12);
		
		code.add(Label, endHeaderCopyLabel);
		
		// move originArrayMemoryPointer to first address of element
		code.add(PushD, originArrayMemoryPointer);
		code.add(Duplicate);
		code.add(LoadI);
		code.add(PushI, arrayType.getHeaderSize());
		code.add(Add);
		code.add(StoreI);
		
		// move newArrayMemoryPointer to address of first element to store
		code.add(PushD, newArrayMemoryPointer);
		code.add(Duplicate);
		code.add(LoadI);
		code.add(PushI, arrayType.getHeaderSize());
		code.add(Add);
		code.add(StoreI);
		
		code.add(Label, beginElementCopyLabel);
		code.add(PushD, loopCounterLabel);
		code.add(LoadI);
		code.add(JumpFalse, endElementCopyLabel);
		
		// Load newArrayMemoryPointer and originArrayMemoryPointer
		// The address they point to is exactly the target address
		code.add(PushD, newArrayMemoryPointer);
		code.add(LoadI);
		code.add(PushD, originArrayMemoryPointer);
		code.add(LoadI);
		
		if(subTypeSize  == 1) {
			code.add(LoadC);
			code.add(StoreC);
		}else if(subTypeSize == 4){
			code.add(LoadI);
			code.add(StoreI);
		}else if(subTypeSize == 8){
			code.add(LoadF);
			code.add(StoreF);
		}
		
		// move originArrayMemoryPointer to next address of element
		code.add(PushD, originArrayMemoryPointer);
		code.add(Duplicate);
		code.add(LoadI);
		code.add(PushI, subTypeSize);
		code.add(Add);
		code.add(StoreI);
		
		// move newArrayMemoryPointer to next address of new element to store
		code.add(PushD, newArrayMemoryPointer);
		code.add(Duplicate);
		code.add(LoadI);
		code.add(PushI, subTypeSize);
		code.add(Add);
		code.add(StoreI);
		
		// Decrement the counter by 1
		Macros.decrementInteger(code, loopCounterLabel);
		code.add(Jump, beginElementCopyLabel);
		code.add(Label, endElementCopyLabel);
		code.add(Label, endLabel);
		
		return code;
	}
	
	public static ASMCodeFragment pushArrayLength(String label){
		ASMCodeFragment code = new ASMCodeFragment(GENERATES_VALUE);
		
		code.add(Label, label);
		Macros.readIOffset(code, 12);
		
		return code;
	}
	
	public static void appendLengthCode(ASMCodeFragment code, ASMCodeFragment lengthOfArray){
		for(ASMCodeChunk chunks : lengthOfArray.chunks){
			for(ASMInstruction instrs: chunks.instructions){
				code.add(instrs);
			}
		}
	}
	
	public static void createLoopCounter(ASMCodeFragment code, String label){
		code.add(DLabel, label);
		code.add(DataI, 0);
		Macros.storeITo(code, label);
	}
	
	public static void memoryPointer(ASMCodeFragment code, String label){
		code.add(DLabel, label);
		code.add(DataI, 0);
		Macros.storeITo(code, label);
	}
}
