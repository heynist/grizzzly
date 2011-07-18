import grizzzly.Customer
import grizzzly.User
import grizzzly.Project
import grizzzly.Role
import grizzzly.Member
import grizzzly.Actor
import grizzzly.Requirement
import grizzzly.Story
import grizzzly.Iteration
import grizzzly.ProjectRelease
import java.util.Date
import grizzzly.Module
import grizzzly.ModuleInstance
import grizzzly.ModuleProperty
import grizzzly.ModulePropertyInstance

class BootStrap {
	Customer custForeSee
	User userHeynist
	User userKimpema
	Project projectVOBZCMS
	Role roleScrumMaster
	Role roleDeveloper
	Member memberHeynist
	Member memberKimpema
	Actor actorLeidendAmbtenaar
	Actor actorDossierBeheerder
	Requirement rq001
	Requirement rq00101
	Requirement rq00102
	Story us001
	Story us002
	ProjectRelease rel001
	Iteration it001
	Module modMantis
	Module modPivotalTracker
	ModuleInstance projVOBZCMSMantis
	ModuleInstance projVOBZCMSPivotalTracker
	
	ModuleProperty modMantisUrl
	ModuleProperty modPivotalTrackerUrl
	ModuleProperty modPivotalTrackerAPIUri
	ModuleProperty modPivotalTrackerAPIToken
	ModuleProperty modPivotalTrackerProject
	ModuleProperty modPivotalTrackerProxyHost
	ModuleProperty modPivotalTrackerProxyPort
	
	ModulePropertyInstance modProjectVOBZCMSMantisUrl
	ModulePropertyInstance modProjectVOBZCMSPivotalTrackerUrl
	ModulePropertyInstance modProjectVOBZCMSPivotalTrackerAPIUri
	ModulePropertyInstance modProjectVOBZCMSPivotalTrackerAPIToken
	ModulePropertyInstance modProjectVOBZCMSPivotalTrackerProject
	ModulePropertyInstance modProjectVOBZCMSPivotalTrackerProxyHost
	ModulePropertyInstance modProjectVOBZCMSPivotalTrackerProxyPort

    def init = { servletContext ->
    	if (!Customer.count()) {
    		custForeSee = new Customer(name: "ForeSee").save(failOnError: true)
    	}
        if (!User.count()) {
            userHeynist = new User(login: "heynist", firstName: "Steven", lastName: "Heyninck", email: "steven.heyninck@cronos.be",customer: custForeSee).save(failOnError: true)
            userKimpema = new User(login: "kimpema", firstName: "Marc", lastName: "Kimpe", email: "marc.kimpe@cronos.be",customer: custForeSee).save(failOnError: true)
        } else {
        	userHeynist = User.findByLogin("heynist")
        	userKimpema = User.findByLogin("kimpema")
        }
        if (!Project.count()) {
            projectVOBZCMS = new Project(name: "VOBZCMS", code: "VOBZCMS", website: "http://vobzcms.grizzzly.be", owner: userHeynist).save(failOnError: true)
        } else
        	projectVOBZCMS = Project.findByCode("VOBZCMS")
        	
        if (!Role.count()) {
            roleScrumMaster = new Role(name: "Scrum master", project: projectVOBZCMS, development: false).save(failOnError: true)
            roleDeveloper = new Role(name: "Developer", project: projectVOBZCMS, development: true).save(failOnError: true)
        } else {
        	roleScrumMaster = Role.findByName("Scrum master")
        	roleDeveloper = Role.findByName("Developer")
        }
        if (!Member.count()) {
            memberHeynist = new Member(project: projectVOBZCMS, user: userHeynist).save(failOnError: true)
            //memberHeynist.roles.add(roleDeveloper).save(failOnError: true)
            memberKimpema = new Member(project: projectVOBZCMS, user: userKimpema).save(failOnError: true)
            //memberKimpema.roles.add(roleScrumMaster).save(failOnError: true)
        } 
        if (!Actor.count()) {
            actorLeidendAmbtenaar = new Actor(project: projectVOBZCMS, name: "Leidend ambtenaar").save(failOnError: true)
            actorDossierBeheerder = new Actor(project: projectVOBZCMS, name: "Dossierbeheerder").save(failOnError: true)
        }
        if (!Requirement.count()) {
            rq001 = new Requirement(project: projectVOBZCMS, name: "Story management", code: "RQ001", owner: memberKimpema, importance: "none", status: "unplanned").save(failOnError: true)
            rq00101 = new Requirement(project: projectVOBZCMS, name: "Story maintenance", code: "RQ00101", owner: memberKimpema, subRequirementOf: rq001, importance: "critical", status: "unplanned").save(failOnError: true)
            rq00102 = new Requirement(project: projectVOBZCMS, name: "Story reporting", code: "RQ00102", owner: memberKimpema, subRequirementOf: rq001, importance: "medium", status: "unplanned").save(failOnError: true)
        }
        if (!Story.count()) {
            us001 = new Story(grzlUuid: "uuid1", requirement: rq00101, code: "US001", name: "US001 - create a user story and persist it", owner: memberKimpema, asA: actorLeidendAmbtenaar, iWantTo: "create a user story and persist it").save(failOnError: true)
            us002 = new Story(grzlUuid: "uuid2", requirement: rq00102, code: "US002", name: "US002 - report all user stories within a single iteration", owner: memberKimpema, asA: actorDossierBeheerder, iWantTo: "report all user stories within a single iteration").save(failOnError: true)
        }
        if (!ProjectRelease.count()) {
			rel001 = new ProjectRelease(name: "rel001", project: projectVOBZCMS, releaseDate: new Date()).save(failOnError: true)
        }
        if (!Iteration.count()) {
            it001 = new Iteration(name: "it001", project: projectVOBZCMS, release: rel001, startDate: new Date(), endDate: new Date()).save(failOnError: true)
            us001.iteration = it001
            us002.iteration = it001
            it001.save(failOnError: true)
        }

    	if (!Module.count()) {
    		modMantis = new Module(name: "Mantis").save(failOnError: true)
			modPivotalTracker = new Module(name: "PivotalTracker").save(failOnError: true)
    	}
    	if (!ModuleInstance.count()) {
    		projVOBZCMSMantis = new ModuleInstance(project: projectVOBZCMS, module: modMantis, name: 'gcmantis@vobz.cms').save(failOnError: true)
			projVOBZCMSPivotalTracker = new ModuleInstance(project: projectVOBZCMS, module: modPivotalTracker, name: 'gcpivotal@vobz.cms').save(failOnError: true)
    	}
    	if (!ModuleProperty.count()) {
    		modMantisUrl = new ModuleProperty(code: "MantisUrl", name: "Mantis Url", module: modMantis, dataType: "String").save(failOnError: true)
			modPivotalTrackerUrl = new ModuleProperty(code: "PivotalTrackerUrl", name: "PivotalTracker Url", module: modPivotalTracker, dataType: "String").save(failOnError: true)
			modPivotalTrackerAPIUri = new ModuleProperty(code: "ApiUri", name: "PivotalTracker API Uri", module: modPivotalTracker, dataType: "String").save(failOnError: true)
			modPivotalTrackerAPIToken = new ModuleProperty(code: "ApiToken", name: "PivotalTracker API Token", module: modPivotalTracker, dataType: "String").save(failOnError: true)
			modPivotalTrackerProject = new ModuleProperty(code: "PivotalProjectId", name: "PivotalTracker Project", module: modPivotalTracker, dataType: "Long").save(failOnError: true)
			modPivotalTrackerProxyHost = new ModuleProperty(code: "ProxyHost", name: "PivotalTracker Proxy Host", module: modPivotalTracker, dataType: "String").save(failOnError: true)
			modPivotalTrackerProxyPort = new ModuleProperty(code: "ProxyPort", name: "PivotalTracker Proxy Port", module: modPivotalTracker, dataType: "Integer").save(failOnError: true)
    	}
    	if (!ModulePropertyInstance.count()) {
    		modProjectVOBZCMSMantisUrl = new ModulePropertyInstance(moduleInstance: projVOBZCMSMantis, moduleProperty: modMantisUrl, active: true, value: "http://vobzcms.grizzzly.be/mantis").save(failOnError: true)
			modProjectVOBZCMSPivotalTrackerUrl = new ModulePropertyInstance(moduleInstance: projVOBZCMSPivotalTracker, moduleProperty: modPivotalTrackerUrl, active: true, value: "http://www.pivotaltracker.com").save(failOnError: true)
			modProjectVOBZCMSPivotalTrackerAPIUri = new ModulePropertyInstance(moduleInstance: projVOBZCMSPivotalTracker, moduleProperty: modPivotalTrackerAPIUri, active: true, value: "/services/v3").save(failOnError: true)
			modProjectVOBZCMSPivotalTrackerAPIToken = new ModulePropertyInstance(moduleInstance: projVOBZCMSPivotalTracker, moduleProperty: modPivotalTrackerAPIToken, active: true, value: "38d10ed7e941484d46439d8fe3cf81fb").save(failOnError: true)
			modProjectVOBZCMSPivotalTrackerProject = new ModulePropertyInstance(moduleInstance: projVOBZCMSPivotalTracker, moduleProperty: modPivotalTrackerProject, active: true, value: "293177").save(failOnError: true)
			modProjectVOBZCMSPivotalTrackerProxyHost = new ModulePropertyInstance(moduleInstance: projVOBZCMSPivotalTracker, moduleProperty: modPivotalTrackerProxyHost, active: true, value: "proxy.iconos.be").save(failOnError: true)
			modProjectVOBZCMSPivotalTrackerProxyPort = new ModulePropertyInstance(moduleInstance: projVOBZCMSPivotalTracker, moduleProperty: modPivotalTrackerProxyPort, active: true, value: "8080").save(failOnError: true)
    	}

    }
    def destroy = {
    }
}
