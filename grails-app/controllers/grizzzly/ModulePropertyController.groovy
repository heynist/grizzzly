package grizzzly

class ModulePropertyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [modulePropertyInstanceList: ModuleProperty.list(params), modulePropertyInstanceTotal: ModuleProperty.count()]
    }

    def create = {
        def modulePropertyInstance = new ModuleProperty()
        modulePropertyInstance.properties = params
        return [modulePropertyInstance: modulePropertyInstance]
    }

    def save = {
        def modulePropertyInstance = new ModuleProperty(params)
        if (modulePropertyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), modulePropertyInstance.id])}"
            redirect(action: "show", id: modulePropertyInstance.id)
        }
        else {
            render(view: "create", model: [modulePropertyInstance: modulePropertyInstance])
        }
    }

    def show = {
        def modulePropertyInstance = ModuleProperty.get(params.id)
        if (!modulePropertyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), params.id])}"
            redirect(action: "list")
        }
        else {
            [modulePropertyInstance: modulePropertyInstance]
        }
    }

    def edit = {
        def modulePropertyInstance = ModuleProperty.get(params.id)
        if (!modulePropertyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [modulePropertyInstance: modulePropertyInstance]
        }
    }

    def update = {
        def modulePropertyInstance = ModuleProperty.get(params.id)
        if (modulePropertyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (modulePropertyInstance.version > version) {
                    
                    modulePropertyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'moduleProperty.label', default: 'ModuleProperty')] as Object[], "Another user has updated this ModuleProperty while you were editing")
                    render(view: "edit", model: [modulePropertyInstance: modulePropertyInstance])
                    return
                }
            }
            modulePropertyInstance.properties = params
            if (!modulePropertyInstance.hasErrors() && modulePropertyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), modulePropertyInstance.id])}"
                redirect(action: "show", id: modulePropertyInstance.id)
            }
            else {
                render(view: "edit", model: [modulePropertyInstance: modulePropertyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def modulePropertyInstance = ModuleProperty.get(params.id)
        if (modulePropertyInstance) {
            try {
                modulePropertyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty'), params.id])}"
            redirect(action: "list")
        }
    }
}
