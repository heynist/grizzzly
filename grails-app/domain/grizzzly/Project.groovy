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
    	modules(blank:true, nullable:true)
    	members(blank:true, nullable:true)
    	releases(blank:true, nullable:true)
    	requirements(blank:true, nullable:true)
    	roles(blank:true, nullable:true)
    	actors(blank:true, nullable:true)
    }
    
    static hasMany = [releases:ProjectRelease, requirements:Requirement, roles:Role, actors:Actor, members:Member, modules:ModuleInstance]
    
    String toString() {
    	name + " (" + code + ")"
    }
}
