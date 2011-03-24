package grizzzly

class ModulePropertyInstanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [modulePropertyInstanceInstanceList: ModulePropertyInstance.list(params), modulePropertyInstanceInstanceTotal: ModulePropertyInstance.count()]
    }

    def create = {
        def modulePropertyInstanceInstance = new ModulePropertyInstance()
        modulePropertyInstanceInstance.properties = params
        return [modulePropertyInstanceInstance: modulePropertyInstanceInstance]
    }

    def save = {
        def modulePropertyInstanceInstance = new ModulePropertyInstance(params)
        if (modulePropertyInstanceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), modulePropertyInstanceInstance.id])}"
            redirect(action: "show", id: modulePropertyInstanceInstance.id)
        }
        else {
            render(view: "create", model: [modulePropertyInstanceInstance: modulePropertyInstanceInstance])
        }
    }

    def show = {
        def modulePropertyInstanceInstance = ModulePropertyInstance.get(params.id)
        if (!modulePropertyInstanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), params.id])}"
            redirect(action: "list")
        }
        else {
            [modulePropertyInstanceInstance: modulePropertyInstanceInstance]
        }
    }

    def edit = {
        def modulePropertyInstanceInstance = ModulePropertyInstance.get(params.id)
        if (!modulePropertyInstanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [modulePropertyInstanceInstance: modulePropertyInstanceInstance]
        }
    }

    def update = {
        def modulePropertyInstanceInstance = ModulePropertyInstance.get(params.id)
        if (modulePropertyInstanceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (modulePropertyInstanceInstance.version > version) {
                    
                    modulePropertyInstanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance')] as Object[], "Another user has updated this ModulePropertyInstance while you were editing")
                    render(view: "edit", model: [modulePropertyInstanceInstance: modulePropertyInstanceInstance])
                    return
                }
            }
            modulePropertyInstanceInstance.properties = params
            if (!modulePropertyInstanceInstance.hasErrors() && modulePropertyInstanceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), modulePropertyInstanceInstance.id])}"
                redirect(action: "show", id: modulePropertyInstanceInstance.id)
            }
            else {
                render(view: "edit", model: [modulePropertyInstanceInstance: modulePropertyInstanceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def modulePropertyInstanceInstance = ModulePropertyInstance.get(params.id)
        if (modulePropertyInstanceInstance) {
            try {
                modulePropertyInstanceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance'), params.id])}"
            redirect(action: "list")
        }
    }
}
