package grizzzly

class ScenarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [scenarioInstanceList: Scenario.list(params), scenarioInstanceTotal: Scenario.count()]
    }

    def create = {
        def scenarioInstance = new Scenario()
        scenarioInstance.properties = params
        return [scenarioInstance: scenarioInstance]
    }

    def save = {
        def scenarioInstance = new Scenario(params)
        if (scenarioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'scenario.label', default: 'Scenario'), scenarioInstance.id])}"
            redirect(action: "show", id: scenarioInstance.id)
        }
        else {
            render(view: "create", model: [scenarioInstance: scenarioInstance])
        }
    }

    def show = {
        def scenarioInstance = Scenario.get(params.id)
        if (!scenarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scenario.label', default: 'Scenario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [scenarioInstance: scenarioInstance]
        }
    }

    def edit = {
        def scenarioInstance = Scenario.get(params.id)
        if (!scenarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scenario.label', default: 'Scenario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [scenarioInstance: scenarioInstance]
        }
    }

    def update = {
        def scenarioInstance = Scenario.get(params.id)
        if (scenarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (scenarioInstance.version > version) {
                    
                    scenarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'scenario.label', default: 'Scenario')] as Object[], "Another user has updated this Scenario while you were editing")
                    render(view: "edit", model: [scenarioInstance: scenarioInstance])
                    return
                }
            }
            scenarioInstance.properties = params
            if (!scenarioInstance.hasErrors() && scenarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'scenario.label', default: 'Scenario'), scenarioInstance.id])}"
                redirect(action: "show", id: scenarioInstance.id)
            }
            else {
                render(view: "edit", model: [scenarioInstance: scenarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scenario.label', default: 'Scenario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def scenarioInstance = Scenario.get(params.id)
        if (scenarioInstance) {
            try {
                scenarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'scenario.label', default: 'Scenario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'scenario.label', default: 'Scenario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scenario.label', default: 'Scenario'), params.id])}"
            redirect(action: "list")
        }
    }
}
