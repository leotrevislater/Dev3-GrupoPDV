package pdv

import javax.websocket.Session;

class BloqueioController {
	
	def index() {
		if(session.getAttribute('user') == null) {
			redirect(controller: 'login', action: 'index')
		}
		else {
			render(view: "../bloqueio")
		}
	}
	
	def desbloquear() {
		System.out.println("\n\n\n\n\n Desbloqueio\n\n\n\n\n")
		
		def usuario = Usuario.findByUsernameAndPassword(params.username, params.password)
		def usuarioSessao = session.getAttribute('user')

		if(usuario != null && usuario.id == usuarioSessao.id){
			flash.message = "Bem-vindo, ${usuario.getUsername()}!"
			redirect(controller:"home", action:"index")
			render(controller:'login', action: 'index')
		}
		else{
		  flash.message = "Usuario ou senha incorreto. Por favor, tente novamente."
		  redirect(controller:"bloqueio", action:"index")
		  render(view: "../bloqueio")
		}
		
	}
}
