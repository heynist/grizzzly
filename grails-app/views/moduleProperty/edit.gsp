

<%@ page import="grizzzly.ModuleProperty" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'moduleProperty.label', default: 'ModuleProperty')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${modulePropertyInstance}">
            <div class="errors">
                <g:renderErrors bean="${modulePropertyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${modulePropertyInstance?.id}" />
                <g:hiddenField name="version" value="${modulePropertyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="module"><g:message code="moduleProperty.module.label" default="Module" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstance, field: 'module', 'errors')}">
                                    <g:select name="module.id" from="${grizzzly.Module.list()}" optionKey="id" value="${modulePropertyInstance?.module?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="moduleProperty.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${modulePropertyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataType"><g:message code="moduleProperty.dataType.label" default="Data Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstance, field: 'dataType', 'errors')}">
                                    <g:select name="dataType" from="${modulePropertyInstance.constraints.dataType.inList}" value="${modulePropertyInstance?.dataType}" valueMessagePrefix="moduleProperty.dataType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instances"><g:message code="moduleProperty.instances.label" default="Instances" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modulePropertyInstance, field: 'instances', 'errors')}">
                                    
<ul>
<g:each in="${modulePropertyInstance?.instances?}" var="i">
    <li><g:link controller="modulePropertyInstance" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="modulePropertyInstance" action="create" params="['moduleProperty.id': modulePropertyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'modulePropertyInstance.label', default: 'ModulePropertyInstance')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
