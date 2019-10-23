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

    List<Match> list(Map args) {
        return Match.createCriteria().list(args) {
            if(!args.sort) {
                order('date', 'asc')
                order('state', 'asc')
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