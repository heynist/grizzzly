package grizzzly

class ControlBusRoute {

	def selector = java.net.URLEncoder.encode("moduleInstance='" + 'grizzzly@vobzcms' + "'","UTF-8") 
	def clientId = "grizzzly@vobzcms"
	
    def configure = {

		from('activemq:queue:controlbus.grizzzly@vobz.cms.config').to('stream:out')
		from('activemq:queue:controlbus.grizzzly@vobz.cms.liveconsole').to('bean:busMonitorService?method=liveConsole')

		//from('activemq:topic:vobz.cms.controlbus.grizzzly.config?clientId=' + clientId + '&durableSubscriptionName=config.grizzzly.controlbus&selector=' + selector).to('stream:out')
		//from('activemq:topic:vobz.cms.controlbus.heartbeat').to('stream:out')
		//from('activemq:topic:vobz.cms.controlbus.test').to('stream:out')
		//from('activemq:topic:vobz.cms.controlbus.exception').to('stream:out')
 		//from('activemq:topic:vobz.cms.controlbus.statistics').to('stream:out')
		//from('activemq:topic:vobz.cms.controlbus.liveconsole').to('stream:out')
   }
}
