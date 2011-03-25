package grizzzly
before "setup", {
  Customer aCustomer 

  scenario "A customer can declare more than one user", {
        given "a Customer", {
                aCustomer = new Customer(name:"Cronos")
	}
	when "adding 2 users", {
                aCustomer.users = [ new User(login:"one"), new User(login:"two")  ]
	}
	then "should give back 2 users", {
               aCustomer.users.size().shouldBe  2
	}
	and "both should be different", {
               aCustomer.users.toArray()[0].shouldNotBe  aCustomer.users.toArray()[1]

	}

  }
  scenario "A customer can declare not declare a user twice", {
        given "a Customer", {
                aCustomer = new Customer(name:"Cronos")
	}
	when "adding the same user twice", {
                user=new User(login:"one")
                user2=new User(login:"two")
                aCustomer.users = []
                aCustomer.users.add(user)
                aCustomer.users.add(user)
	}
	then "should give back 1 user", {
               aCustomer.users.size().shouldBe  1
	}

  }
}

