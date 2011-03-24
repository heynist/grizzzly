

<%@ page import="grizzzly.ModuleInstance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moduleInstance.label', default: 'ModuleInstance')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${moduleInstanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${moduleInstanceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project"><g:message code="moduleInstance.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moduleInstanceInstance, field: 'project', 'errors')}">
                                    <g:select name="project.id" from="${grizzzly.Project.list()}" optionKey="id" value="${moduleInstanceInstance?.project?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="module"><g:message code="moduleInstance.module.label" default="Module" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moduleInstanceInstance, field: 'module', 'errors')}">
                                    <g:select name="module.id" from="${grizzzly.Module.list()}" optionKey="id" value="${moduleInstanceInstance?.module?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
