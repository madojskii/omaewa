package omaewa

enum MatchState {

    PENDING(0),
    LOSE(-1),
    WIN(1)

    Long id

    MatchState(Long id) {
        this.id = id
    }
}