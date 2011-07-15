package grizzzly

class Story {
	String code
	Member owner
	Actor asA
	String iWantTo
	String soThat
	Requirement requirement
	Iteration iteration
	
	static belongsTo = [subStoryOf:Story]
	static hasMany = [subStories:Story]
	
    static constraints = {
    	code(blank:false)
    	owner(blank:false)
    	asA(blank:false)
    	iWantTo(blank:false)
    	soThat(blank:true, nullable:true)
    	iteration(blank:true, nullable: true)
    	subStoryOf(blank:true)
    	subStories(blank:true, nullable:true)
    }
    
    String toString() {
    	code + " (" + asA + ": " + iWantTo + ")"
    }
}
