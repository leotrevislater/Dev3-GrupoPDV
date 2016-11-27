package pdv

class LogoutController {
	
	
	
	def sair() {
		flash.message = ""
		session.user = null
		redirect(controller:"login", action:"index")
		render(view: "../login/index")
	}
	
	def cancelar() {
		redirect(controller:"home", action:"index")
		render(view: "../login/home")
	}
	
}