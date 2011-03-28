package grizzzly
before "setup", {
Requirement aRequirement
Scenario scenario1
Scenario scenario2
Story AStory
Requirement ARequirement

  scenario "scenarios can belong to a story", {
        given "two scenarios : scenario1 and scnenario2 and a story", {
                aStory = new Story(code:"aStory")
                scenario1 = new Scenario(code:"SC1")
                scenario2 = new Scenario(code:"SC2")
	}
	when "linking them together", {
                scenario1.story = aStory
                scenario2.story = aStory
                aStory.scenarios = [ scenario2,  scenario1 ]  
	}
	then "scenario2 should be visible from its story", {
                scenario.story.shouldBe aStory
	}
	and "the story should give all the scenario information", {
                scenario2.story.scenarios.contains(scenario1).shouldBe true
	}
  }
  scenario "scenarios can belong to a requirement ", {
        given "two scenarios : scenario1 and scenario2 and a requirement", {
                aRequirement = new Requirement(name:"aRequirement")
                scenario1 = new Scenario(code:"SC1")
                scenario2 = new Scenario(code:"SC2")
	}
	when "linking them together", {
                scenario1.requirement = aRequirement
                scenario2.requirement = aRequirement
                aRequirement.scenarios = [ scenario2,  scenario1 ]  
	}
	then "story2 should be visible from its requirement", {
                scenario2.requirement.shouldBe aRequirement
	}
	and "the requirement should give all the story information", {
                scenario2.requirement.scenarios.contains(scenario1).shouldBe true
	}
  }
}

