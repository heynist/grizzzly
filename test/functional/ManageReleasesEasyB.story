package grizzzly

using "geb-grails"



description "This story is about managing releases"


narrative "create releases for a project(with some problems when combinig easyb with geb)", {
  as a "product owner"
  i want "to manage releases"
  so that "I can plan my projects"
}

// Page objects do not yet work
//class WelcomePage extends Page {
//
//      static url = "http://localhost:8080/grizzzly" 
//
//      static at = { title == "Welcome to Grails" }
//
//}

scenario "Adding two releases to a project", {
def customerId
def projectId
def releaseName1
def releaseName2

def goToWelcome = {  
   go "http://localhost:8080/grizzzly" 
 }

// not working
def chooseController = { aController ->  
        //  contains does not work in easyb : def firstLink = $("a", text: contains(aController) )
        def mController=".*"+aController
        $("a").each { myit ->
           assert myit.text() !=  null
           if (myit.text() != null && myit.text() != "" ) {
              assert myit.text() != ""
              if (myit.text() ==~ mController ) {
                 def firstLink=myit // firstLink can only be used in this scope
                 assert firstLink.text() ==~ mController
                 // click works but Webdriver is not udated correctly : DSL interception problem
                 firstLink.click()
                 }
              }
           }  
 }

def chooseController2 = { aControllerPosition ->  
        def firstLink = $("a", aControllerPosition )
        firstLink.click()
 }

def goToCreateScreen = { 
        def cusCreateLink = $("a.create")
        assert cusCreateLink.text() ==~  "Invoeren.*"
        cusCreateLink.click()
 }

def doCreateOnScreen = { 
        $("input", name: "create").click()
 }

// given "a customer", {
// See below because geb directives do not work here
// }
// and "a user as product owner", {
// See below because geb directives do not work here
// }
// and "a project", {
// }

 when "adding a customer", {
// Adding Customer
        // go "http://localhost:8080/grizzzly" 
        //  Browser.drive(WelcomePage) { does  not work
        goToWelcome()
        //  chooseController("CustomerController") See above does not work
        chooseController2(2)
        goToCreateScreen()
        $("input", name: "name").value("Cronos")
        doCreateOnScreen()
        customerId=$("div.dialog").find("tr",0).find("td",1).text()
        assert customerId == "2"
 }
 when "adding a product owner as user", {
// Adding Product Owner as User
        goToWelcome()
        chooseController2(15)
        goToCreateScreen()
        $("input", name: "login").value("PO")
        $("select", name: "customer.id").value( customerId )
        $("input", name: "firstName").value("Product")
        $("input", name: "lastName").value("Owner")
        doCreateOnScreen()
        userId=$("div.dialog").find("tr",0).find("td",1).text()
        assert userId == "3"
        customerName=$("div.dialog").find("tr",2).find("td",1).text()
        assert customerName == "Cronos"
 }
 when "adding a project", {
// Adding Project
        goToWelcome()
        chooseController2(9)
        goToCreateScreen()
        $("input", name: "name").value("EasyBonGebonWebDriveronGrails")
        $("input", name: "code").value("EGWG")
        $("select", name: "owner.id").value( userId )
        doCreateOnScreen()
        projectId=$("div.dialog").find("tr",0).find("td",1).text()
        assert projectId == "2"
        ownerLogin=$("div.dialog").find("tr",3).find("td",1).text()
        assert ownerLogin == "PO (Owner Product)"
 }
// Adding two Releases (finally)
 when "adding two releases : release 1 and 2", {
        goToWelcome()
        chooseController2(10)
        goToCreateScreen()
        $("input", name: "name").value("rel001")
        $("select", name: "project.id").value( projectId )
        $("select", name: "releaseDate_day").value("31")
        $("select", name: "releaseDate_month").value("3")
        $("select", name: "releaseDate_year").value("2011")
        doCreateOnScreen()
        releaseName1=$("div.dialog").find("tr",1).find("td",1).text()
        assert releaseName1 == "rel001"
        releaseName1_date=$("div.dialog").find("tr",4).find("td",1).text()
        assert releaseName1_date ==~   "31-03-2011.*"
        goToWelcome()
        chooseController2(10)
        goToCreateScreen()
        $("input", name: "name").value("rel002")
        $("select", name: "project.id").value( projectId )
        $("select", name: "releaseDate_day").value("31")
        $("select", name: "releaseDate_month").value("5")
        $("select", name: "releaseDate_year").value("2011")
        doCreateOnScreen()
        releaseName2=$("div.dialog").find("tr",1).find("td",1).text()
        assert releaseName2 == "rel002"
        releaseName2_date=$("div.dialog").find("tr",4).find("td",1).text()
        assert releaseName2_date ==~   "31-05-2011.*"
        
 }

 then "the product owner can list the releases for the project", {
        goToWelcome()
        chooseController2(9)
        page.title.shouldBe "Project Overzicht"
        detailLink=$("tbody").find("tr",1).find("td",0).find("a")
        detailLink.click()
        page.title.shouldBe "Details Project"
        project=$("div", class:"dialog").find("tr",0).find("td",1).text()
        assert project == projectId
 }
 and "the product owner can see a release ", {
        aRelease=$("tbody").find("tr",6).find("td",1).find("li",0).find("a").text()
        assert aRelease.contains(releaseName1)||aRelease.contains(releaseName2)
 }
 and "the product owner can see that the project has 2 releases", {
        liSize=$("tbody").find("tr",6).find("td",1).find("li").size()
        liSize.shouldBe 2
 }
}
