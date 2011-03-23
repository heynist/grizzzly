package grizzzly

class Role {
	String name
	Boolean development
	
	static belongsTo = [project:Project]
	
    static constraints = {
    	name(blank:false)
    }
    
    String toString() {
    	name
    }
}
