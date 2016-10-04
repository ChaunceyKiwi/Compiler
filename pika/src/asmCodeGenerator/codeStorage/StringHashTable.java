package asmCodeGenerator.codeStorage;

import java.util.HashMap;

public class StringHashTable {
	private static String prefix = "string";
	private static int count = 0;
	private static HashMap<String, String> mapping = new HashMap<String, String>();
	
	
	private static String getNewLabel(){
		String newLabel = prefix + count;
		count++;
		
		return newLabel;
	}
	
	public static String getLabelFor(String s){
		if(mapping.containsKey(s)){
			return mapping.get(s);
		}else
			return null;
	}
	
	public static String applyLabelFor(String s){
		String labelApplied = getNewLabel();
		
		mapping.put(s, labelApplied);
		return labelApplied;
	}		
}