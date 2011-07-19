package grizzzly

class ProjectRelease {
        String name
        Date releaseDate
	
    static belongsTo = [project:Project]

	static hasMany = [iterations:Iteration]
	
    static constraints = {
    	name(blank:false)
    }
    
    String toString() {
    	name + " (" + releaseDate + ")"
    }
}
