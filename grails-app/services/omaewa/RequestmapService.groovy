package omaewa

import grails.gorm.services.Service

interface IRequestmapService {

    Requestmap get(Serializable id)

    List<Requestmap> list(Map args)

    Long count()

    void delete(Serializable id)

    Requestmap save(Requestmap requestmap)

}
@Service(Requestmap)
abstract class RequestmapService implements IRequestmapService {

}
