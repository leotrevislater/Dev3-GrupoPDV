package pdv

class HomeController {
	
	def index() {
		render(view: "../login/home")
	}
	
	def bloquear() {
		render(view: "../bloqueio")
	}
	
	def logout() {
		render(view: "../logout")
	}
	
}
