package grizzzly

class Module {

	String name
	
	static hasMany = [props:ModuleProperty, instances:ModuleInstance]
	
    static constraints = {
		name(blank:false, length:1..25)
    }
	
	String toString() { name }
}
