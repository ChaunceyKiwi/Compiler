package asmCodeGenerator.codeStorage;

import java.util.HashMap;

public class ConstStringIndexNumberHashTable {
	private static HashMap<String, Integer> mapping = new HashMap<String, Integer>();
	
	public static int getIndexNumFor(String s){
		if(mapping.containsKey(s)){
			return mapping.get(s);
		}else
			return 0;
	}
	
	public static void registLineNumFor(String s, int index){		
		mapping.put(s, index);
	}		
}