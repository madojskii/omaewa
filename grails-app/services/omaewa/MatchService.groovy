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

}