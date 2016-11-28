

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "login"(view:"/login/index")
		"home"(view:"/login/home")
		"logout"(view:"/logout")
		"bloqueio"(view:"/bloqueio")
        "500"(view:'/error')
        "404"(view:'/notFound')
}
}
