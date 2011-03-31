package  grizzzly

using "geb-grails"

scenario "Testing Geb and easyB functional tests on Grails", {
   given  "a web driver", {
   }
   when "we go to our application in Grails", {
        go "http://localhost:8080/grizzzly"
   }
 
   then "we are welcome", {
        page.title.shouldBe "Welcome to Grails"
    }
}
