package grizzzly

class ModuleInstance {
	static belongsTo = [Module, Project]
	static hasMany = [props:ModulePropertyInstance]
	
	Project project
	Module module
	String name
	
    static constraints = {
		project(blank:false)
		module(blank:false)
		name(blank:false)
    }
	
	String toString() {name}

}
