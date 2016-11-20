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
  private List<Tuple<BasicBlock, ASMOpcode>> inNeighbors;
  private List<Tuple<BasicBlock, ASMOpcode>> outNeighbors;

  public BasicBlock(ASMCodeChunk code, int blockIndex) {
    this.codeChunk = code;
    this.isTrimmed = false;
    this.inNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
    this.outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
    this.blockIndex = blockIndex;
  }

  public BasicBlock(BasicBlock basicBlock) {
    this.codeChunk = new ASMCodeChunk();
    this.codeChunk.append(basicBlock.getCodeChunk());
    this.isTrimmed = basicBlock.hasBeenTrimed();
    this.inNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>(basicBlock.getInNeighbors());
    this.outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>(basicBlock.getOutNeighbors());
    this.blockIndex = basicBlock.getBlockIndex();
  }

  public ASMInstruction getLastInstruction() {
    return codeChunk.instructions.get(codeChunk.instructions.size() - 1);
  }

  public int getBlockIndex() {
    return blockIndex;
  }

  public void setBlockIndex(int index) {
    this.blockIndex = index;
  }

  public boolean isInNeighbor(BasicBlock basicBlock) {
    for (Tuple<BasicBlock, ASMOpcode> inNeighbor : this.inNeighbors) {
      if (inNeighbor.x.getBlockIndex() == basicBlock.getBlockIndex()) {
        return true;
      }
    }
    return false;
  }

  public boolean isOutNeighbor(BasicBlock basicBlock) {
    for (Tuple<BasicBlock, ASMOpcode> outNeighbor : this.outNeighbors) {
      if (outNeighbor.x.getBlockIndex() == basicBlock.getBlockIndex()) {
        return true;
      }
    }
    return false;
  }

  public void addInNeighbors(BasicBlock block, ASMOpcode condition) {
    inNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(block, condition));
  }

  public void updateInNeighbors(List<Tuple<BasicBlock, ASMOpcode>> newInNeighbors) {
    inNeighbors = newInNeighbors;
  }

  public List<Tuple<BasicBlock, ASMOpcode>> getInNeighbors() {
    return inNeighbors;
  }

  public void addOutNeighbors(BasicBlock block, ASMOpcode condition) {
    outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(block, condition));
  }

  public void updateOutNeighbors(List<Tuple<BasicBlock, ASMOpcode>> newOutNeighbors) {
    outNeighbors = newOutNeighbors;
  }

  public List<Tuple<BasicBlock, ASMOpcode>> getOutNeighbors() {
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
    for (Tuple<BasicBlock, ASMOpcode> outNeighbor : this.outNeighbors) {
      if (isBranchInstruction(outNeighbor.y)) {
        return true;
      }
    }
    return false;
  }

  private boolean isBranchInstruction(ASMOpcode opcode) {
    return opcode == ASMOpcode.JumpFalse || opcode == ASMOpcode.JumpTrue
        || opcode == ASMOpcode.JumpNeg || opcode == ASMOpcode.JumpPos
        || opcode == ASMOpcode.JumpFNeg || opcode == ASMOpcode.JumpFPos
        || opcode == ASMOpcode.JumpFZero;
  }

  @Override
  public String toString() {
    return "BasicBlock" + blockIndex;
  }
}
