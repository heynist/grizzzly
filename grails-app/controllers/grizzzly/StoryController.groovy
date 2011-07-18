package grizzzly

import groovy.util.XmlSlurper
import groovy.xml.MarkupBuilder

//extends SecureController
class StoryController extends SecureController {

	def storyService
	def GrizzzlyUUIDService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        //def msg = 'storyDiv||' + session.user.firstName + ' ' + session.user.lastName + ' refreshed the story list.'
        //broadcaster['/atmosphere/events'].broadcast(msg)
        [storyInstanceList: Story.list(params), storyInstanceTotal: Story.count()]
    }

    def create = {
        def storyInstance = new Story()
        storyInstance.properties = params
        return [storyInstance: storyInstance]
    }

    def save = {
        def storyInstance = new Story(params)
        
        storyInstance.grzlUuid=GrizzzlyUUIDService.generate()
		storyInstance = constructStoryName(storyInstance)
        
        if (storyInstance.save(flush: true)) {
			notify(storyInstance.id)
            redirect(action:list, id: storyInstance.id)
        }
        else {
            render(view: "create", model: [storyInstance: storyInstance])
        }
    }

    def show = {
    println "in story controller"
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [storyInstance: storyInstance]
        }
    }

    def edit = {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [storyInstance: storyInstance]
        }
    }

    def update = {
        def storyInstance = Story.get(params.id)
        if (storyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (storyInstance.version > version) {
                    storyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'story.label', default: 'Story')] as Object[], "Another user has updated this Story while you were editing")
                    render(view: "edit", model: [storyInstance: storyInstance])
                    return
                }
            }
            storyInstance.properties = params
            storyInstance = constructStoryName(storyInstance)
            if (!storyInstance.hasErrors() && storyInstance.save(flush: true)) {
	        	notify(storyInstance.id)
				redirect(action:show, id: storyInstance.id)
            }
            else {
                render(view: "edit", model: [storyInstance: storyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def storyInstance = Story.get(params.id)
        if (storyInstance) {
            try {
                storyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
    }

	private constructStoryName(storyInstance) {
		if (storyInstance.code && storyInstance.iWantTo)
		storyInstance.name = storyInstance.code + " - " + storyInstance.iWantTo
		return storyInstance
	}
    
    def notify(Long storyId) {
		println "StoryController::notify:"
		sendMessage("vm:story", storyId)
		def storyInstance = Story.get(storyId)
		if (storyInstance) {
//			def msg = 'notification||notice||' + session.user.firstName + ' ' + session.user.lastName + ' updated story "' + storyInstance.name + '".'
//			broadcaster['/atmosphere/events'].broadcast(msg)
			
			// replace displayed content with the newly rendered info
			def msg = 'nudge||story||' + storyInstance.id
			//broadcaster['/atmosphere/events'].broadcast(msg)
			broadcaster['/atmosphere/story'].broadcast(msg)
		}
    }
    
    def rss = {
        render(feedType:"rss", feedVersion:"2.0") {
            title = "Grizzzly - Most recently added user stories"
            link = "http://Steven-Heynincks-MacBook-Pro.local:8080/rss/story"
            description = "The funky Grizzzly news feed keeping you right on track with the latest and greatest in user story land !"
            Story.list(order:"desc").each() { story ->
                entry(story.code + ' - ' + story.iWantTo) {
                    link = "http://Steven-Heynincks-MacBook-Pro.local:8080/grizzzly/story/${story.id}"
                    story.soThat // return the content
                }
            }
        }
    }
    
    def search = {
		def criteria = Story.createCriteria()
		def stories
		if (params.q) {
			println "searching on ${params.q}"
			//stories = Story.findAllByCode(params.q)
			stories = criteria.list {
				or {
					ilike('code', '%' + params.q + '%')
					ilike('name', '%' + params.q + '%')
					ilike('iWantTo', '%' + params.q + '%')
					ilike('soThat', '%' + params.q + '%')
				}
			}
		} else
			redirect (action: 'list')
		render(view: 'list', model: [storyInstanceList:stories, storyInstanceTotal: (stories ? stories.size() : 0)])
	}
	
	def updateSoThat = {
		params.ajax = true
		update.call()
		render (Story.get(params.id)?.soThat)
	}

	def test1 = {
		def bc = broadcaster['/atmosphere/events']
		if (bc) {
			bc.broadcast "notification||warning||what happened on the event listeners?"
			render "message broadcasted on eventBroadcaster"
		} else
			render "eventBroadcaster is null"
	}

	def test2 = {
		def bc = broadcaster['/atmosphere/story']
		if (bc) {
			bc.broadcast "notification||warning||what happened on the story listeners?"
			render "message broadcasted on storyBoroadcaster"
		} else
			render "storyBroadcaster is null"
	}
}
