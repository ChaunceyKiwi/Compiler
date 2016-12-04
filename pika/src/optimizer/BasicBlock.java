package optimizer;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMOpcode;
import asmCodeGenerator.codeStorage.ASMInstruction;

public class BasicBlock {
  private ASMCodeChunk codeChunk;
  private BasicBlock entryBlock;
  private boolean isTrimmed;
  private int blockIndex;
  private List<Tuple<BasicBlock, ASMOpcode>> inNeighbors;
  private List<Tuple<BasicBlock, ASMOpcode>> outNeighbors;
  private Set<BasicBlock> dominitors;
  private boolean isLoopHeader;

  public BasicBlock(ASMCodeChunk code, int blockIndex) {
    this.codeChunk = code;
    this.isTrimmed = false;
    this.entryBlock = null;
    this.isLoopHeader = false;
    this.inNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
    this.outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
    this.dominitors = new HashSet<BasicBlock>();
    this.blockIndex = blockIndex;
  }

  public BasicBlock(BasicBlock basicBlock) {
    this.codeChunk = new ASMCodeChunk();
    this.codeChunk.append(basicBlock.getCodeChunk());
    this.isTrimmed = basicBlock.hasBeenTrimed();
    this.entryBlock = null;
    this.isLoopHeader = false;
    this.inNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>(basicBlock.getInNeighbors());
    this.outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>(basicBlock.getOutNeighbors());
    this.dominitors = new HashSet<BasicBlock>();
    this.blockIndex = basicBlock.getBlockIndex();
  }

  public void setAsLoopHeader() {
    this.isLoopHeader = true;
  }
  
  public Set<String> getPushDLabel() {
    Set<String> pushDSet = new HashSet<String>();
    for (ASMInstruction instr : this.codeChunk.instructions) {
      if (instr.getOpcode() == ASMOpcode.PushD) {
        pushDSet.add(instr.getArgument().toString());
      }
    }
    return pushDSet;
  }

  public String getPrefix() {
    if (this.isLoopHeader) {
      return "basicBlockHeader-";
    } else {
      return "basicBlock-";
    }
  }

  public boolean isLoopHeader() {
    return this.isLoopHeader;
  }

  public BasicBlock getEntryBlock() {
    return this.entryBlock;
  }

  public void setEntryBlock(BasicBlock basicBlock) {
    this.entryBlock = basicBlock;
  }

  public boolean isDominatedBy(BasicBlock basicBlock) {
    for (BasicBlock dominitor : this.dominitors) {
      if (dominitor == basicBlock) {
        return true;
      }
    }
    return false;
  }

  public void addDominitors(BasicBlock basicBlock) {
    this.dominitors.add(basicBlock);
  }

  public Set<BasicBlock> getDominitors() {
    return this.dominitors;
  }

  public void updateDominitors(Set<BasicBlock> dominitors) {
    this.dominitors = dominitors;
  }

  public ASMInstruction getLastInstruction() {
    if (codeChunk.instructions.size() > 0)
      return codeChunk.instructions.get(codeChunk.instructions.size() - 1);
    else
      return null;
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
    sortOutNeighbors();
  }

  public void updateOutNeighbors(List<Tuple<BasicBlock, ASMOpcode>> newOutNeighbors) {
    outNeighbors = newOutNeighbors;
    sortOutNeighbors();
  }

  public void sortOutNeighbors() {
    for (int i = outNeighbors.size() - 1; i > 0; i--) {
      for (int j = 0; j < i; j++) {
        ASMOpcode opcode = outNeighbors.get(j).y;
        if (opcode == ASMOpcode.Jump) {
          Tuple<BasicBlock, ASMOpcode> temp = outNeighbors.get(j);
          outNeighbors.set(j, outNeighbors.get(j + 1));
          outNeighbors.set(j + 1, temp);
        }
      }
    }
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
