import grizzzly.Customer
import grizzzly.User
import grizzzly.Project
import grizzzly.Role
import grizzzly.Member
import grizzzly.Actor
import grizzzly.Requirement
import grizzzly.Story
import grizzzly.Iteration
import grizzzly.Release
import java.util.Date
import grizzzly.Module
import grizzzly.ModuleInstance
import grizzzly.ModuleProperty
import grizzzly.ModulePropertyInstance

class BootStrap {
	Customer custForeSee
	User userHeynist
	User userKimpema
	Project projectGrizzzly
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
	Release rel001
	Iteration it001
	Module modWiki
	Module modCI
	ModuleInstance projGrizzzlyCI
	ModuleInstance projGrizzzlyWiki
	ModuleProperty modWikiUrl
	ModuleProperty modCIUrl
	ModulePropertyInstance modProjectGrizzzlyWikiUrl
	ModulePropertyInstance modProjectGrizzzlyCIUrl

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
            projectGrizzzly = new Project(name: "Grizzzly", code: "GRZL", website: "http://www.grizzzly.be", owner: userHeynist).save(failOnError: true)
        } else
        	projectGrizzzly = Project.findByCode("GRZL")
        	
        if (!Role.count()) {
            roleScrumMaster = new Role(name: "Scrum master", project: projectGrizzzly, development: false).save(failOnError: true)
            roleDeveloper = new Role(name: "Developer", project: projectGrizzzly, development: true).save(failOnError: true)
        } else {
        	roleScrumMaster = Role.findByName("Scrum master")
        	roleDeveloper = Role.findByName("Developer")
        }
        if (!Member.count()) {
            memberHeynist = new Member(project: projectGrizzzly, user: userHeynist).save(failOnError: true)
            //memberHeynist.roles.add(roleDeveloper).save(failOnError: true)
            memberKimpema = new Member(project: projectGrizzzly, user: userKimpema).save(failOnError: true)
            //memberKimpema.roles.add(roleScrumMaster).save(failOnError: true)
        } 
        if (!Actor.count()) {
            actorLeidendAmbtenaar = new Actor(project: projectGrizzzly, name: "Leidend ambtenaar").save(failOnError: true)
            actorDossierBeheerder = new Actor(project: projectGrizzzly, name: "Dossierbeheerder").save(failOnError: true)
        }
        if (!Requirement.count()) {
            rq001 = new Requirement(project: projectGrizzzly, name: "Story management", code: "RQ001", owner: memberKimpema, importance: "none", status: "unplanned").save(failOnError: true)
            rq00101 = new Requirement(project: projectGrizzzly, name: "Story maintenance", code: "RQ00101", owner: memberKimpema, subRequirementOf: rq001, importance: "critical", status: "unplanned").save(failOnError: true)
            rq00102 = new Requirement(project: projectGrizzzly, name: "Story reporting", code: "RQ00102", owner: memberKimpema, subRequirementOf: rq001, importance: "medium", status: "unplanned").save(failOnError: true)
        }
        if (!Story.count()) {
            us001 = new Story(requirement: rq00101, code: "US001", owner: memberKimpema, asA: actorLeidendAmbtenaar, iWantTo: "create a user story and persist it").save(failOnError: true)
            us002 = new Story(requirement: rq00102, code: "US002", owner: memberKimpema, asA: actorDossierBeheerder, iWantTo: "report all user stories within a single iteration").save(failOnError: true)
        }
        if (!Release.count()) {
            rel001 = new Release(name: "rel001", project: projectGrizzzly, releaseDate: new Date()).save(failOnError: true)
        }
        if (!Iteration.count()) {
            it001 = new Iteration(name: "it001", project: projectGrizzzly, release: rel001, startDate: new Date(), endDate: new Date()).save(failOnError: true)
            us001.iteration = it001
            us002.iteration = it001
            it001.save(failOnError: true)
        }

    	if (!Module.count()) {
    		modWiki = new Module(name: "MediaWiki").save(failOnError: true)
			modCI = new Module(name: "Jenkins (Hudson)").save(failOnError: true)
    	}
    	if (!ModuleInstance.count()) {
    		projGrizzzlyWiki = new ModuleInstance(project: projectGrizzzly, module: modWiki).save(failOnError: true)
			projGrizzzlyCI = new ModuleInstance(project: projectGrizzzly, module: modCI).save(failOnError: true)
    	}
    	if (!ModuleProperty.count()) {
    		modWikiUrl = new ModuleProperty(name: "MediaWiki Url", module: modWiki, dataType: "String").save(failOnError: true)
			modCIUrl = new ModuleProperty(name: "Jenkins Url", module: modCI, dataType: "String").save(failOnError: true)
    	}
    	if (!ModulePropertyInstance.count()) {
    		modProjectGrizzzlyWikiUrl = new ModulePropertyInstance(moduleInstance: projGrizzzlyWiki, moduleProperty: modWikiUrl, value: "http://wiki.grizzzly.be").save(failOnError: true)
			modProjectGrizzzlyCIUrl = new ModulePropertyInstance(moduleInstance: projGrizzzlyCI, moduleProperty: modCIUrl, value: "http://ci.grizzzly.be").save(failOnError: true)
    	}

    }
    def destroy = {
    }
}
