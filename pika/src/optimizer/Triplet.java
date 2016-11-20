package optimizer;

public class Triplet<X, Y, Z> { 
    public final X x; 
    public final Y y; 
    public final Z z; 

    
    public Triplet(X x, Y y, Z z) { 
        this.x = x; 
        this.y = y; 
        this.z = z;
    }
    
    @Override
    public String toString(){
    	// infoString as <x, y, z>
    	return "<" + x +", "+ y + ", "+ z + ">";
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
        
        if (z != null) {
          hash = hash * 31 + z.hashCode();
        }else {
          hash = hash * 31;
        }
        
        return hash;
    }
}