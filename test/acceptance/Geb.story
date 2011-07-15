package  grizzzly

using "geb-grails"

scenario "Testing Geb and easyB acceptance", {
   given  "a web driver", {
   }
   when "we go to google", {
        go "http://localhost:8080/grizzzly"
   }
 
   then "we are at google", {
        page.title.shouldBe "Welcome to Grizzzly"
    }
}
