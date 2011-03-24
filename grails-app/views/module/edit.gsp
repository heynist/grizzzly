

<%@ page import="grizzzly.Module" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
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
            <g:hasErrors bean="${moduleInstance}">
            <div class="errors">
                <g:renderErrors bean="${moduleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${moduleInstance?.id}" />
                <g:hiddenField name="version" value="${moduleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="module.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moduleInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${moduleInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instances"><g:message code="module.instances.label" default="Instances" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moduleInstance, field: 'instances', 'errors')}">
                                    
<ul>
<g:each in="${moduleInstance?.instances?}" var="i">
    <li><g:link controller="moduleInstance" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="moduleInstance" action="create" params="['module.id': moduleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="props"><g:message code="module.props.label" default="Props" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: moduleInstance, field: 'props', 'errors')}">
                                    
<ul>
<g:each in="${moduleInstance?.props?}" var="p">
    <li><g:link controller="moduleProperty" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="moduleProperty" action="create" params="['module.id': moduleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moduleProperty.label', default: 'ModuleProperty')])}</g:link>

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
