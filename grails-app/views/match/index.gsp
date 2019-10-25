<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'match.label', default: 'CsgoMatch')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            $("#tabs").tabs();
            if ("${fragment}") {
                $('a[href^="#${fragment}"]').click()
            }
        })
    </script>
</head>

<body>
<div id="content-wrapper">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a class="home" href="${createLink(uri: '/')}"><g:message
                    code="default.home.label"/></a></li>
            <li class="breadcrumb-item"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                                          args="[entityName]"/></g:link></li>
        </ol>

        <div id="list-match" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div id="tabs">
                <ul>
                    <li><a href="#pending">${message(code: 'match.schedule')}</a></li>
                    <li><a href="#played">${message(code: 'match.played')}</a></li>
                </ul>
                <div id="pending">
                    <g:render template="matchTab" model="[ml: matchList, tab: 'pending']"/>
                </div>
                <div id="played">
                    <g:render template="matchTab" model="[ml: matchPlayed, tab: 'played']"/>
                </div>
            </div>
            %{--<div class="pagination">
                <g:paginate total="${matchCount ?: 0}"/>
            </div>--}%
        </div>
    </div>
</div>
</body>
</html>