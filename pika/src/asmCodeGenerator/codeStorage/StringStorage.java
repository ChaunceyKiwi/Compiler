package asmCodeGenerator.codeStorage;

import java.util.HashMap;

public class StringStorage {
	private static int counter = 0;
	private static String prefix = "str";
	private static HashMap<String, String> map = new HashMap<String, String>();
	
	public static String getLabelFor(String value) {
		if(map.containsKey(value)) {
			return map.get(value);
		}
		return null;
	}
	
	public static String initializeNewLabel(String value) {
		assert(!map.containsKey(value));
		
		String label = prefix + counter;
		counter++;
		
		map.put(value,  label);
		return label;
	}
}