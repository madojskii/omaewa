package omaewa

class Match {

    Date date
    String teamName
    String lobbyUrl
    String league
    MatchState state = MatchState.PENDING

    static constraints = {
        state nullable: true
        teamName nullable: true
    }

    static mapping = {
    }

    static def getWinState() {
        return MatchState.WIN
    }

    static def getLoseState() {
        return MatchState.LOSE
    }
}
