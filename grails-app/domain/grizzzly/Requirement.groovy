package grizzzly

class Requirement {
	String name
	String code
	String importance
	String status
	Member owner
	
	static belongsTo = [project:Project, 
						subRequirementOf:Requirement]
	
	static hasMany = [stories:Story,iterations:Iteration]
		
    static constraints = {
    	importance(inList:["none", "critical", "high", "medium", "low"])
    	status(inList:["unplanned", "planned", "inprogress", "completed", "deployed"])
    }
    
    String toString() {
    	name + " (" + code + ")"
    } 
}
