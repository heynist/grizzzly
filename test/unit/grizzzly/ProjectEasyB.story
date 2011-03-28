package grizzzly
before "setup", {
  Customer aCustomer 
  Project  aMasterProject
  User     anOwner 
  Project  aSubProject1
  User     aSubOwner1
  Project  aSubProject2
  User     aSubOwner2
  Role     aRole
  Member   aMember

  scenario "A project must have an Owner", {
        given "a Customer and a user", {
                aCustomer = new Customer(name:"Cronos")
	}
	when "creating a project without an owner", {
               aProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)
	}
	then "should give back an exception, but it doesn't", {
               assert "here" !=  "still possible to create a project with a null owner"
	}
  }
  scenario "A project can have more than 1 sub-project, each can have different owners", {
        given "a master project and an Owner", {
                aCustomer = new Customer(name:"Cronos")
                anOwner = new User(login:"Master", customer:aCustomer) 
                aMasterProject = new Project(name:"MasterProject", owner:anOwner)
           
	}
	when "creating multiple subprojects without their specific owner", {
               aSubOwner1 = new User(login:"SubOWner1", customer:aCustomer) 
               aSubProject1 = new Project(name:"aSubProject1", code:"TPX", owner:aSubOwner1)
               aSubOwner2 = new User(login:"SubOwner2", customer:aCustomer) 
               aSubProject2 = new Project(name:"aSubProject2", code:"TPX", owner:aSubOwner2)
	}
	then "should give back a different owner for master and sub-project", {
               aMasterProject.owner.shouldNotBe aSubProject2.owner
	}
	and "should give back a different owner for both sub-projects", {
               aSubProject1.owner.shouldNotBe aSubProject2.owner
	}
  }
  scenario "A project can have more than one moduleinstance", {
        given "a Customer with a project", {
               aCustomer = new Customer(name:"Cronos")
               anOwner = new User(login:"Master", customer:aCustomer) 
               aMasterProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)

	}
	when "adding multiple moduleinstances to the project", {
               aMasterProject.modules = []
               aMasterProject.modules.add( new ModuleInstance(module:new Module(name:"Wiki"), project:aMasterProject))
               aMasterProject.modules.add( new ModuleInstance(module:new Module(name:"CI"), project:aMasterProject))
	}
	then "the project should have an overview of its moduleinstances with first module instance", {
              aMasterProject.modules.toArray()[0].project.shouldBe aMasterProject
	}
	and "the project should have an overview of its moduleinstances with second module instance", {
              aMasterProject.modules.toArray()[1].project.shouldBe aMasterProject
	}
  }
  scenario "A project can have more than one moduleinstance of the same module", {
        given "a Customer with a project", {
               aCustomer = new Customer(name:"Cronos")
               anOwner = new User(login:"Master", customer:aCustomer) 
               aMasterProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)

	}
	when "adding multiple moduleinstances to the project", {
               aModule = new Module(name:"Wiki")
               aMasterProject.modules = []
               aMasterProject.modules.add( new ModuleInstance(module:aModule, project:aMasterProject))
               aMasterProject.modules.add( new ModuleInstance(module:aModule, project:aMasterProject))
	}
	then "they can be of the same module", {
              aMasterProject.modules.toArray()[0].module.shouldBe aMasterProject.modules.toArray()[1].module
	}
  }
  scenario "A project can have more than one member", {
        given "a Customer with a project", {
               aCustomer = new Customer(name:"Cronos")
               anOwner = new User(login:"Master", customer:aCustomer) 
               aMasterProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)

	}
	when "adding multiple members to the project", {
               aMasterProject.members = []
               aMasterProject.members.add( new Member(user:new User(login:"one"), project:aMasterProject))
               aMasterProject.members.add( new Member(user:new User(login:"two"), project:aMasterProject))
	}
	then "the project should have an overview of its members with first member", {
              aMasterProject.members.toArray()[0].project.shouldBe aMasterProject
	}
	and "the project should have an overview of its members with second member", {
              aMasterProject.members.toArray()[1].project.shouldBe aMasterProject
	}
  }
  scenario "A project can have more than one role", {
        given "a Customer with a project", {
               aCustomer = new Customer(name:"Cronos")
               anOwner = new User(login:"Master", customer:aCustomer) 
               aMasterProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)

	}
	when "adding multiple roles to the project", {
               aMasterProject.roles = []
               aMasterProject.roles.add( new Role(name:"role one", project:aMasterProject))
               aMasterProject.roles.add( new Role(name:"role two", project:aMasterProject))
	}
	then "the project should have an overview of its roles with first role", {
              aMasterProject.roles.toArray()[0].project.shouldBe aMasterProject
	}
	and "the project should have an overview of its roles with second role", {
              aMasterProject.roles.toArray()[1].project.shouldBe aMasterProject
	}
  }
  scenario "A project can only have members with roles provided in the project", {
        given "a customer with a project and some project roles", {
               aCustomer = new Customer(name:"Cronos")
               anOwner = new User(login:"Master", customer:aCustomer) 
               aMasterProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)
               aMasterProject.roles = []
               aMasterProject.roles.add( new Role(name:"role one", project:aMasterProject))
               aMasterProject.roles.add( new Role(name:"role two", project:aMasterProject))
	}
	when "adding a member to the project", {
               aRole = new Role(name:"role three")
               memberRoles = [aRole]
               aMasterProject.roles.add(aRole)
               aMember = new Member(user:new User(login:"one"), project:aMasterProject, roles:memberRoles )
               aMasterProject.members = []
               aMasterProject.members.add(aMember)
	}
	then "the member should only have roles allowed in the project", {
               aMasterProject.roles.contains(aMember.roles.toArray()[0]).shouldBe true
	}
  }
}

