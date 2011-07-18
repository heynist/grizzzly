package grizzzly

class ModuleProperty {
	static belongsTo = Module
	static hasMany = [instances:ModulePropertyInstance]
	
	Module module
	String name
	String dataType
	String code
	
    static constraints = {
		module(blank:false)
		code(blank:false, length:30)
		name(blank:false, length:50)
		dataType(inList:["String", "Integer", "Long"])
	}
	
	String toString() { name }

}
