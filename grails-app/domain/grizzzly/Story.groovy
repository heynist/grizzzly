package grizzzly

class Story {
	String grzlUuid
	String code
	String name
	Member owner
	Actor asA
	String iWantTo
	String soThat
	Requirement requirement
	Iteration iteration
	String currentState
	
	static belongsTo = [subStoryOf:Story]
	//static hasMany = [subStories:Story]
	//static mappedBy = [subStories:subStories]
	
    static constraints = {
		grzlUuid(blank:true, nullable:true)
    	code(blank:true, nullable:true)
    	name(blank:true, nullable:true)
    	owner(blank:true, nullable:true)
    	asA(blank:true, nullable:true)
    	iWantTo(blank:true, nullable:true)
    	soThat(blank:true, nullable:true)
    	iteration(blank:true, nullable: true)
    	requirement(blank:true, nullable:true)
    	subStoryOf(blank:true, nullable:true)
    	//subStories(blank:true, nullable:true)
    	currentState(blank:true, nullable:true, default:'unscheduled')
    }
    
    String toString() {
    	//code + " (" + asA + ": " + iWantTo + ")"
    	name
    }
}
