package semanticAnalyzer;

public class Sequencer {
  private static int labelSequenceNumber = 0;

  private int labelNumber;
  private String prefix;

  public Sequencer(String userPrefix) {
      labelSequenceNumber++;
      labelNumber = labelSequenceNumber;
      this.prefix = makePrefix(userPrefix);
  }
  private String makePrefix(String prefix) {
      return prefix + "-" + labelNumber;
  }

  public String getLabel() {
      return prefix;
  }
}
