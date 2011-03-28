package grizzzly
before "setup", {
Release aRelease
Iteration iteration1
Iteration iteration2

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
}

