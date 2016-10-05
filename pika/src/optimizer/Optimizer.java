package optimizer;

import asmCodeGenerator.codeStorage.ASMCodeChunk;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
import asmCodeGenerator.codeStorage.ASMInstruction;
import asmCodeGenerator.codeStorage.ASMOpcode;
import optimizer.Tuple;

public class Optimizer {
	private ASMCodeFragment fragment;
	
	public static ASMCodeFragment optimize(ASMCodeFragment fragment) {
	
		// Put all data directives at the front of the output code
		ASMCodeChunk head = new ASMCodeChunk();
		for(int i = 0; i < fragment.chunks.size(); i++){
			for(int j = 0; j < fragment.chunks.get(i).instructions.size() ;j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				if(instruction.getOpcode() == ASMOpcode.DLabel || instruction.getOpcode() == ASMOpcode.DataC ||	
				   instruction.getOpcode() == ASMOpcode.DataI  || instruction.getOpcode() == ASMOpcode.DataF ||
				   instruction.getOpcode() == ASMOpcode.DataS  || instruction.getOpcode() == ASMOpcode.DataZ ||
				   instruction.getOpcode() == ASMOpcode.DataD  || instruction.getOpcode() == ASMOpcode.PStack ){
				   fragment.chunks.get(i).instructions.remove(j--);
				   head.instructions.add(instruction);
				}
			}
		}
		
		// Eliminate any duplicate records in the header
		for(int j = 0; j < head.instructions.size() ;j++) {
			ASMInstruction instr = head.instructions.get(j);
			if(instr.getOpcode() == ASMOpcode.DLabel){
				String s = (String) instr.getArgument();
				String target;
				if(s.indexOf("stringConstant") != -1){
					target = s.substring(s.lastIndexOf("-") + 1);
					for(int i = 0; i < j; i++){
						ASMInstruction instrBefore = head.instructions.get(i);
						if(instrBefore.getOpcode() == ASMOpcode.DLabel){
							String sBefore = (String) instrBefore.getArgument();
							if ((sBefore.indexOf("stringConstant") != -1) 
							&& (sBefore.substring(sBefore.lastIndexOf("-") + 1).equals(target))){
							   	head.instructions.remove(j+1);
							   	head.instructions.add(i+1, head.instructions.get(j));
							   	head.instructions.remove(j+1);
							   	break;
							}
						}
					}
				}
			}
		}
	
		
		// Simple constant arithmetic calculations at compile time if possible
		ASMInstruction prevprevInstr = null;
		ASMInstruction prevInstr = null;
		ASMInstruction Instr = null;
		
		Tuple<Integer, Integer> indexForPPIns = new Tuple<Integer, Integer>(0, 0);
		Tuple<Integer, Integer> indexForPIns =  new Tuple<Integer, Integer>(0, 0);
		Tuple<Integer, Integer> indexForIns =   new Tuple<Integer, Integer>(0, 0);
		
		boolean flag = true;
		for(int i = 0; (i < fragment.chunks.size()) && flag; i++){
			for(int j = 0; (j < fragment.chunks.get(i).instructions.size()) && flag ;j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				prevprevInstr = prevInstr; indexForPPIns = indexForPIns;
				prevInstr = Instr; indexForPIns = indexForIns;
				Instr = instruction; indexForIns = new Tuple<Integer, Integer>(i, j);
				
				if(prevprevInstr !=  null && prevInstr != null && Instr != null){
					if(prevprevInstr.getOpcode() == ASMOpcode.PushI &&
					   prevInstr.getOpcode() == ASMOpcode.PushI){
						if(Instr.getOpcode() == ASMOpcode.Add){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushI, (Integer)(prevInstr.getArgument()) + (Integer)(prevprevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
							 flag = false;
							 break;
						}else if(Instr.getOpcode() == ASMOpcode.Subtract){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushI, (Integer)(prevInstr.getArgument()) - (Integer)(prevprevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
							 flag = false;
							 break;
						}else if(Instr.getOpcode() == ASMOpcode.Multiply){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushI, (Integer)(prevInstr.getArgument()) * (Integer)(prevprevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
							 flag = false;
							 break;
						}else if(Instr.getOpcode() == ASMOpcode.Divide){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushI, (Integer)(prevInstr.getArgument()) / (Integer)(prevprevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
							 flag = false;
							 break;
						}
					}
					
					if(prevprevInstr.getOpcode() == ASMOpcode.PushF &&
							   prevInstr.getOpcode() == ASMOpcode.PushF){
								if(Instr.getOpcode() == ASMOpcode.FAdd){
									 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushF, (Double)(prevInstr.getArgument()) + (Double)(prevprevInstr.getArgument()));
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
									 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
									 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
									 flag = false;
									 break;
								}else if(Instr.getOpcode() == ASMOpcode.Subtract){
									 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushF, (Double)(prevInstr.getArgument()) - (Double)(prevprevInstr.getArgument()));
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
									 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
									 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
									 flag = false;
									 break;
								}else if(Instr.getOpcode() == ASMOpcode.Multiply){
									 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushF, (Double)(prevInstr.getArgument()) * (Double)(prevprevInstr.getArgument()));
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
									 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
									 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
									 flag = false;
									 break;
								}else if(Instr.getOpcode() == ASMOpcode.Divide){
									 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushF, (Double)(prevInstr.getArgument()) / (Double)(prevprevInstr.getArgument()));
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
									 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
									 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
									 fragment.chunks.get(indexForPPIns.x.intValue()).instructions.remove(indexForPPIns.y.intValue());
									 flag = false;
									 break;
								}
							}
				}
			}
		}
		
		prevInstr = null;
		Instr = null;
		for(int i = 0; (i < fragment.chunks.size()) && flag; i++){
			for(int j = 0; (j < fragment.chunks.get(i).instructions.size()) && flag ;j++) {
				ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
				prevInstr = Instr; indexForPIns = indexForIns;
				Instr = instruction; indexForIns = new Tuple<Integer, Integer>(i, j);
				
				if(prevInstr != null && Instr != null){
					if(prevInstr.getOpcode() == ASMOpcode.PushI){
						if(Instr.getOpcode() == ASMOpcode.Negate){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushI, -1 * (Integer)(prevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 flag = false;
							 break;
						}else if(Instr.getOpcode() == ASMOpcode.ConvertF){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushF, (Double)(prevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 flag = false;
							 break;
						}
					}
					if(prevInstr.getOpcode() == ASMOpcode.PushF){
						if(Instr.getOpcode() == ASMOpcode.Negate){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushF, -1.0 * (Double)(prevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 flag = false;
							 break;
						}else if(Instr.getOpcode() == ASMOpcode.ConvertI){
							 ASMInstruction newInstr = new ASMInstruction(ASMOpcode.PushI, (Integer)(prevInstr.getArgument()));
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.add(indexForIns.y.intValue()+1, newInstr);
							 fragment.chunks.get(indexForIns.x.intValue()).instructions.remove(indexForIns.y.intValue());
							 fragment.chunks.get(indexForPIns.x.intValue()).instructions.remove(indexForPIns.y.intValue());
							 flag = false;
							 break;
						}
					}
				}

			}
		}
			
		fragment.chunks.add(0, head);
		return fragment;
	}
	public Optimizer(ASMCodeFragment fragment) {
		this.fragment = fragment;
	}
	
	public ASMCodeFragment optimize() {
		return fragment;
	}
}
