package optimizer;

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
	private BasicBlock startBlock;
	
	private static Set<Tuple<String, Integer>> labelSet = new HashSet<Tuple<String,Integer>>();
	private static Set<Tuple<String, Integer>> jumpSet  = new HashSet<Tuple<String,Integer>>();
	private static Set<Triplet<String, String, Integer>> branchSet  = new HashSet<Triplet<String, String, Integer>>();
	private static Set<Integer> blockStartSet = new HashSet<Integer>();
	private static Set<Integer> blockEndSet = new HashSet<Integer>();
	private static Set<Tuple<Integer,Integer>> blockSet = new HashSet<Tuple<Integer,Integer>>();
	private static Set<Triplet<Integer, Integer, String>> linkSet  = new HashSet<Triplet<Integer, Integer, String>>();
	private static Set<Triplet<Integer, Integer, BasicBlock>> blockRange  = new HashSet<Triplet<Integer, Integer, BasicBlock>>();

	
	public BasicBlockManager() {
		this.blocks = new ArrayList<BasicBlock>();
		this.startBlock = null;
	}
	
	public void setStartBlock(BasicBlock block) {
		this.startBlock = block;
	}
	
	public BasicBlock getStartBlock(BasicBlock block) {
		return startBlock;
	}
	
	public void add(BasicBlock block) {
		this.blocks.add(block);
	}
	
	// Builder function
	public void generateBasicBlocks(ASMCodeFragment fragment) {
		buildLabelSet(fragment);
		buildJumpSet(fragment);
		buildBranchSet(fragment);
		buildBlockStartEndSet();
		buildBlockSet(fragment);
		buildBlocks(fragment);
		setNeighbourForBlocks();
	}
	
	private void buildBlocks(ASMCodeFragment fragment) {
		for(Tuple<Integer,Integer> tuple : blockSet) {
			BasicBlock block = new BasicBlock(getCodeInRange(fragment, tuple.x, tuple.y));
			this.add(block);
			blockRange.add(new Triplet<Integer, Integer, BasicBlock>(tuple.x, tuple.y, block));
			if(tuple.x == 1) {
				this.setStartBlock(block);
			}
		}
	}
	
	private void setNeighbourForBlocks() {
		for(Triplet<Integer, Integer, String> link : linkSet) {
			BasicBlock fromBlock = getBasicBlockFromLineNumber(link.x);
			BasicBlock toBlock = getBasicBlockFromLineNumber(link.y);
			fromBlock.addOutNeighbors(toBlock, link.z);
			toBlock.addInNeighbors(fromBlock, link.z);
		}
	}
	
	private BasicBlock getBasicBlockFromLineNumber(int lineNumber) {
		for(Triplet<Integer, Integer, BasicBlock> range : blockRange) {
			if(lineNumber >= range.x && lineNumber <= range.y) {
				return range.z;
			}
		}
		return null;
	}
	
	private ASMCodeChunk getCodeInRange(ASMCodeFragment fragment, int start, int end) {
		int lineNumCount = 1;
		ASMCodeChunk codeInRange = new ASMCodeChunk();

		for(int i = 0; i < fragment.chunks.size(); i++){
			for(int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				if(lineNumCount >= start && lineNumCount <= end) {
					codeInRange.add(instruction);
				}
				lineNumCount++;
			}
		}
		return codeInRange;
	}
	
	private void buildLabelSet(ASMCodeFragment fragment) {
		int lineNumCount = 1;
		for(int i = 0; i < fragment.chunks.size(); i++){
			for(int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				if(instruction.getOpcode() == ASMOpcode.Label) {
					labelSet.add(new Tuple<String,Integer>((String)instruction.getArgument(), lineNumCount));
				}
				lineNumCount++;
			}
		}
	}
	
	private void buildJumpSet(ASMCodeFragment fragment) {
		int lineNumCount = 1;
		for(int i = 0; i < fragment.chunks.size(); i++){
			for(int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				if(instruction.getOpcode() == ASMOpcode.Jump || instruction.getOpcode() == ASMOpcode.Halt) {
					jumpSet.add(new Tuple<String,Integer>((String)instruction.getArgument(), lineNumCount));
					blockEndSet.add(lineNumCount);
					blockStartSet.add(lineNumCount+1);
				}
				lineNumCount++;
			}
		}
	}
	
	private void buildBranchSet(ASMCodeFragment fragment) {
		int lineNumCount = 1;
		boolean previousIsBranch = false;
		for(int i = 0; i < fragment.chunks.size(); i++){
			for(int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				if(isBranchInstruction(instruction)) {
					branchSet.add(new Triplet<String, String,Integer>
					(instruction.getOpcode().toString(), (String)instruction.getArgument(), lineNumCount));
					previousIsBranch = true;
				}else {
					if(previousIsBranch && instruction.getOpcode() != ASMOpcode.Jump) {
						blockEndSet.add(lineNumCount-1);
						blockStartSet.add(lineNumCount);
					}
					previousIsBranch = false;
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
		for(Triplet<String, String, Integer> branch : branchSet) {
			String branchKey = branch.y;
			for(Tuple<String, Integer> label : labelSet) {
				String labelKey = label.x;
				if(labelKey.equals(branchKey)) {
					linkSet.add(new Triplet<Integer, Integer, String>(branch.z, label.y, branch.x));
					blockStartSet.add(label.y);
					blockEndSet.add(label.y - 1);
				}
			}
		}
		
		for(Tuple<String, Integer> jump : jumpSet) {
			String jumpKey = jump.x;
			for(Tuple<String, Integer> label : labelSet) {
				String labelKey = label.x;
				if(labelKey.equals(jumpKey)) {
					linkSet.add(new Triplet<Integer, Integer, String>(jump.y, label.y, "Jump"));
					blockStartSet.add(label.y);
					blockEndSet.add(label.y - 1);
				}
			}
		}
	}
	
	private void buildBlockSet(ASMCodeFragment fragment) {
		int lineNumCount = 1;
		int begin = 0;
		int end = 0;
		boolean previousIsJump = false;
		for(int i = 0; i < fragment.chunks.size(); i++){
			for(int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
				if(blockStartSet.contains(lineNumCount)) {
					if(!previousIsJump && lineNumCount > 1) {
						linkSet.add(new Triplet<Integer, Integer, String>(lineNumCount - 1, lineNumCount, "Direct"));
					}
					begin = lineNumCount;
				}
				if(blockEndSet.contains(lineNumCount)) {
					end = lineNumCount;
					if(blockStartSet.contains(begin)) {
						blockSet.add(new Tuple<Integer, Integer>(begin, end));
						begin++;
						end++;
					}
				}
				previousIsJump = isInJumpSet(lineNumCount);
				lineNumCount++;
			}
		}
	}
	
	private boolean isInJumpSet(int lineNumber) {
		for(Tuple<String, Integer> jump : jumpSet) {
			if(jump.y == lineNumber)
				return true;
		}		
		return false;
	}
	
	private boolean isBranchInstruction(ASMInstruction instruction) {
		return  instruction.getOpcode() == ASMOpcode.JumpFalse ||
				instruction.getOpcode() == ASMOpcode.JumpTrue ||
				instruction.getOpcode() == ASMOpcode.JumpNeg ||
				instruction.getOpcode() == ASMOpcode.JumpPos ||
				instruction.getOpcode() == ASMOpcode.JumpFNeg ||
				instruction.getOpcode() == ASMOpcode.JumpFPos ||
				instruction.getOpcode() == ASMOpcode.JumpFZero;
	}
}
