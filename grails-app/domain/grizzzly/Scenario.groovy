package grizzzly

class Scenario {
	String code
	Member owner
	String givenClause
	String whenClause
	String thenClause
	Requirement requirement
	Iteration iteration
	
    static constraints = {
    	code(blank:false)
    	givenClause(blank:false)
    	whenClause(blank:false)
    	thenClause(blank:false)
    	iteration(blank:true, nullable: true)
    }
    
    String toString() {
    	code
    }

}
