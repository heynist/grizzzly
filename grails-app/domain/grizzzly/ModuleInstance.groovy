package grizzzly

class ModuleInstance {
	static belongsTo = [Module, Project]
	static hasMany = [props:ModulePropertyInstance]
	
	Project project
	Module module
	
    static constraints = {
		project(blank:false)
		module(blank:false)
    }
	
	String toString() { module.name + " instance @ " + project.name + " project"}

}
