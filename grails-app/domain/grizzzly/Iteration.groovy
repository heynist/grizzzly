package grizzzly

class Iteration {
	String name
	Date startDate
	Date endDate
	Release release
	
	static belongsTo = [project:Project]
	
    static constraints = {
    	name(blank:false)
    }
    
    static hasMany = [stories:Story]
    
    String toString() {
    	name
    }
}
