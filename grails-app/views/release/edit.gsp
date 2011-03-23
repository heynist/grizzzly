

<%@ page import="grizzzly.Release" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'release.label', default: 'Release')}" />
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
            <g:hasErrors bean="${releaseInstance}">
            <div class="errors">
                <g:renderErrors bean="${releaseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${releaseInstance?.id}" />
                <g:hiddenField name="version" value="${releaseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="release.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${releaseInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iterations"><g:message code="release.iterations.label" default="Iterations" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'iterations', 'errors')}">
                                    
<ul>
<g:each in="${releaseInstance?.iterations?}" var="i">
    <li><g:link controller="iteration" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="iteration" action="create" params="['release.id': releaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'iteration.label', default: 'Iteration')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="project"><g:message code="release.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'project', 'errors')}">
                                    <g:select name="project.id" from="${grizzzly.Project.list()}" optionKey="id" value="${releaseInstance?.project?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="releaseDate"><g:message code="release.releaseDate.label" default="Release Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'releaseDate', 'errors')}">
                                    <g:datePicker name="releaseDate" precision="day" value="${releaseInstance?.releaseDate}"  />
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
