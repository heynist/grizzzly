package grizzzly
before "setup", {
Release aRelease
Iteration iteration1
Iteration iteration2
Story story1
Story story2
Story story3
Story story4
Project aProject
Release release1
Release release2

  scenario "a release is implemented in a series of iterations", {
        given "two iterations : iteration1 and iteration2 and a release", {
                aRelease  = new Release(name:"aRelease")
                iteration1 = new Iteration(name:"Iter1")
                iteration2 = new Iteration(name:"Iter2")
	}
	when "linking them together", {
                iteration1.release = aRelease
                iteration2.release = aRelease
                aRelease.iterations = [ iteration2,  iteration1 ]  
	}
	then "iteration2 should be visible from its release", {
                iteration2.release.shouldBe aRelease
	}
	and "the requirement should give all the story information", {
                iteration2.release.iterations.contains(iteration2).shouldBe true
	}
  }
  scenario "a release can give an overview of its stories per iteration", {
        given "two iterations : iteration1 and iteration2 and a release", {
                aRelease  = new Release(name:"aRelease")
                iteration1 = new Iteration(name:"Iter1")
                iteration2 = new Iteration(name:"Iter2")
                iteration1.release = aRelease
                iteration2.release = aRelease
                aRelease.iterations = [ iteration2,  iteration1 ]  
	}
	when "assigning stories to iterations", {
                story1 = new Story(code:"story1")
                story1.iteration=iteration1
                story2 = new Story(code:"story2")
                story2.iteration=iteration2
                story3 = new Story(code:"story3")
                story3.iteration=iteration2
                story4 = new Story(code:"story4")
                story4.iteration=iteration1
                iteration1.stories = [ story1,  story4 ]  
                iteration2.stories = [ story2,  story3 ]  
              
	}
	then "from the release I can see the stories for iteration1", {
                aRelease.iterations.each {
                         if ( it.name=="Iter1") {
                            it.stories.contains(story4).shouldBe true
	                 }
                         else {
                            it.name.shouldBe "Iter2"
	                 }
	        }
	}
	and "from the release I can see the stories for iteration2", {
                aRelease.iterations.each {
                         if ( it.name=="Iter2") {
                            it.stories.contains(story2).shouldBe true
	                 }
                         else {
                            it.name.shouldBe "Iter1"
	                 }
	        }
	}
  }
  scenario "a project can have multiple releases", {
        given "two releases : release1 and release2 and a project", {
                aProject  = new Project(name:"myProject")
                release1  = new Release(name:"release1")
                release2  = new Release(name:"release2")
	}
	when "linking them together", {
                release1.project = aProject
                release2.project = aProject
                aProject.releases = [ release1,  release2 ]  
	}
	then "releases should be visible from the project", {
                aProject.releases.contains(release1).shouldBe true
	}
	and "a release is specific for a project", {
                release2.project.shouldBe aProject
	}
  }

}

