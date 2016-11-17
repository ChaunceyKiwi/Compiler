package optimizer;

import java.util.ArrayList;
import java.util.List;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.codeStorage.ASMInstruction;

public class BasicBlock {
	private ASMCodeChunk codeChunk;
	private boolean isTrimmed;
	private int blockIndex;
	private List<Tuple<BasicBlock, String>> inNeighbors;
	private List<Tuple<BasicBlock, String>> outNeighbors;

    public BasicBlock(ASMCodeChunk code, int blockIndex) { 
        this.codeChunk = code;
        this.isTrimmed = false;
        this.inNeighbors = new ArrayList<Tuple<BasicBlock, String>>();
        this.outNeighbors = new ArrayList<Tuple<BasicBlock, String>>();
        this.blockIndex = blockIndex;
    }
    
    public BasicBlock(BasicBlock basicBlock) { 
        this.codeChunk = new ASMCodeChunk();
        this.codeChunk.append(basicBlock.getCodeChunk()); 
        this.isTrimmed = basicBlock.hasBeenTrimed();
        this.inNeighbors = new ArrayList<Tuple<BasicBlock, String>>(basicBlock.getInNeighbors());
        this.outNeighbors = new ArrayList<Tuple<BasicBlock, String>>(basicBlock.getOutNeighbors());
        this.blockIndex = basicBlock.getBlockIndex();
    }
    
    public ASMInstruction getLastInstruction() {
    	return codeChunk.instructions.get(codeChunk.instructions.size() - 1);
    }
    
    public int getBlockIndex() {
    	return blockIndex;
    }
    
    public boolean isInNeighbor(BasicBlock basicBlock) {
		for(Tuple<BasicBlock, String> inNeighbor : this.inNeighbors) {
			if(inNeighbor.x.getBlockIndex() == basicBlock.getBlockIndex()) {
				return true;
			}
		}
		return false;
    }
    
    public boolean isOutNeighbor(BasicBlock basicBlock) {
		for(Tuple<BasicBlock, String> outNeighbor : this.outNeighbors) {
			if(outNeighbor.x.getBlockIndex() == basicBlock.getBlockIndex()) {
				return true;
			}
		}
		return false;
    }
    
    public void addInNeighbors(BasicBlock block, String condition) {
    	inNeighbors.add(new Tuple<BasicBlock, String>(block, condition));
    }
    
    public void updateInNeighbors(List<Tuple<BasicBlock, String>> newInNeighbors) {
    	inNeighbors = newInNeighbors;
    }
    
    public List<Tuple<BasicBlock, String>> getInNeighbors(){
    	return inNeighbors;
    }
    
    public void addOutNeighbors(BasicBlock block, String condition) {
    	outNeighbors.add(new Tuple<BasicBlock, String>(block, condition));
    }
    
    public void updateOutNeighbors(List<Tuple<BasicBlock, String>> newOutNeighbors) {
    	outNeighbors = newOutNeighbors;
    }
    
    public List<Tuple<BasicBlock, String>> getOutNeighbors(){
    	return outNeighbors;
    } 
    
    public void setAsTrimed(Boolean isTrimmed) {
    	this.isTrimmed = isTrimmed;
    }    

    public boolean hasBeenTrimed() {
    	return this.isTrimmed;
    }
    
    public void updateCodeChunk(ASMCodeChunk codeChunk) {
    	this.codeChunk = codeChunk;
    }
    
    public ASMCodeChunk getCodeChunk() {
    	return this.codeChunk;
    }
    
    public boolean hasBranchOutNeighbor() {
    	for(Tuple<BasicBlock, String> outNeighbor : this.outNeighbors) {
    		if(isBranchInstruction(outNeighbor.y)) {
    			return true;
    		}
    	}
    	return false;
    }
    
	private boolean isBranchInstruction(String opcode) {
		return (opcode.equals(ASMOpcode.JumpFalse.toString()) ||
				opcode.equals(ASMOpcode.JumpTrue.toString()) ||
				opcode.equals(ASMOpcode.JumpNeg.toString()) ||
				opcode.equals(ASMOpcode.JumpPos.toString()) ||
				opcode.equals(ASMOpcode.JumpFNeg.toString()) ||
				opcode.equals(ASMOpcode.JumpFPos.toString()) ||
				opcode.equals(ASMOpcode.JumpFZero.toString()));				
	}
    
    @Override
    public String toString(){
    	return "BasicBlock" + blockIndex;
    }
}
