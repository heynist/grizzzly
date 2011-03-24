
<%@ page import="grizzzly.ModuleInstance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moduleInstance.label', default: 'ModuleInstance')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'moduleInstance.id.label', default: 'Id')}" />
                        
                            <th><g:message code="moduleInstance.project.label" default="Project" /></th>
                        
                            <th><g:message code="moduleInstance.module.label" default="Module" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${moduleInstanceInstanceList}" status="i" var="moduleInstanceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${moduleInstanceInstance.id}">${fieldValue(bean: moduleInstanceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: moduleInstanceInstance, field: "project")}</td>
                        
                            <td>${fieldValue(bean: moduleInstanceInstance, field: "module")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${moduleInstanceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
