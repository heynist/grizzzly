package grizzzly

import groovy.xml.MarkupBuilder

class ModuleInstanceController {
	static scaffold = true
	
	def modulePropertyEntry(builder, args) {
		builder.property(name: args['name'], args['value'])
	}

	def broadcast = {
		def moduleInstance = ModuleInstance.findById(params?.id)
		if (moduleInstance) {
			def writer = new StringWriter()
			def xml = new MarkupBuilder(writer)
			xml.story() {
				envelope() {
					module('grizzzly')
					instance('grizzzly@vobzcms')
					version('1.0.0')
				}
				body() {
					application() {
						ModulePropertyInstance.findAllByModuleInstance(moduleInstance).each { modulePropertyInstance ->
							def moduleProperty = modulePropertyInstance.moduleProperty
							modulePropertyEntry(xml, [name: moduleProperty.name, value: modulePropertyInstance.value])
						}
					}
				}
			}
			def payload = writer.toString()
			def destination = "activemq:queue:controlbus." + moduleInstance.name + ".config"
			println "Sending " + payload + " to destination: "  + destination
			sendMessage(destination, payload)
		}
		render "broadcast method executed for: " + params
	}
}
