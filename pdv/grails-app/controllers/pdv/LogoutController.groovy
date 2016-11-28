package pdv

class LogoutController {
	

	def sair() {
		flash.message = ""
		session.removeAttribute('user')
		redirect(controller:"login", action:"index")
		render(view: "../login/index")
	}
	
	def cancelar() {
		redirect(controller:"home", action:"index")
		render(view: "../login/home")
	}
	
}