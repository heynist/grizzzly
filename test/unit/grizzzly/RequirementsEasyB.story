package grizzzly
before "setup", {
Requirement aToplevelRequirement 
Requirement  aSubRequirement 
Release release1
Release release2

  scenario "Requirements are organised hierarchically", {
        given "two requirements", {
                aToplevelRequirement = new Requirement(name:"Toplevel", code:"REQ001")
                aSubRequirement = new Requirement(name:"Subl2", code:"REQ00102")
	}
	when "linking a subrequirement indirectly to the toplevel requirement", {
                anInbetweenRequirement = new Requirement(name:"Subl1", code:"REQ00101")
                aSubRequirement.subRequirementOf=anInbetweenRequirement
                anInbetweenRequirement.subRequirementOf=aToplevelRequirement 
	}
	then "the subrequirement should know its toplevel requirement", {
                aSubRequirement.subRequirementOf.subRequirementOf.shouldBe aToplevelRequirement
	}
	and "the toplevelrequirement should have an overview of its subrequirements (anInbetweenRequirement)", {
                aToplevelRequirement.subRequirements.toArray()[0].shouldBe anInbetweenRequirement
	}
	and "the anInbetweenRequirement should have an overview of its subrequirements (aSubRequirement)", {
                anInbetweenRequirement.subRequirements.toArray()[0].shouldBe aSubRequirement
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
                aSubRequirement.releases.toArray()[1].shouldBe release1
	}
	and "it should be in the backlog of release two", {
                aSubRequirement.releases.toArray()[0].shouldBe release2
	}
  
  }
}

