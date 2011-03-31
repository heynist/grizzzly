package grizzzly

description "This story is about managing releases"


narrative "create releases for a project(does not really do what I want : does not go to database, since you can not test save due to flash messages)", {
 as a "product owner"
 i want "manager releases"
 so that "I can plan my projects"
}

scenario "Adding two releases to a project", {
def customers = [:] 
def users = [:] 
def projects = [:] 
def releases = [:] 

 given "a customer", {
       mockController CustomerController
       customerController = new CustomerController()
       customerController.params.name="Cronos"
       customers=customerController.create()
 }
 and "a user as product owner", {
       mockController UserController
       userController = new UserController()
       userController.params.login="PO"
       userController.params.firstName="PO"
       userController.params.lastName="PO"
       userController.params.customer=customers["customerInstance"]
       users=userController.create()
 }
 and "a project", {
       mockController ProjectController
       projectController = new ProjectController()
       projectController.params.name="MyProject"
       projectController.params.code="MPx"
       projectController.params.owner=users["userInstance"]
       projects=projectController.create()
 }

 when "adding two releases", {
       mockController ReleaseController
       releaseController = new ReleaseController()
       releaseController.params.name="rel001"
       releaseController.params.releaseDate=new Date()
       releaseController.params.project=projects["projectInstance"]
       releases.putAt("rel001",releaseController.create()["releaseInstance"])
       releaseController.params.name="rel002"
       releaseController.params.releaseDate=new Date()
       releaseController.params.project=projects["projectInstance"]
       releases.putAt("rel002",releaseController.create()["releaseInstance"])
 }

 then "the product owner can list the releases", {
       releases["rel001"].project.name.shouldBe "MyProject"
 }
}
