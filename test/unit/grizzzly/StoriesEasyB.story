package grizzzly
before "setup", {
Requirement aRequirement
Story story1
Story story2
Story AStory
Actor anActor

  scenario "a story can reference another story", {
        given "two stories : story1 and Story2", {
                story1 = new Story(code:"ST1")
                story2 = new Story(code:"ST2")
	}
	when "linking the stories together", {
                assert "story1" == "story2"
	}
	then "story2 should be visible from story1", {
	}
	and "story1 should be visible from story2", {
	}
  
  }
  scenario "stories belong to a requirement ", {
        given "two stories : story1 and Story2 and a requirement", {
                aRequirement = new Requirement(name:"aRequirement")
                story1 = new Story(code:"ST1")
                story2 = new Story(code:"ST2")
	}
	when "linking them together", {
                story1.requirement = aRequirement
                story2.requirement = aRequirement
                aRequirement.stories = [ story2,  story1 ]  
	}
	then "story2 should be visible from its requirement", {
                story2.requirement.shouldBe aRequirement
	}
	and "the requirement should give all the story information", {
                story2.requirement.stories.contains(story2).shouldBe true
	}
  }
scenario "a story can be in the form of As_a (actor) I want to... so that...", {
        given "a story and an actor", {
                aStory  = new Story(code:"story")
                anActor = new Actor(name:"project owner")
	}
	when "i can write the story", {
                aStory.asA = anActor
                aStory.iWantTo = "describe my stories"
                aStory.soThat = "they are testable"
	}
	then "in the form as_a actor I want to ... so that ....", {
                aStory.shouldBe "story (project owner: describe my stories)"
	}
  }

}

