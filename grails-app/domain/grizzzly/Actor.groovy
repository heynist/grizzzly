package grizzzly

class Actor {

	String name
	static belongsTo = [project:Project]
	
    static constraints = {
    	name(blank:false)
    }
    
    String toString() {
    	name
    }
}
