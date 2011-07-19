package grizzzly

class BusMonitorService {

    static transactional = false
    static atmosphere = [mapping: '/atmosphere/console']
    
    def onRequest = { event ->
		println "BusMonitorService::onRequest event"
    	event.suspend()
    }
    
    def onStateChange = { event ->
		if (!event.message) return

        def message = event.message.toString()
		println "BusMonitorService::onStateChange event fired => " + message
    	def response = event.resource.response
        response.writer.with {
            write message
            flush()
        }
	}
	
	def liveConsole(message) {
		def now = new java.util.Date()
		broadcaster['/atmosphere/console'].broadcast(now.toString() + ': ' + message)
	}

}
