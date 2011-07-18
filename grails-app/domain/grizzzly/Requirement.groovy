package grizzzly

class Requirement {
	String name
	String code
	String importance
	String status
	Member owner
	
	static belongsTo = [project:Project, 
				subRequirementOf:Requirement]
	
	static hasMany = [stories:Story,subRequirements:Requirement,releases:ProjectRelease]
		
    static constraints = {
    	importance(inList:["none", "critical", "high", "medium", "low"])
    	status(inList:["unplanned", "planned", "inprogress", "completed", "deployed"])
    	project(blank:true,nullable:true)
	subRequirementOf(blank:true,nullable:true)
    	stories(blank:true,nullable:true)
    	subRequirements(blank:true,nullable:true)
    	releases(blank:true,nullable:true)
    }
    
    String toString() {
    	name + " (" + code + ")"
    } 
}
