

<%@ page import="grizzzly.Iteration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'iteration.label', default: 'Iteration')}" />
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
            <g:hasErrors bean="${iterationInstance}">
            <div class="errors">
                <g:renderErrors bean="${iterationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${iterationInstance?.id}" />
                <g:hiddenField name="version" value="${iterationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="iteration.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${iterationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endDate"><g:message code="iteration.endDate.label" default="End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'endDate', 'errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${iterationInstance?.endDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="project"><g:message code="iteration.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'project', 'errors')}">
                                    <g:select name="project.id" from="${grizzzly.Project.list()}" optionKey="id" value="${iterationInstance?.project?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="release"><g:message code="iteration.release.label" default="Release" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'release', 'errors')}">
                                    <g:select name="release.id" from="${grizzzly.Release.list()}" optionKey="id" value="${iterationInstance?.release?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="scenarios"><g:message code="iteration.scenarios.label" default="Scenarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'scenarios', 'errors')}">
                                    
<ul>
<g:each in="${iterationInstance?.scenarios?}" var="s">
    <li><g:link controller="scenario" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="scenario" action="create" params="['iteration.id': iterationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'scenario.label', default: 'Scenario')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="startDate"><g:message code="iteration.startDate.label" default="Start Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'startDate', 'errors')}">
                                    <g:datePicker name="startDate" precision="day" value="${iterationInstance?.startDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stories"><g:message code="iteration.stories.label" default="Stories" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: iterationInstance, field: 'stories', 'errors')}">
                                    
<ul>
<g:each in="${iterationInstance?.stories?}" var="s">
    <li><g:link controller="story" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="story" action="create" params="['iteration.id': iterationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'story.label', default: 'Story')])}</g:link>

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
