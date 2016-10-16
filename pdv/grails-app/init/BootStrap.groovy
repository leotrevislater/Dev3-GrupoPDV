import pdv.Usuario

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def me = new Usuario('usr', '123').save()

        Usuario.withSession {
            it.flush()
            it.clear()
        }
    }

    def destroy = {
    }
}
