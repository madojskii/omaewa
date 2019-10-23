<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'match.label', default: 'CsgoMatch')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div class="panel-body">
    <div id="list-match" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>${message(code: 'match.id.label')}</th>
                <th>${message(code: 'match.lobbyUrl.label')}</th>
                <th>${message(code: 'match.date.label')}</th>
                <th>${message(code: 'match.league.label')}</th>
                <th>${message(code: 'match.teamName.label')}</th>
                <th>${message(code: 'match.state.label')}</th>
                <th>${message(code: 'default.action')}</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${matchList}" var="csgo" status="i">
                <tr class="${i % 2 == 0 ? 'even' : 'odd'}">
                    <td>${csgo.id}</td>
                    <td><g:link url="${csgo.lobbyUrl}">link</g:link></td>
                    <td><g:formatDate date="${csgo.date}" formatName="format.dateTime"/> </td>
                    <td>${csgo.league}</td>
                    <td>${csgo.teamName}</td>
                    <td>${message(code: 'match.state.' + csgo.state.id)}</td>
                    <td><g:link action="edit" id="${csgo.id}"><i class="">edit</i> </g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${matchCount ?: 0}" />
        </div>
    </div>
</div>
</body>
</html>