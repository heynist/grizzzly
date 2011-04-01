import geb.*
import org.openqa.selenium.firefox.FirefoxDriver

Browser.drive( new FirefoxDriver(), "http://localhost:8080/grizzzly/"){
go()
def controller = ".*CustomerController"
$("a").each { myit ->
       if ( myit.text() !=  null )
          println("-----------------------------"+myit.text() )
       if (myit.text() != null && myit.text() ==~ controller ) {
           println("*****"+myit.text() )
           }
          
       }
}