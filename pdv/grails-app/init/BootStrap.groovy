import pdv.Usuario
import pdv.Papel

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = new Papel('ROLE_USER').save()

        def me = new Usuario('usr', '123').save()

        UsuarioPapel.create me, userRole

        UsuarioPapel.withSession {
            it.flush()
            it.clear()
        }
    }

    def destroy = {
    }
}
