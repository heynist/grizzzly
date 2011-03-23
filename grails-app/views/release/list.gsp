
<%@ page import="grizzzly.Release" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'release.label', default: 'Release')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'release.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'release.name.label', default: 'Name')}" />
                        
                            <th><g:message code="release.project.label" default="Project" /></th>
                        
                            <g:sortableColumn property="releaseDate" title="${message(code: 'release.releaseDate.label', default: 'Release Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${releaseInstanceList}" status="i" var="releaseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${releaseInstance.id}">${fieldValue(bean: releaseInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: releaseInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: releaseInstance, field: "project")}</td>
                        
                            <td><g:formatDate date="${releaseInstance.releaseDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${releaseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
