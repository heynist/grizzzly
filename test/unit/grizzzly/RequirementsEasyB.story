package grizzzly
before "setup", {
Requirement aToplevelRequirement 
Requirement  aSubRequirement 
Release release1
Release release2

  scenario "Requirements are organised hierarchically", {
        given "two requirements", {
                aToplevelRequirement = new Requirement(name:"Toplevel")
                aSubRequirement = new Requirement(name:"Subl2")
	}
	when "linking a subrequirement indirectly to the toplevel requirement", {
                anInbetweenRequirement = new Requirement(name:"Subl1")
                aSubRequirement.subRequirementOf=anInbetweenRequirement
                anInbetweenRequirement.subRequirementOf=aToplevelRequirement 
	}
	then "the subrequirement should know its toplevel requirement", {
                aSubRequirement.subRequirementOf.subRequirementOf.shouldBe aToplevelRequirement
	}
	and "the toplevelrequirement should have an overview of its subrequirements (treeview)", {
                aToplevelRequirement.shouldBe "the top of a tree"
	}

  }
  scenario "a Requirement can be planned in one or more releases", {
        given "a requirement", {
                aSubRequirement = new Requirement(name:"Subl2")
	}
	when "linking it to two releases", {
                release1 = new Release(name:"Release1")
                release2 = new Release(name:"Release2")
                aSubRequirement.releases = [ release1, release2 ]
	}
	then "it should be in the backlog of release one", {
                aSubRequirement.releases.toArray()[0].shoulBe release1
	}
	and "it should be in the backlog of release two", {
                aSubRequirement.releases.toArray()[1].shoulBe release2
	}
  
  }
}

