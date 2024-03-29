package omaewa

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

class MatchController {

    MatchService matchService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def matchPlayed = matchService.listPlayed(params)
        def matchList = matchService.listToPlay(params)
        render view: 'index' , model:[matchList: matchList, matchCount: matchList.totalCount, matchPlayed: matchPlayed, fragment: params.tab]
    }

    def show(Long id) {
        respond matchService.get(id)
    }

    def create() {
        respond new Match(params)
    }

    def save(Match match) {
        if (match == null) {
            notFound()
            return
        }

        try {
            matchService.save(match)
        } catch (ValidationException e) {
            respond match.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'match.label', default: 'Match'), match.id])
                redirect match
            }
            '*' { respond match, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond matchService.get(id)
    }

    def update(Match match) {
        if (match == null) {
            notFound()
            return
        }

        try {
            matchService.save(match)
        } catch (ValidationException e) {
            respond match.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'match.label', default: 'Match'), match.id])
                redirect match
            }
            '*'{ respond match, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        matchService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'match.label', default: 'Match'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def wonMatch(Long id) {
        Match match = matchService.get(id)
        if(!match) {
            notFound()
            return
        }
        matchService.makeWon(match)
        flash.message = message(code: 'match.updated.state.successfuly')
        redirect action: "index"
    }

    def loseMatch(Long id) {
        Match match = matchService.get(id)
        if(!match) {
            notFound()
            return
        }
        matchService.makeLost(match)
        flash.message = message(code: 'match.updated.state.successfuly')
        redirect action: "index"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
