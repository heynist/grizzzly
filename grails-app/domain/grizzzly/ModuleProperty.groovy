package grizzzly

class ModuleProperty {
	static belongsTo = Module
	static hasMany = [instances:ModulePropertyInstance]
	
	Module module
	String name
	String dataType
	
    static constraints = {
		module(blank:false)
		name(blank:false, length:25)
		dataType(inList:["String", "integer"])
	}
	
	String toString() { name }

}
