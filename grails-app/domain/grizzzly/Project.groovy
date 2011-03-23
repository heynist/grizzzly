package grizzzly

class Project {
	String name
	String code
	String website
	User owner
	
    static belongsTo = [subProjectOf:Project]
	
    static constraints = {
    	name(blank:false)
    	code(blank:false)
    	owner(blank:false)
    }
    
    static hasMany = [releases:Release, requirements:Requirement, roles:Role, actors:Actor, members:Member]
    
    String toString() {
    	name + " (" + code + ")"
    }
}
