package optimizer;

import java.util.ArrayList;
import java.util.List;

import asmCodeGenerator.codeStorage.ASMCodeChunk;;

public class BasicBlock {
	private ASMCodeChunk codeChunk;
	private boolean isTrimmed;
	private boolean mutipleOutEdge;
	private List<Tuple<BasicBlock, String>> innerNeighbours;
	private List<Tuple<BasicBlock, String>> outerNeighbours;


    public BasicBlock(ASMCodeChunk code) { 
        this.codeChunk = code;
        this.isTrimmed = false;
        this.mutipleOutEdge = false;
        this.innerNeighbours = new ArrayList<Tuple<BasicBlock, String>>();
        this.outerNeighbours = new ArrayList<Tuple<BasicBlock, String>>();
    }
    
    public void addInnerNeighbours(BasicBlock block, String condition) {
    	innerNeighbours.add(new Tuple<BasicBlock, String>(block, condition));
    }
    
    public void addOuterNeighbours(BasicBlock block, String condition) {
    	outerNeighbours.add(new Tuple<BasicBlock, String>(block, condition));
    }
}
