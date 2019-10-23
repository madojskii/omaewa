package omaewa

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        new Requestmap(url: "/**", configAttribute: "IS_AUTHENTICATED_ANONYMOUSLY").save(flush: true)
        springSecurityService.clearCachedRequestmaps()
    }
    def destroy = {
    }
}
