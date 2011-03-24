

<%@ page import="grizzzly.ModulePropertyInstance" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance')}" />
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
            <g:hasErrors bean="${modulePropertyInstanceInstance}">
            <div class="errors">
                <g:renderErrors bean="${modulePropertyInstanceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moduleInstance"><g:message code="modulePropertyInstance.moduleInstance.label" default="Module Instance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstanceInstance, field: 'moduleInstance', 'errors')}">
                                    <g:select name="moduleInstance.id" from="${grizzzly.ModuleInstance.list()}" optionKey="id" value="${modulePropertyInstanceInstance?.moduleInstance?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="moduleProperty"><g:message code="modulePropertyInstance.moduleProperty.label" default="Module Property" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstanceInstance, field: 'moduleProperty', 'errors')}">
                                    <g:select name="moduleProperty.id" from="${grizzzly.ModuleProperty.list()}" optionKey="id" value="${modulePropertyInstanceInstance?.moduleProperty?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value"><g:message code="modulePropertyInstance.value.label" default="Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstanceInstance, field: 'value', 'errors')}">
                                    <g:textField name="value" value="${modulePropertyInstanceInstance?.value}" />
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
