package optimizer;

public class Tuple<X, Y> { 
    public X x; 
    public Y y; 
    
    public Tuple(X x, Y y) { 
        this.x = x; 
        this.y = y; 
    }
    
    @Override
    public String toString(){
    	// infoString as <x, y>
    	return "<" + x +", "+ y + ">";
    }
    
	@Override 
    @SuppressWarnings("rawtypes")
    public boolean equals(Object other) {
        if (!(other instanceof Tuple)) {
            return false;
        }
        
        Tuple rawOther = (Tuple) other;
        return x.equals(rawOther.x) &&
            y.equals(rawOther.y);
    }

    @Override 
    public int hashCode() {
        int hash = 23;
        
        if(x != null) {
          hash = hash * 31 + x.hashCode();
        }else {
          hash = hash * 31;
        }
        
        if(y != null) {
          hash = hash * 31 + y.hashCode();
        }else {
          hash = hash * 31;
        }
        
        return hash;
    }
}