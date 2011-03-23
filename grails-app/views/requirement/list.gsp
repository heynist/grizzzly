
<%@ page import="grizzzly.Requirement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'requirement.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="importance" title="${message(code: 'requirement.importance.label', default: 'Importance')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'requirement.status.label', default: 'Status')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'requirement.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'requirement.name.label', default: 'Name')}" />
                        
                            <th><g:message code="requirement.owner.label" default="Owner" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${requirementInstanceList}" status="i" var="requirementInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${requirementInstance.id}">${fieldValue(bean: requirementInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: requirementInstance, field: "importance")}</td>
                        
                            <td>${fieldValue(bean: requirementInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: requirementInstance, field: "code")}</td>
                        
                            <td>${fieldValue(bean: requirementInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: requirementInstance, field: "owner")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${requirementInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
