package pdv

class UsuarioController {
	//def scaffold = Usuario
	
	def login() {}
	
	def autenticar() {

		def usuario = Usuario.findByUsernameAndPassword(params.username, params.password)
		if(usuario != null){
			System.out.println('Ecoto')
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
