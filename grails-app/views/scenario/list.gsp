
<%@ page import="grizzzly.Scenario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'scenario.label', default: 'Scenario')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'scenario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'scenario.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="givenClause" title="${message(code: 'scenario.givenClause.label', default: 'Given Clause')}" />
                        
                            <g:sortableColumn property="whenClause" title="${message(code: 'scenario.whenClause.label', default: 'When Clause')}" />
                        
                            <g:sortableColumn property="thenClause" title="${message(code: 'scenario.thenClause.label', default: 'Then Clause')}" />
                        
                            <th><g:message code="scenario.iteration.label" default="Iteration" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${scenarioInstanceList}" status="i" var="scenarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${scenarioInstance.id}">${fieldValue(bean: scenarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: scenarioInstance, field: "code")}</td>
                        
                            <td>${fieldValue(bean: scenarioInstance, field: "givenClause")}</td>
                        
                            <td>${fieldValue(bean: scenarioInstance, field: "whenClause")}</td>
                        
                            <td>${fieldValue(bean: scenarioInstance, field: "thenClause")}</td>
                        
                            <td>${fieldValue(bean: scenarioInstance, field: "iteration")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${scenarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
