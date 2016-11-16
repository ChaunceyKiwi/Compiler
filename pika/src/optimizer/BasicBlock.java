package optimizer;

import java.util.ArrayList;
import java.util.List;

import asmCodeGenerator.codeStorage.ASMCodeChunk;;

public class BasicBlock {
	private ASMCodeChunk codeChunk;
	private boolean isTrimmed;
	private boolean mutipleOutEdge;
	private List<Tuple<BasicBlock, String>> inNeighbors;
	private List<Tuple<BasicBlock, String>> outNeighbors;


    public BasicBlock(ASMCodeChunk code) { 
        this.codeChunk = code;
        this.isTrimmed = false;
        this.mutipleOutEdge = false;
        this.inNeighbors = new ArrayList<Tuple<BasicBlock, String>>();
        this.outNeighbors = new ArrayList<Tuple<BasicBlock, String>>();
    }
    
    public void addInNeighbors(BasicBlock block, String condition) {
    	inNeighbors.add(new Tuple<BasicBlock, String>(block, condition));
    }
    
    public void addOutNeighbors(BasicBlock block, String condition) {
    	outNeighbors.add(new Tuple<BasicBlock, String>(block, condition));
    }
}
