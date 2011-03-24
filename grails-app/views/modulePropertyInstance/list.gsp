
<%@ page import="grizzzly.ModulePropertyInstance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'modulePropertyInstance.id.label', default: 'Id')}" />
                        
                            <th><g:message code="modulePropertyInstance.moduleInstance.label" default="Module Instance" /></th>
                        
                            <th><g:message code="modulePropertyInstance.moduleProperty.label" default="Module Property" /></th>
                        
                            <g:sortableColumn property="value" title="${message(code: 'modulePropertyInstance.value.label', default: 'Value')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${modulePropertyInstanceInstanceList}" status="i" var="modulePropertyInstanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${modulePropertyInstanceInstance.id}">${fieldValue(bean: modulePropertyInstanceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: modulePropertyInstanceInstance, field: "moduleInstance")}</td>
                        
                            <td>${fieldValue(bean: modulePropertyInstanceInstance, field: "moduleProperty")}</td>
                        
                            <td>${fieldValue(bean: modulePropertyInstanceInstance, field: "value")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${modulePropertyInstanceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
