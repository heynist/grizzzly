package grizzzly

class Customer {

	String name

	static hasMany = [users:User]
	
    static constraints = {
    	name(blank:false, length:1..40)
    	users(blank:true, nullable:true)
	}
	
	String toString() { name }
}
