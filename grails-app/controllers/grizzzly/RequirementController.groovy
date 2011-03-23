package grizzzly

class RequirementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [requirementInstanceList: Requirement.list(params), requirementInstanceTotal: Requirement.count()]
    }

    def create = {
        def requirementInstance = new Requirement()
        requirementInstance.properties = params
        return [requirementInstance: requirementInstance]
    }

    def save = {
        def requirementInstance = new Requirement(params)
        if (requirementInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'requirement.label', default: 'Requirement'), requirementInstance.id])}"
            redirect(action: "show", id: requirementInstance.id)
        }
        else {
            render(view: "create", model: [requirementInstance: requirementInstance])
        }
    }

    def show = {
        def requirementInstance = Requirement.get(params.id)
        if (!requirementInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])}"
            redirect(action: "list")
        }
        else {
            [requirementInstance: requirementInstance]
        }
    }

    def edit = {
        def requirementInstance = Requirement.get(params.id)
        if (!requirementInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [requirementInstance: requirementInstance]
        }
    }

    def update = {
        def requirementInstance = Requirement.get(params.id)
        if (requirementInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (requirementInstance.version > version) {
                    
                    requirementInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'requirement.label', default: 'Requirement')] as Object[], "Another user has updated this Requirement while you were editing")
                    render(view: "edit", model: [requirementInstance: requirementInstance])
                    return
                }
            }
            requirementInstance.properties = params
            if (!requirementInstance.hasErrors() && requirementInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'requirement.label', default: 'Requirement'), requirementInstance.id])}"
                redirect(action: "show", id: requirementInstance.id)
            }
            else {
                render(view: "edit", model: [requirementInstance: requirementInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def requirementInstance = Requirement.get(params.id)
        if (requirementInstance) {
            try {
                requirementInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])}"
            redirect(action: "list")
        }
    }
}
