package grizzzly

class InboundRoute {
    def configure = {
		from('activemq:topic:vobz.cms.story?clientId=grizzzly@vobzcms&durableSubscriptionName=story.grizzzly').to('activemq:queue:controlbus.grizzzly@vobz.cms.liveconsole').to('bean:storyManagerService?method=receive') 
    }
}
