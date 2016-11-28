package pdv

class LoginController {

	def index() {
		render(view: "index")
	}
	
	def autenticar() {

		def usuario = Usuario.findByUsernameAndPassword(params.username, params.password)
		if(usuario != null){
			session.setAttribute("user", usuario)
			session.user = usuario
			flash.message = "Hello ${usuario.getUsername()}!"
			render(view: "home")
		}
		else{
		  flash.message = "Usuario ou senha incorreto. Por favor, tente novamente."
			render(view: "index")
		}
	  }

	def logout() {
		render(view: "../logout")
	}
}
