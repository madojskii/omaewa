package omaewa

class Match {

    Date date
    String teamName
    String lobbyUrl
    String league
    MatchState state

    static constraints = {
        state nullable: true

    }

    static mapping = {
    }
}
