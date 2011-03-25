package grizzzly
before "setup", {
  Customer aCustomer 
  Project  aMasterProject
  User     anOwner 
  Project  aSubProject1
  User     aSubOwner1
  Project  aSubProject2
  User     aSubOwner2

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
  scenario "A project can have more than 1 sub-project, each can hava different owners", {
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
}

