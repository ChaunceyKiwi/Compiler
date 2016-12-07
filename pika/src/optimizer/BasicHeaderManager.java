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

public class BasicHeaderManager {
  private List<BasicHeader> headers;
  private Set<Tuple<String, Integer>> labelDSet;
  private Set<Tuple<String, Integer>> dataDSet;
  private Set<String>  labelDStringSet;
  private Set<Integer> headerStartSet;
  private Set<Integer> headerEndSet;
  private Set<Triplet<Integer, Integer, Integer>> headerSet;
  private Set<Triplet<Integer, Integer, BasicHeader>> headerRange;

  public BasicHeaderManager() {
    this.headers = new ArrayList<BasicHeader>();
    this.labelDSet = new HashSet<Tuple<String, Integer>>();
    this.dataDSet = new HashSet<Tuple<String, Integer>>();
    this.headerStartSet = new HashSet<Integer>();
    this.headerEndSet = new HashSet<Integer>();
    this.headerSet = new HashSet<Triplet<Integer, Integer, Integer>>();
    this.headerRange = new HashSet<Triplet<Integer, Integer, BasicHeader>>();
    this.labelDStringSet = new HashSet<String>();
  }

  public void generateBasicHeaders(ASMCodeFragment fragment, Set<String> pushDSet) {
    buildLabelDSet(fragment);
    buildDataDSet(fragment);
    buildHeaderStartEndSet();
    buildHeaderSet(fragment);
    buildHeaders(fragment, pushDSet);
    sortHeaders();
  }
  
  public ASMCodeFragment printAllChunksInBasicHeaders() {
    ASMCodeFragment code = new ASMCodeFragment(GENERATES_VOID);
    for (BasicHeader basicHeader : headers) {
      code.chunks.add(basicHeader.getCodeChunk());
    }
    return code;
  }
  
  private ASMCodeChunk getCodeInRange(ASMCodeFragment fragment, int start, int end) {
    int lineNumCount = 1;
    ASMCodeChunk codeInRange = new ASMCodeChunk();

    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (lineNumCount >= start && lineNumCount <= end
            && instruction.getOpcode() != ASMOpcode.Nop) {
          codeInRange.add(instruction);
        }
        lineNumCount++;
      }
    }
    return codeInRange;
  }
  
  public void add(BasicHeader header) {
    this.headers.add(header);
  }
  
  private void sortHeaders() {
    for (int i = headers.size() - 1; i > 0; i--) {
      for (int j = 0; j < i; j++) {
        if (headers.get(j).getHeaderIndex() > headers.get(j + 1).getHeaderIndex()) {
          BasicHeader temp = headers.get(j);
          headers.set(j, headers.get(j + 1));
          headers.set(j + 1, temp);
        }
      }
    }
  }
  
  private void buildHeaders(ASMCodeFragment fragment, Set<String> pushDSet) {
    for (Triplet<Integer, Integer, Integer> tuple : headerSet) {
      BasicHeader header = new BasicHeader(getCodeInRange(fragment, tuple.x, tuple.y), tuple.z);
      String getDLabelOfHeader = header.getDLabel();
      if (pushDSet.contains(getDLabelOfHeader) || getDLabelOfHeader.equals("$eat-location-zero")) {
        this.add(header);
        headerRange.add(new Triplet<Integer, Integer, BasicHeader>(tuple.x, tuple.y, header));
        labelDStringSet.add(getDLabelOfHeader);
      }
    }
     //pushDSet.removeAll(labelDStringSet);
  }
  
  private void buildHeaderSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    int headerIndex = 1;
    int begin = 0;
    int end = 0;
    int previousState = 0; // -1 as end, 1 as start, 0 as none, 2 as both
    int currentState = 0; // -1 as end, 1 as start, 0 as none, 2 as both
    boolean isLastInstr = false;

    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        currentState = 0;
        
        // Set flag if last instruction
        if ((i == fragment.chunks.size() - 1)
            && (j == fragment.chunks.get(i).instructions.size() - 1)) {
          isLastInstr = true;
        }
        
        if (headerStartSet.contains(lineNumCount)) {
          currentState = 1;
          
          // If it's the last instruction and it's a start,
          // then set it as a one-line-block
          if (isLastInstr) {
            boolean result = addToBlockSet(headerSet, lineNumCount, lineNumCount, headerIndex);
            if (result) {
              headerIndex++;
            }
          }
          
          // If find two continuous starts, set first one as one-line-block
          if (previousState == 1 || previousState == 2) {
            boolean result =
                addToBlockSet(headerSet, lineNumCount - 1, lineNumCount - 1, headerIndex);
            if (result) {
              headerIndex++;
            }
          }
          begin = lineNumCount;
        }
        if (headerEndSet.contains(lineNumCount)) {
          if (currentState == 1) {
            currentState = 2;
          } else {
            currentState = -1;
          }
          
          // If find two continuous ends, set latter one as one-line-block 
          if (previousState == 2 || previousState == -1) {
            boolean result = addToBlockSet(headerSet, lineNumCount, lineNumCount, headerIndex);
            if (result) {
              headerIndex++;
            }
          }
          end = lineNumCount;
          
          // If find an end, and there is a begin aviliable, and make a blockSet
          if (headerStartSet.contains(begin)) {
            boolean result = addToBlockSet(headerSet, begin, end, headerIndex);
            if (result) {
              headerIndex++;
              begin++;
              end++;
            }
          }
        }
        lineNumCount++;
        previousState = currentState;
      }
    }
  }
  
  // only be used for buildBlockSet()
  public boolean addToBlockSet(Set<Triplet<Integer, Integer, Integer>> set, int arg0, int arg1,
      int arg2) {
    for (Triplet<Integer, Integer, Integer> item : set) {
      if (item.x == arg0 && item.y == arg1) {
        return false;
      }
    }
    set.add(new Triplet<Integer, Integer, Integer>(arg0, arg1, arg2));
    return true;
  }

  private void buildHeaderStartEndSet() {
    // The first instruction is always a header start
    headerStartSet.add(1);
    
    for (Tuple<String, Integer> label : labelDSet) {
      headerStartSet.add(label.y);
      headerEndSet.add(label.y - 1);
    }
    
    for (Tuple<String, Integer> label : dataDSet) {
      headerStartSet.add(label.y);
      headerEndSet.add(label.y);
    }
  }

  public ASMCodeFragment separateOutDataDirectives(ASMCodeFragment fragment) {
    // Put all data directives at the front of the output code
    ASMCodeFragment head = new ASMCodeFragment(GENERATES_VOID);
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.DLabel
            || instruction.getOpcode() == ASMOpcode.DataC
            || instruction.getOpcode() == ASMOpcode.DataI
            || instruction.getOpcode() == ASMOpcode.DataF
            || instruction.getOpcode() == ASMOpcode.DataS
            || instruction.getOpcode() == ASMOpcode.DataZ
            || instruction.getOpcode() == ASMOpcode.DataD) {
          fragment.chunks.get(i).instructions.remove(j--);
          head.add(instruction);
        }
      }
    }
    return head;
  }

  private void buildLabelDSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        
        if ((i == fragment.chunks.size() - 1)
            && (j == fragment.chunks.get(i).instructions.size() - 1)) {
          headerEndSet.add(lineNumCount);
        }
        
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.DLabel) {
          labelDSet
              .add(new Tuple<String, Integer>(instruction.getArgument().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }
  
  private void buildDataDSet(ASMCodeFragment fragment) {
    int lineNumCount = 1;
    for (int i = 0; i < fragment.chunks.size(); i++) {
      for (int j = 0; j < fragment.chunks.get(i).instructions.size(); j++) {
        
        if ((i == fragment.chunks.size() - 1)
            && (j == fragment.chunks.get(i).instructions.size() - 1)) {
          headerEndSet.add(lineNumCount);
        }
        
        ASMInstruction instruction = fragment.chunks.get(i).instructions.get(j);
        if (instruction.getOpcode() == ASMOpcode.DataD) {
          labelDSet
              .add(new Tuple<String, Integer>(instruction.getArgument().toString(), lineNumCount));
        }
        lineNumCount++;
      }
    }
  }
}
