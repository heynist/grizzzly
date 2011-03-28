package grizzzly
before "setup", {
Story story1
Story story2

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
}

