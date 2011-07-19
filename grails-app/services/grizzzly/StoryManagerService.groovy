package grizzzly

import groovy.util.XmlSlurper
import groovy.xml.MarkupBuilder

import org.springframework.transaction.annotation.Transactional

@Transactional
class StoryManagerService {

    static transactional = false

	static atmosphere = [mapping: '/atmosphere/story']

    private final static String NUDGE = "g"
    private final static String SEPARATOR = "||"

	def onRequest = { event ->
		println "StoryManagerService::onRequest event"
    	event.suspend(90000, false)
	}

   def onStateChange = { event ->
		if (!event.message) return

		println "StoryManagerService::onStateChange event fired"

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
			
			println "StoryManagerService::onStateChange::message: " + message
			def msgArray = message.split("\\|\\|")
			println "StoryManagerService::onStateChange::msgArray.size(): " + msgArray.size()
			if (msgArray.size() == 3) {
				type = msgArray[0]
				field = msgArray[1]
				value = msgArray[2]

				println "StoryManagerService::onStateChange::type: " + type
				println "StoryManagerService::onStateChange::field: " + field
				println "StoryManagerService::onStateChange::value: " + value

				msg = NUDGE + SEPARATOR + field + SEPARATOR + value
				
				println "StoryManagerService::onStateChange event::message: " + msg
				println "StoryManagerService::onStateChange event::sending out message => " + msg
				response.writer.with {
					write msg
					flush()
				}
				println "StoryManagerService::onStateChange event::sent out message => " + msg
			}
			
			if (msg) {
			}
		}
	}
	
	String receive(String message) {
		//println "StoryManagerService::Message received: " + message
    	def story = new XmlSlurper().parseText(message)

		def grzlUuid = story.body?.grzlUuid?.text()
		
		def storyInstance = Story.findByGrzlUuid(grzlUuid)
		if (!storyInstance) {
			storyInstance = new Story()
			storyInstance.grzlUuid = grzlUuid
		}
		if (story.body?.code)
			storyInstance.code = story.body?.code?.text()
		if (story.body?.name)
			storyInstance.name = story.body?.name?.text()
		if (story.body?.iWantTo)
			storyInstance.iWantTo = story.body?.iWantTo?.text()
		if (story.body?.soThat)
			storyInstance.soThat = story.body?.soThat?.text()
		if (story.body?.currentState)
			storyInstance.currentState = story.body?.currentState?.text()
		storyInstance.save()
	}
	
	def notify(Long storyId) {
		publishMessage(constructMessage(storyId))
    }

    def publishMessage(String message) {
        sendMessage("activemq:topic:vobz.cms.story",message)
    }
    
    String constructMessage(Long storyId) {
		def storyInstance = Story.findById(storyId)
		if (!storyInstance) {
			sendMessage("activemq:topic:vobz.connector.error", "story instance with id " + id + " not found in module Grizzzly")
		} else {
			def writer = new StringWriter()
			def xml = new MarkupBuilder(writer)
			xml.story() {
				envelope() {
					module('grizzzly')
					instance('grizzzly@vobzcms')
					version('1.0.0')
				}
				body() {
					if (storyInstance.grzlUuid)
						grzlUuid(storyInstance.grzlUuid)
					if (storyInstance.code)
						code(storyInstance.code)
					if (storyInstance.name)
						name(storyInstance.name)
					if (storyInstance.asA)
						asA(storyInstance.asA)
					if (storyInstance.iWantTo)
						iWantTo(storyInstance.iWantTo)
					if (storyInstance.soThat)
						soThat(storyInstance.soThat)
					if (storyInstance.currentState)
						currentState(storyInstance.currentState)				}
			}
			def message = writer.toString()
			//println "StoryManagerService::constructMessage:message: " + message
			return message
		}
    }
}
