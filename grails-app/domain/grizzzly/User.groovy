package grizzzly

class User {

	String login
	String firstName
	String lastName
	String email
	
    static hasMany = [membership:Member]
	
    static constraints = {
    	login(blank:false)
    }
    
    String toString() {
    	login + " (" + lastName + " " + firstName + ")"
    }
}
