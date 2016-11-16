package optimizer;

import java.util.ArrayList;
import java.util.List;

import asmCodeGenerator.codeStorage.ASMCodeChunk;;

public class BasicBlock {
	private ASMCodeChunk codeChunk;
	private boolean isTrimmed;
	private boolean mutipleOutEdge;
	private List<BasicBlock> innerNeighbours;
	private List<BasicBlock> outerNeighbours;


    public BasicBlock(ASMCodeChunk code) { 
        this.codeChunk = code;
        this.isTrimmed = false;
        this.mutipleOutEdge = false;
        this.innerNeighbours = new ArrayList<BasicBlock>();
        this.outerNeighbours = new ArrayList<BasicBlock>();
    }
    
    public void addInnerNeighbours(BasicBlock block) {
    	innerNeighbours.add(block);
    }
    
    public void addOuterNeighbours(BasicBlock block) {
    	outerNeighbours.add(block);
    }
}
