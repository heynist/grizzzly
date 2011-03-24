package grizzzly

class ModuleInstanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [moduleInstanceInstanceList: ModuleInstance.list(params), moduleInstanceInstanceTotal: ModuleInstance.count()]
    }

    def create = {
        def moduleInstanceInstance = new ModuleInstance()
        moduleInstanceInstance.properties = params
        return [moduleInstanceInstance: moduleInstanceInstance]
    }

    def save = {
        def moduleInstanceInstance = new ModuleInstance(params)
        if (moduleInstanceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), moduleInstanceInstance.id])}"
            redirect(action: "show", id: moduleInstanceInstance.id)
        }
        else {
            render(view: "create", model: [moduleInstanceInstance: moduleInstanceInstance])
        }
    }

    def show = {
        def moduleInstanceInstance = ModuleInstance.get(params.id)
        if (!moduleInstanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), params.id])}"
            redirect(action: "list")
        }
        else {
            [moduleInstanceInstance: moduleInstanceInstance]
        }
    }

    def edit = {
        def moduleInstanceInstance = ModuleInstance.get(params.id)
        if (!moduleInstanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [moduleInstanceInstance: moduleInstanceInstance]
        }
    }

    def update = {
        def moduleInstanceInstance = ModuleInstance.get(params.id)
        if (moduleInstanceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (moduleInstanceInstance.version > version) {
                    
                    moduleInstanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'moduleInstance.label', default: 'ModuleInstance')] as Object[], "Another user has updated this ModuleInstance while you were editing")
                    render(view: "edit", model: [moduleInstanceInstance: moduleInstanceInstance])
                    return
                }
            }
            moduleInstanceInstance.properties = params
            if (!moduleInstanceInstance.hasErrors() && moduleInstanceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), moduleInstanceInstance.id])}"
                redirect(action: "show", id: moduleInstanceInstance.id)
            }
            else {
                render(view: "edit", model: [moduleInstanceInstance: moduleInstanceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def moduleInstanceInstance = ModuleInstance.get(params.id)
        if (moduleInstanceInstance) {
            try {
                moduleInstanceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance'), params.id])}"
            redirect(action: "list")
        }
    }
}
