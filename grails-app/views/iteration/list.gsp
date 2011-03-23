
<%@ page import="grizzzly.Iteration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'iteration.label', default: 'Iteration')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'iteration.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'iteration.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="endDate" title="${message(code: 'iteration.endDate.label', default: 'End Date')}" />
                        
                            <th><g:message code="iteration.project.label" default="Project" /></th>
                        
                            <th><g:message code="iteration.release.label" default="Release" /></th>
                        
                            <g:sortableColumn property="startDate" title="${message(code: 'iteration.startDate.label', default: 'Start Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${iterationInstanceList}" status="i" var="iterationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${iterationInstance.id}">${fieldValue(bean: iterationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: iterationInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${iterationInstance.endDate}" /></td>
                        
                            <td>${fieldValue(bean: iterationInstance, field: "project")}</td>
                        
                            <td>${fieldValue(bean: iterationInstance, field: "release")}</td>
                        
                            <td><g:formatDate date="${iterationInstance.startDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${iterationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
