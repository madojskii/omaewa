<table class="table table-bordered">
    <thead>
    <tr>
        <th>${message(code: 'match.id.label')}</th>
        <g:sortableColumn property="date" titleKey="match.date.label" params="[max: params.max, offset: params.offset, tab: tab ]"/>
        <th>${message(code: 'match.league.label')}</th>
        <th>${message(code: 'match.teamName.label')}</th>
        <g:sortableColumn property="state" titleKey="match.state.label" params="[max: params.max, offset: params.offset, tab: tab ]"/>
        <th>${message(code: 'match.lobbyUrl.label')}</th>
        <th>${message(code: 'default.action')}</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${ml}" var="csgo" status="i">
        <tr class="${i % 2 == 0 ? csgo.state.even ?: 'even' : csgo.state.odd ?: 'odd'}">
            <td style="font-weight: bold">${csgo.id}</td>
            <td style="font-weight: bold"><g:formatDate date="${csgo.date}" formatName="format.dateTime"/></td>
            <td style="font-weight: bold">${csgo.league}</td>
            <td style="font-weight: bold">${csgo.teamName}</td>
            <td style="font-weight: bold">${message(code: 'match.state.' + csgo.state.id)}</td>
            <td style="font-weight: bold"><g:link url="${csgo.lobbyUrl}">link</g:link></td>
            <td>
                <g:link action="edit" id="${csgo.id}"><i class="fas fa-edit"></i></i></g:link>
                <g:link action="wonMatch" id="${csgo.id}"><i class="far fa-hand-point-up"></i></g:link>
                <g:link action="loseMatch" id="${csgo.id}"><i class="far fa-hand-point-down"></i></g:link>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>