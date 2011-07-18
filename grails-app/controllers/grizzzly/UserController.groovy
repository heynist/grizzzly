package grizzzly

class UserController {
	static scaffold = true
	
	def login = {
	println "UserController::login"
		if (session.user) {
		//	redirect(controller:'story', action: 'list')
		} 
	}
	
	def handleLogin = {
		def user = User.findByLogin ( params.login )
		if (user) {
			session.user = user
			def msg = "notification||notice||" + user.firstName + " " + user.lastName + " has joined"
			//broadcaster['/atmosphere/events'].broadcast(msg)
			if (session.eventBroadcaster)
				session.eventBroadcaster.broadcast(msg)
			redirect(controller:'story', action: 'list')
		} else {
			flash.message = "User not found for login ${params.login}"
			redirect(action:login)
		}
	}
	
	def logout = {
		//def msg = "notification||notice||" + session.user.firstName + " " + session.user.lastName + " has left us"
		//broadcaster['/atmosphere/events'].broadcast(msg)
		session.user = null
		redirect(action: login)
	}
}
