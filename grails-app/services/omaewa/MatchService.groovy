package omaewa

import grails.gorm.services.Service


interface IMatchService {

    Match get(Serializable id)

    List<Match> list(Map args)

    Long count()

    void delete(Serializable id)

    Match save(Match match)

}

@Service(Match)
abstract class MatchService implements IMatchService {

    List<Match> listToPlay(Map args) {
        return Match.createCriteria().list(args) {
            order('date', 'asc')
            eq('state', Match.pendingState)
        }
    }

    List<Match> listPlayed(Map args) {
        return Match.createCriteria().list(args) {
            if(!args.sort) {
                order('date', 'desc')
            }
            or {
                eq('state', Match.loseState)
                eq('state', Match.winState)
            }
        }
    }

    def makeWon(Match match) {
        match.state = Match.winState
        save(match)
    }

    def makeLost(Match match) {
        match.state = Match.loseState
        save(match)
    }

}