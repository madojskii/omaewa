package omaewa

enum MatchState {

    PENDING(0, '', ''),
    LOSE(-1, 'oddLose', 'evenLose'),
    WIN(1, 'oddWin', 'evenWin')

    Long id
    String odd
    String even
    MatchState(Long id, String odd, String even) {
        this.id = id
        this.odd = odd
        this.even = even
    }
}