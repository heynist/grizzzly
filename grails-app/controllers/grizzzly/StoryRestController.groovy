package grizzzly

import grails.converters.*

class StoryRestController {
	def grizzzlyUUIDService
	def index = {
	switch(request.method) {
		case "GET":
			println "storyRestController::GET: " + params
			render Story.list() as JSON
			break
		case "POST":
			println "storyRestController::entry: " + params
			def story = new Story()
			story.grzlUUID=grizzzlyUUIDService.generate()
			story.code = params.code
			story.iWantTo = params.iWantTo
			story.soThat = params.soThat
			if(story.save()){
				println "storyRestController::POST:save() succeeded"
				sendMessage("vm:story.create", story.id)
				response.status = 201 // Created
				render story.id
			}
			else{
				println "storyRestController::POST:save() failed because: " + story.errors
				response.status = 500 //Internal Server Error
				render "Could not create new story due to errors:\n ${story.errors}"
			}
			println "storyRestController::exit"
			break
		}
	}
}
