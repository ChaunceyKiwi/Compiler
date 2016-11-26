package optimizer;

import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.GENERATES_VOID;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMInstruction;
import asmCodeGenerator.codeStorage.ASMOpcode;

public class BasicBlockManager {
  private List<BasicBlock> blocks;
  private List<BasicBlock> startBlocks;
  private int sizeInBlocks = 0;

  private Set<Tuple<String, Integer>> labelSet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> jumpSet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> callSet = new HashSet<Tuple<String, Integer>>();
  private Set<Tuple<String, Integer>> pushDSet = new HashSet<Tuple<String, Integer>>();
  private Set<Triplet<ASMOpcode, String, Integer>> branchSet =
      new HashSet<Triplet<ASMOpcode, String, Integer>>();
  private Set<Integer> programStartSet = new HashSet<Integer>();
  private Set<Integer> blockStartSet = new HashSet<Integer>();
  private Set<Integer> blockEndSet = new HashSet<Integer>();
  private Set<Triplet<Integer, Integer, Integer>> blockSet =
      new HashSet<Triplet<Integer, Integer, Integer>>();
  private Set<Triplet<Integer, Integer, ASMOpcode>> linkSet =
      new HashSet<Triplet<Integer, Integer, ASMOpcode>>();
  private Set<Triplet<Integer, Integer, BasicBlock>> blockRange =
      new HashSet<Triplet<Integer, Integer, BasicBlock>>();
  private int distanceTable[][];

  public BasicBlockManager() {
    this.blocks = new ArrayList<BasicBlock>();
    this.startBlocks = new ArrayList<BasicBlock>();
  }

  public void addStartBlock(BasicBlock block) {
    this.startBlocks.add(block);
    block.setEntryBlock(block);
  }

  public List<BasicBlock> getStartBlock(BasicBlock block) {
    return startBlocks;
  }

  public void add(BasicBlock block) {
    this.blocks.add(block);
    this.sizeInBlocks++;
  }

  // Builder function
  public void generateBasicBlocks(ASMCodeFragment fragment) {
    buildLabelSet(fragment);
    buildJumpSet(fragment);
    buildBranchSet(fragment);
    buildCallSet(fragment);
    buildPushDSet(fragment);
    buildBlockStartEndSet();
    buildBlockSet(fragment);
    buildBlocks(fragment);
    sortBlocks();
    trimBlocks();
    setNeighborForBlocks();
    optimizeUntilConverge();
    calculateDominators();
    assignIndicesToBlocks();
    setLoopHeader();
  }

  public void optimizeUntilConverge() {
    int size;
    do {
      size = blocks.size();
      performOptimizationUnit();
    } while (blocks.size() != size);
  }

  public void performOptimizationUnit() {
    unreachableCodeElimination();
    blockMerge();
    cloningToSimplify();
    branchElimination();
    updateInnerNeighbors();
  }

  public void setLoopHeader() {
    for (BasicBlock basicBlock : blocks) {
      for (Tuple<BasicBlock, ASMOpcode> outNeighbor : basicBlock.getOutNeighbors()) {
        if (basicBlock.isDominatedBy(outNeighbor.x)) {
          outNeighbor.x.setAsLoopHeader();
        }
      }
    }
  }
  
  public boolean isStartBlock(BasicBlock basicBlock) {
    for (BasicBlock startBlock : startBlocks) {
      if (startBlock == basicBlock) {
        return true;
      }
    }
    return false;
  }
  

  public void calculateDominators() {
    // set the dominitor of start block as itself
    for (BasicBlock startBlock : startBlocks) {
      startBlock.addDominitors(startBlock);
    }
    
    // for all other nodes, set all other nodes as dominitor
    for (BasicBlock basicBlock1 : blocks) {
      if(!isStartBlock(basicBlock1)) {
        for (BasicBlock basicBlock2 : blocks) {
          basicBlock1.addDominitors(basicBlock2);
        }
      }
    }
    
    // iteratively eliminate nodes that are not dominators
    boolean hasChanged = true;
    while (hasChanged) {
      hasChanged = false;
      for (BasicBlock basicBlock : blocks) {
        Set<BasicBlock> intersectionSet = new HashSet<BasicBlock>();

        for (Tuple<BasicBlock, ASMOpcode> inNeighbor : basicBlock.getInNeighbors()) {
          Set<BasicBlock> dominitors = inNeighbor.x.getDominitors();
          if (intersectionSet.isEmpty()) {
            intersectionSet = new HashSet<BasicBlock>(dominitors);
          } else {
            intersectionSet = blocksIntersction(intersectionSet, dominitors);
          }
        }
        intersectionSet.add(basicBlock);
        if (!intersectionSet.equals(basicBlock.getDominitors())) {
          basicBlock.updateDominitors(intersectionSet);
          hasChanged = true;
        }
      }
    }
  }

  public Set<BasicBlock> blocksIntersction(Set<BasicBlock> set1, Set<BasicBlock> set2) {
    Set<BasicBlock> intersectionSet = new HashSet<BasicBlock>();
    intersectionSet.addAll(set1);
    intersectionSet.retainAll(set2);
    return intersectionSet;
  }

  public ASMCodeFragment printAllChunksInBasicBlocks() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);

    for (BasicBlock basicBlock : blocks) {
      code.add(ASMOpcode.Label, basicBlock.getPrefix() + basicBlock.getBlockIndex());
      code.chunks.add(basicBlock.getCodeChunk());
      for (Tuple<BasicBlock, ASMOpcode> outNeighbor : basicBlock.getOutNeighbors()) {
        int index = outNeighbor.x.getBlockIndex();
        code.add(outNeighbor.y, outNeighbor.x.getPrefix() + index);
      }
    }
    return code;
  }

  public void assignIndicesToBlocks() {
    int blockIndex = 1;
    sortBlocks();
    for (BasicBlock basicBlock : blocks) {
      basicBlock.setBlockIndex(blockIndex++);
    }
  }

  public void updateInnerNeighbors() {
    for (BasicBlock basicBlock : blocks) {
      List<Tuple<BasicBlock, ASMOpcode>> neighborsToRemove =
          new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
      for (Tuple<BasicBlock, ASMOpcode> inNeighbor : basicBlock.getInNeighbors()) {
        if (!blocks.contains(inNeighbor.x) || !inNeighbor.x.isOutNeighbor(basicBlock)) {
          neighborsToRemove.add(inNeighbor);
        }
      }
      for (Tuple<BasicBlock, ASMOpcode> neighborToRemove : neighborsToRemove) {
        basicBlock.getInNeighbors().remove(neighborToRemove);
      }
    }
  }

  public void branchElimination() {
    for (BasicBlock basicBlock : blocks) {
      if (basicBlock.hasBranchOutNeighbor()) {
        List<Tuple<BasicBlock, ASMOpcode>> outNeighbors = basicBlock.getOutNeighbors();
        List<Tuple<BasicBlock, ASMOpcode>> neighborsToRemove =
            new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
        for (Tuple<BasicBlock, ASMOpcode> outNeighbor : outNeighbors) {
          ASMInstruction instr = basicBlock.getLastInstruction();
          ASMOpcode branch = outNeighbor.y;
          
          if (instr == null) {
            break;
          }
          
          ASMOpcode opcode = instr.getOpcode();
          
          if(opcode== ASMOpcode.PushI) {
            if (branch == ASMOpcode.JumpFalse) {
              if (Integer.parseInt(instr.getArgument().toString()) == 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              } else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            } else if (branch == ASMOpcode.JumpTrue) {
              if (Integer.parseInt(instr.getArgument().toString()) != 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              } else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            } else if (branch == ASMOpcode.JumpNeg) {
              if (Integer.parseInt(instr.getArgument().toString()) < 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              } else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            } else if (branch == ASMOpcode.JumpPos) {
              if (Integer.parseInt(instr.getArgument().toString()) > 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              }else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            }
          }else if(instr.getOpcode() == ASMOpcode.PushF) {
            if (branch == ASMOpcode.JumpFNeg) {
              if (Float.parseFloat(instr.getArgument().toString()) < 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              } else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            } else if (branch == ASMOpcode.JumpFPos) {
              if (Float.parseFloat(instr.getArgument().toString()) > 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              } else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            } else if (branch == ASMOpcode.JumpFZero) {
              if (Float.parseFloat(instr.getArgument().toString()) == 0) {
                basicBlock.getCodeChunk().remove(instr);
                outNeighbors = new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
                outNeighbors.add(new Tuple<BasicBlock, ASMOpcode>(outNeighbor.x, ASMOpcode.Jump));
                basicBlock.updateOutNeighbors(outNeighbors);
                updateInnerNeighbors();
              } else {
                basicBlock.getCodeChunk().remove(instr);
                neighborsToRemove.add(outNeighbor);
                updateInnerNeighbors();
              }
            }
          } else if(instr.getOpcode() == ASMOpcode.Nop) {
            basicBlock.getCodeChunk().remove(instr);
          }
        }

        for (Tuple<BasicBlock, ASMOpcode> neighborToRemove : neighborsToRemove) {
          outNeighbors.remove(neighborToRemove);
        }
      }
    }
  }

  public void cloningToSimplify() {
    List<BasicBlock> blocksToBeRemoved = new ArrayList<BasicBlock>();

    for (BasicBlock basicBlock : blocks) {
      // Find a empty block with a branch end
      if (basicBlock.getCodeChunk().instructions.size() == 0 && basicBlock.hasBranchOutNeighbor()) {
        List<Tuple<BasicBlock, ASMOpcode>> inNeighbors = basicBlock.getInNeighbors();
        // Two or more innner neighbors, all of which have only one out-neighbor
        if (inNeighbors.size() >= 2 && allInNeighborsHaveOnlyOneOutNeighbor(inNeighbors)) {
          blocksToBeRemoved.add(basicBlock);
          for (Tuple<BasicBlock, ASMOpcode> inNeighbor : inNeighbors) {
            BasicBlock basicBlockCopy = new BasicBlock(basicBlock);
            AppendBlock(inNeighbor.x, basicBlockCopy);
          }

          for (Tuple<BasicBlock, ASMOpcode> outNeighbor : basicBlock.getOutNeighbors()) {
            List<Tuple<BasicBlock, ASMOpcode>> neighborsToRemove =
                new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
            for (Tuple<BasicBlock, ASMOpcode> inNeighbor : outNeighbor.x.getInNeighbors()) {
              if (inNeighbor.x.getBlockIndex() == basicBlock.getBlockIndex()) {
                neighborsToRemove.add(inNeighbor);
              }
            }
            for (Tuple<BasicBlock, ASMOpcode> inNeighbor : neighborsToRemove) {
              outNeighbor.x.getInNeighbors().remove(inNeighbor);
            }
          }
        }
      }
    }
    for (BasicBlock block : blocksToBeRemoved) {
      this.blocks.remove(block);
    }
  }

  public boolean allInNeighborsHaveOnlyOneOutNeighbor(
      List<Tuple<BasicBlock, ASMOpcode>> inNeighbors) {
    for (Tuple<BasicBlock, ASMOpcode> inNeighbor : inNeighbors) {
      if (inNeighbor.x.getOutNeighbors().size() != 1) {
        return false;
      }
    }
    return true;
  }

  public void blockMerge() {
    boolean flag = true;

    while (flag) {
      flag = false;
      for (BasicBlock basicBlock : blocks) {
        List<Tuple<BasicBlock, ASMOpcode>> inNeighbors = basicBlock.getInNeighbors();
        List<Tuple<BasicBlock, ASMOpcode>> outNeighbors = basicBlock.getOutNeighbors();
        if (inNeighbors.size() == 1) {
          BasicBlock inNeighbor = inNeighbors.get(0).x;
          if (inNeighbor.getOutNeighbors().size() == 1) {
            MergeBlock(inNeighbor, basicBlock);
            flag = true;
            break;
          }
        } else if (outNeighbors.size() == 1) {
          BasicBlock outNeighbor = outNeighbors.get(0).x;
          if (outNeighbor.getInNeighbors().size() == 1) {
            MergeBlock(basicBlock, outNeighbor);
            flag = true;
            break;
          }
        }
      }
    }
  }

  public void MergeBlock(BasicBlock basicBlock1, BasicBlock basicBlock2) {
    AppendBlock(basicBlock1, basicBlock2);
    blocks.remove(basicBlock2);
  }

  public void AppendBlock(BasicBlock basicBlock1, BasicBlock basicBlock2) {
    basicBlock1.updateOutNeighbors(basicBlock2.getOutNeighbors());
    for (Tuple<BasicBlock, ASMOpcode> outNeighbor : basicBlock1.getOutNeighbors()) {
      List<Tuple<BasicBlock, ASMOpcode>> neighborsToAdd =
          new ArrayList<Tuple<BasicBlock, ASMOpcode>>();
      for (Tuple<BasicBlock, ASMOpcode> innerNeighbor : outNeighbor.x.getInNeighbors()) {
        if (innerNeighbor.x.getBlockIndex() == basicBlock2.getBlockIndex()) {
          neighborsToAdd.add(new Tuple<BasicBlock, ASMOpcode>(basicBlock1, innerNeighbor.y));
        }
      }
      for (Tuple<BasicBlock, ASMOpcode> neighborToAdd : neighborsToAdd) {
        outNeighbor.x.getInNeighbors().add(neighborToAdd);
      }
    }
    basicBlock1.setAsTrimed(basicBlock1.hasBeenTrimed() && basicBlock2.hasBeenTrimed());
    basicBlock1.getCodeChunk().append(basicBlock2.getCodeChunk());
  }



  public void unreachableCodeElimination() {
    buildRelationTable();
    calculateBlockDistance();
    Set<BasicBlock> blocksToBeRemoved = new HashSet<BasicBlock>();
    Set<BasicBlock> blocksToBeRemovedInLastLoop = null;

    for (BasicBlock startBlock : startBlocks) {
      int startIndex = startBlock.getBlockIndex() - 1;
      blocksToBeRemoved.clear();

      for (int i = 0; i < sizeInBlocks; i++) {
        if (distanceTable[startIndex][i] == Integer.MAX_VALUE) {
          for (BasicBlock basicBlock : blocks) {
            if (basicBlock.getBlockIndex() - 1 == i) {
              blocksToBeRemoved.add(basicBlock);
            }
          }
        } else {
          for (BasicBlock basicBlock : blocks) {
            if (basicBlock.getBlockIndex() - 1 == i) {
              basicBlock.setEntryBlock(startBlock);
            }
          }
        }
      }

      if (blocksToBeRemovedInLastLoop != null) {
        blocksToBeRemoved.retainAll(blocksToBeRemovedInLastLoop);
      }

      blocksToBeRemovedInLastLoop = new HashSet<BasicBlock>(blocksToBeRemoved);
    }

    for (BasicBlock block : blocksToBeRemoved) {
      this.blocks.remove(block);
    }
  }

  public void trimBlocks() {
    for (BasicBlock basicBlock : blocks) {
      ASMCodeChunk trimmedCodeChunk = new ASMCodeChunk();
      ASMCodeChunk asmCodeChunk = basicBlock.getCodeChunk();
      boolean isStart = true;

      // Trim jump and branch at the end
      for (ASMInstruction instr : asmCodeChunk.instructions) {
        // Skip first few labels
        if (isStart && (instr.getOpcode() == ASMOpcode.Label)
            && (!isCalledToLabel(instr.getArgument().toString()))
            && (!isPushDLabel(instr.getArgument().toString()))) {
          continue;
        } else {
          isStart = false;
        }

        if (instr.getOpcode() != ASMOpcode.Jump && (!isBranchInstruction(instr)) && (!isStart)) {
          trimmedCodeChunk.add(instr);
        }
      }
      basicBlock.updateCodeChunk(trimmedCodeChunk);
      basicBlock.setAsTrimed(true);
    }
  }

  public boolean isCalledToLabel(String label) {
    for (Tuple<String, Integer> call : callSet) {
      if (label.equals(call.x)) {
        return true;
      }
    }
    return false;
  }

  public boolean isPushDLabel(String label) {
    for (Tuple<String, Integer> call : pushDSet) {
      if (label.equals(call.x)) {
        return true;
      }
    }
    return false;
  }

  public void buildRelationTable() {
    distanceTable = new int[sizeInBlocks][sizeInBlocks];
    for (int i = 0; i < sizeInBlocks; i++) {
      for (int j = 0; j < sizeInBlocks; j++) {
        if (i == j) {
          distanceTable[i][j] = 0;
        } else {
          distanceTable[i][j] = Integer.MAX_VALUE;
        }
      }
    }

    for (BasicBlock basicBlock1 : blocks) {
      for (Tuple<BasicBlock, ASMOpcode> tuple : basicBlock1.getInNeighbors()) {
        distanceTable[tuple.x.getBlockIndex() - 1][basicBlock1.getBlockIndex() - 1] = 1;
      }
      for (Tuple<BasicBlock, ASMOpcode> tuple : basicBlock1.getOutNeighbors()) {
        distanceTable[basicBlock1.getBlockIndex() - 1][tuple.x.getBlockIndex() - 1] = 1;
      }
    }
  }

  private void buildBlocks(ASMCodeFragment fragment) {
    for (Triplet<Integer, Integer, Integer> tuple : blockSet) {
      BasicBlock block = new BasicBlock(getCodeInRange(fragment, tuple.x, tuple.y), tuple.z);
      this.add(block);
      blockRange.add(new Triplet<Integer, Integer, BasicBlock>(tuple.x, tuple.y, block));
      if (programStartSet.contains(tuple.x)) {
        this.addStartBlock(block);
      }
    }
  }

  private void sortBlocks() {
    for (int i = blocks.size() - 1; i > 0; i--)
      for (int j = 0; j < i; j++) {
        if (blocks.get(j).getBlockIndex() > blocks.get(j + 1).getBlockIndex()) {
          BasicBlock temp = blocks.get(j);
          blocks.set(j, blocks.get(j + 1));
          blocks.set(j + 1, temp);
        }
      }
  }

  private void setNeighborForBlocks() {
    for (Triplet<Integer, Integer, ASMOpcode> link : linkSet) {
      BasicBlock fromBlock = getBasicBlockFromLineNumber(link.x);
      BasicBlock toBlock = getBasicBlockFromLineNumber(link.y);
      fromBlock.addOutNeighbors(toBlock, link.z);
      toBlock.addInNeighbors(fromBlock, link.z);
    }
  }

  private BasicBlock getBasicBlockFromLineNumber(int lineNumber) {
    for (Triplet<Integer, Integer, BasicBlock> range : blockRange) {
      if (lineNumber >= range.x && lineNumber <= range.y) {
        return range.z;
      }
    }
    return null;
  }

  private ASMCodeChunk getCodeInRange(ASMCodeFragment fragment, int start, int end) {
    int lineNumCount = 1;
    ASMCodeChunk codeInRange = new ASMCodeChunk();

    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (lineNumCount >= start && lineNumCount <= end && instruction.getOpcode() != ASMOpcode.Nop) {
          codeInRange.add(instruction);
        }
        lineNumCount++;
      }
    }
    return codeInRange;
  }

  private void buildLabelSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.Label) {
          labelSet
              .add(new Tuple<String, Integer>((String) instruction.getArgument(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildJumpSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        
        if(lineNumCount == 175) {
          lineNumCount = lineNumCount + 1 - 1;
        }
        
        if (instruction.getOpcode() == ASMOpcode.Jump || instruction.getOpcode() == ASMOpcode.Halt
            || instruction.getOpcode() == ASMOpcode.Return
            || instruction.getOpcode() == ASMOpcode.PopPC) {
          jumpSet.add(new Tuple<String, Integer>((String) instruction.getArgument(), lineNumCount));
          blockEndSet.add(lineNumCount);
          blockStartSet.add(lineNumCount + 1);
        }
        lineNumCount++;
      }
    }
  }

  private void buildBranchSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    boolean previousIsBranch = false;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (isBranchInstruction(instruction)) {
          branchSet.add(new Triplet<ASMOpcode, String, Integer>(instruction.getOpcode(),
              (String) instruction.getArgument(), lineNumCount));
          previousIsBranch = true;
        } else {
          if (previousIsBranch && instruction.getOpcode() != ASMOpcode.Jump) {
            blockEndSet.add(lineNumCount - 1);
            blockStartSet.add(lineNumCount);
          }
          previousIsBranch = false;
        }
        lineNumCount++;
      }
    }
  }

  private void buildPushDSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.PushD) {
          callSet.add(new Tuple<String, Integer>((String) instruction.getArgument(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }

  private void buildCallSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.Call) {
          callSet.add(new Tuple<String, Integer>((String) instruction.getArgument(), lineNumCount));
          blockEndSet.add(lineNumCount);
          blockStartSet.add(lineNumCount + 1);
        }
        lineNumCount++;
      }
    }
  }

  private void buildBlockStartEndSet() {
    // The first instruction is always a block start
    blockStartSet.add(1);

    // Any jumpToInstruction is a block start
    // And the instruction before that is a block end
    for (Triplet<ASMOpcode, String, Integer> branch : branchSet) {
      String branchKey = branch.y;
      for (Tuple<String, Integer> label : labelSet) {
        String labelKey = label.x;
        if (labelKey.equals(branchKey)) {
          linkSet.add(new Triplet<Integer, Integer, ASMOpcode>(branch.z, label.y, branch.x));
          blockStartSet.add(label.y);
          blockEndSet.add(label.y - 1);
        }
      }
    }

    for (Tuple<String, Integer> jump : jumpSet) {
      String jumpKey = jump.x;
      for (Tuple<String, Integer> label : labelSet) {
        String labelKey = label.x;
        if (labelKey.equals(jumpKey)) {
          linkSet.add(new Triplet<Integer, Integer, ASMOpcode>(jump.y, label.y, ASMOpcode.Jump));
          blockStartSet.add(label.y);
          blockEndSet.add(label.y - 1);
        }
      }
    }

    for (Tuple<String, Integer> call : callSet) {
      String callKey = call.x;
      blockStartSet.add(call.y + 1);
      blockEndSet.add(call.y);

      // First line is the program start
      programStartSet.add(1);
      for (Tuple<String, Integer> label : labelSet) {
        String labelKey = label.x;
        if (labelKey.equals(callKey)) {
          programStartSet.add(label.y);
          blockStartSet.add(label.y);
        }
      }
    }
  }

  private void buildBlockSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    int blockIndex = 1;
    int begin = 0;
    int end = 0;
    boolean previousIsJump = false;
    int previousState = 0; // -1 as end, 1 as start, 0 as none, 2 as both
    int currentState = 0; // -1 as end, 1 as start, 0 as none, 2 as both

    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        currentState = 0;
        
        if (blockStartSet.contains(lineNumCount)) {
          currentState = 1;
          if(previousState == 1 || previousState == 2) {
            blockSet.add(new Triplet<Integer, Integer, Integer>(lineNumCount-1, lineNumCount-1, blockIndex++));
          }
          if (!previousIsJump && lineNumCount > 1) {
            linkSet.add(new Triplet<Integer, Integer, ASMOpcode>(lineNumCount - 1, lineNumCount,
                ASMOpcode.Jump));
          }
          begin = lineNumCount;
        }
        if (blockEndSet.contains(lineNumCount)) {
          if(currentState == 1) {
            currentState = 2;
          }else {
            currentState = -1;
          }
          if(previousState == 2 || previousState == -1) {
            blockSet.add(new Triplet<Integer, Integer, Integer>(lineNumCount, lineNumCount, blockIndex++));
          }
          end = lineNumCount;
          if (blockStartSet.contains(begin)) {
            blockSet.add(new Triplet<Integer, Integer, Integer>(begin, end, blockIndex++));
            begin++;
            end++;
          }
        }
        previousIsJump = isInJumpSet(lineNumCount);
        lineNumCount++;
        previousState = currentState;
      }
    }
  }

  private boolean isInJumpSet(int lineNumber) {
    for (Tuple<String, Integer> jump : jumpSet) {
      if (jump.y == lineNumber)
        return true;
    }
    return false;
  }

  private boolean isBranchInstruction(ASMInstruction instruction) {
    return instruction.getOpcode() == ASMOpcode.JumpFalse
        || instruction.getOpcode() == ASMOpcode.JumpTrue
        || instruction.getOpcode() == ASMOpcode.JumpNeg
        || instruction.getOpcode() == ASMOpcode.JumpPos
        || instruction.getOpcode() == ASMOpcode.JumpFNeg
        || instruction.getOpcode() == ASMOpcode.JumpFPos
        || instruction.getOpcode() == ASMOpcode.JumpFZero;
  }

  private void calculateBlockDistance() {
    for (int k = 0; k < sizeInBlocks; k++) {
      for (int i = 0; i < sizeInBlocks; i++) {
        for (int j = 0; j < sizeInBlocks; j++) {
          int distanceIJ = distanceTable[i][j];
          int distanceIK = distanceTable[i][k];
          int distanceKJ = distanceTable[k][j];
          if (distanceIJ > distanceIK && distanceIJ > distanceKJ) {
            if (distanceIJ > distanceIK + distanceKJ) {
              distanceTable[i][j] = distanceIK + distanceKJ;
            }
          }
        }
      }
    }
  }
}
