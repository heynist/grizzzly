package grizzzly

import java.util.concurrent.Executors
import java.util.concurrent.ThreadFactory

class AtmosphereHandlerService {


    static transactional = false

	static atmosphere = [mapping: '/atmosphere/events']

	private final static String BEGIN_SCRIPT_TAG = "<script type='text/javascript'>\n"
    private final static String END_SCRIPT_TAG = "</script>\n"
    private final static String NOTIFICATION = "n"
    private final static String APPEND = "a"
    private final static String REPLACE = "r"
    private final static String NUDGE = "g"
    private final static String HTML = "h"
    private final static String SEPARATOR = "||"
     
	def onRequest = { event ->
		println "AtmosphereHandlerService::onRequest event"
    	event.suspend(90000, false)
	}
    
    def onStateChange = { event ->
		if (!event.message) return

		println "AtmosphereHandlerService::onStateChange event fired"

		if (event.isCancelled() || event.isResuming() || event.isResumedOnTimeout()  ) { 
			if (event.isCancelled()) { 
				println("Cancelled"); 
			} 
			if (event.isResuming()) { 
				println("Resumed"); 
			} 
			if (event.isResumedOnTimeout()) { 
				println("Resumed on Timeout"); 
			}
		} else { 
			def response = event.resource.response
			
			def message = event.message.toString()
			def type
			def field
			def value
			def msg
			
			println "AtmosphereHandlerService::onStateChange::message: " + message
			def msgArray = message.split("\\|\\|")
			println "AtmosphereHandlerService::onStateChange::msgArray.size(): " + msgArray.size()
			if (msgArray.size() == 3) {
				type = msgArray[0]
				field = msgArray[1]
				value = msgArray[2]
				
				println "AtmosphereHandlerService::onStateChange::type: " + type
				println "AtmosphereHandlerService::onStateChange::field: " + field
				println "AtmosphereHandlerService::onStateChange::value: " + value

				switch (type) {
				case 'notification':
					// field contains the notification type
					// value contains the actual notification text itself
					def toast
					switch (field) {
					case 'notice':
						toast='n'
						break
					case 'warning':
						toast='w'
						break
					case 'error':
						toast='e'
						break
					case 'success':
						toast='s'
						break
					}
					if (toast)
						msg = NOTIFICATION + SEPARATOR + toast + SEPARATOR + value
					break
				case 'replace':
					msg = REPLACE + SEPARATOR + field + SEPARATOR + value
					break
				case 'append':
					msg = APPEND + SEPARATOR + field + SEPARATOR + value
					break
				case 'nudge':
					msg = NUDGE + SEPARATOR + field + SEPARATOR + value
				}
			}

			//def msg = BEGIN_SCRIPT_TAG + toJson(field, value) + fadeInOut(field, "3000") + END_SCRIPT_TAG
			
			if (msg) {
				println "AtmosphereHandlerService::onStateChange event::about to send out message => " + msg
				response.writer.with {
					write msg
					flush()
				}
				println "AtmosphereHandlerService::onStateChange event::sent out message => " + msg
			}
		}
	}
	
	private String toJson(String field, String value) {
        def ret = "\$('#"
        ret += field
        ret += "').text('" + value + "');"
        return ret
    }
    
    private String fadeInOut(field, duration) {
		"\$('#" + field + "').fadeIn(" + duration + ", function() {\$('#" + field + "').fadeOut(" + duration + ");});"
    }

}
