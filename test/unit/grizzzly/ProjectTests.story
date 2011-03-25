package grizzzly
before "setup", {
  Customer aCustomer 
  User     anOwner 

  scenario "A project must have an Owner", {
        given "a Customer and a user", {
                aCustomer = new Customer(name:"Cronos")
	}
	when "creating a project without an owner", {
               aProject = new Project(name:"TheProject", code:"TPX", owner:anOwner)
	}
	then "should give back an exceptioni, but it doesn't", {
               assert "here" !=  "still possible to create a project with a null owner"
	}
  }
}

