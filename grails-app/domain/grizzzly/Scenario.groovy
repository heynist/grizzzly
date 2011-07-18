package grizzzly

class Scenario {
	String code
	Member owner
	String givenClause
	String whenClause
	String thenClause
	Requirement requirement
	Story story
	
    static constraints = {
    	code(blank:false)
    	givenClause(blank:false)
    	whenClause(blank:false)
    	thenClause(blank:false)
    	story(blank:true, nullable: true)
    	iteration(blank:true, nullable: true)
    }
    
    String toString() {
    	code
    }

}
