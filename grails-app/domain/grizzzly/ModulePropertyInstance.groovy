package grizzzly

class ModulePropertyInstance {

	static belongsTo = [ModuleInstance, ModuleProperty]
	
	ModuleInstance moduleInstance
	ModuleProperty moduleProperty
	String value
	
    static constraints = {
		moduleInstance(blank:false)
		moduleProperty(blank:false)
		value(blank:false)
    }
	
	String toString() { moduleProperty.name + " property of " + moduleInstance.module.name + " module instance @ " + moduleInstance.project.name + " project"}
}
