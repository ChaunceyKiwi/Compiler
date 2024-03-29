package lexicalAnalyzer;

import tokens.LextantToken;
import tokens.Token;


public enum Keyword implements Lextant {
  STATIC("static"),
  CONST("const"),
  VAR("var"),
  PRINT("print"),
  NEWLINE("_n_"),
  TAB("_t_"),
  TRUE("_true_"),
  FALSE("_false_"),
  EXEC("exec"),
  NULL_KEYWORD(""),

  // Used for ForStatement
  FOR("for"),
  INDEX("index"),
  ELEM("elem"),
  OF("of"),

  // Customize operator
  MAP("map"),
  REDUCE("reduce"),
  FOLD("fold"),
  ZIP("zip"),
  REVERSE("reverse"),

  // Primitive Type
  BOOLEAN("bool"),
  CHARACTER("char"),
  STRING("string"),
  INTEGER("int"),
  FLOATING("float"),
  RATIONAL("rat"),

  // Function Type
  VOID("void"),
  LAMBDATYPE("lambdaType"),

  // for array type
  LENGTH("length"),
  COPY("clone"),
  NEW("new"),

  // for control flow
  IF("if"),
  ELSE("else"),
  WHILE("while"),

  // for release statement
  RELEASE("release"),

  // for while statement
  BREAK("break"),
  CONTINUE("continue"),

  // for function
  FUNC("func"),
  CALL("call"),
  RETURN("return");

  private String lexeme;
  private Token prototype;


  private Keyword(String lexeme) {
    this.lexeme = lexeme;
    this.prototype = LextantToken.make(null, lexeme, this);
  }
  public String getLexeme() {
    return lexeme;
  }
  public Token prototype() {
    return prototype;
  }

  public static Keyword forLexeme(String lexeme) {
    for (Keyword keyword: values()) {
      if (keyword.lexeme.equals(lexeme)) {
        return keyword;
      }
    }
    return NULL_KEYWORD;
  }
  public static boolean isAKeyword(String lexeme) {
    return forLexeme(lexeme) != NULL_KEYWORD;
  }

  /*   the following hashtable lookup can replace the serial-search implementation of forLexeme() above. It is faster but less clear. 
	private static LexemeMap<Keyword> lexemeToKeyword = new LexemeMap<Keyword>(values(), NULL_KEYWORD);
	public static Keyword forLexeme(String lexeme) {
		return lexemeToKeyword.forLexeme(lexeme);
	}
   */
}
