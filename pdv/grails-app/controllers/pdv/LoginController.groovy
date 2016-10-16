package pdv

class LoginController {
	//def scaffold = Usuario
	
	def index() {
		render(view: "login")
	}
	
	def autenticar() {

		def usuario = Usuario.findByUsernameAndPassword(params.username, params.password)
		if(usuario != null){
			session.setAttribute("user", usuario)
			flash.message = "Hello ${usuario.getUsername()}!"
			redirect(controller:"entry", action:"login")
		}
		else{
		  flash.message = "Usuario ou senha incorreto. Por favor, tente novamente."
		  redirect(action:"login")
		}
	  }

	def logout() {
		flash.message = "Goodbye ${session.user.username}"
		session.user = null
		redirect(controller:"entry", action:"login")
	}
}
