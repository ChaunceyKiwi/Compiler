package optimizer;

import asmCodeGenerator.codeStorage.ASMCodeChunk;

public class BasicHeader {
  private ASMCodeChunk codeChunk;
  private int headerIndex;
  
  public BasicHeader(ASMCodeChunk code, int headerIndex) {
    this.codeChunk = code;
    this.headerIndex = headerIndex;
  }
  
  public String getDLabel() {
    Object DLabelArgument = codeChunk.instructions.get(0).getArgument();
    assert DLabelArgument != null;
    return DLabelArgument.toString();
  }
  
  public ASMCodeChunk getCodeChunk() {
    return this.codeChunk;
  }
  
  public int getHeaderIndex() {
    return headerIndex;
  }

}
