package pdv

class UsuarioController {
	def scaffold = Usuario
	
	def login = {}
	
	def authenticate = {
		def user = User.findByLoginAndPassword(params.username, params.password)
		if(user){
		  session.user = user
		  flash.message = "Hello ${Usuario.username}!"
		  redirect(controller:"entry", action:"login")
		}else{
		  flash.message = "Sorry, ${params.username}. Please try again."
		  redirect(action:"login")
		}
	  }
	  
	  def logout = {
		flash.message = "Goodbye ${session.Usuario.username}"
		session.user = null
		redirect(controller:"entry", action:"login")
	  }
	
}
