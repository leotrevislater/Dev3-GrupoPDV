package pdv

import javax.websocket.Session;

class BloqueioController {
	
	def index() {
		render(view: "..bloqueio")
	}
	
	def desbloquear() {
		System.out.println("\n\n\n\n\n Desbloqueio\n\n\n\n\n")
		
		def usuario = Usuario.sefindByUsernameAndPassword(params.username, params.password)
		def usurioSessao = Session.getProperties("user")
		if(usuario == usurioSessao){
//		if(usuario != null){
			flash.message = "Olá ${usuario.getUsername()}!"
			redirect(controller:"home", action:"index")
			render(view: "../login/home")
		}
		else{
		  flash.message = "Usuario ou senha incorreto. Por favor, tente novamente."
		  redirect(controller:"bloqueio", action:"index")
		  render(view: "../bloqueio")
		}
		
	}
}
