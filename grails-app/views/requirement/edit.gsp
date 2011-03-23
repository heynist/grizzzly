

<%@ page import="grizzzly.Requirement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
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
            <g:hasErrors bean="${requirementInstance}">
            <div class="errors">
                <g:renderErrors bean="${requirementInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${requirementInstance?.id}" />
                <g:hiddenField name="version" value="${requirementInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="importance"><g:message code="requirement.importance.label" default="Importance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'importance', 'errors')}">
                                    <g:select name="importance" from="${requirementInstance.constraints.importance.inList}" value="${requirementInstance?.importance}" valueMessagePrefix="requirement.importance"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="requirement.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${requirementInstance.constraints.status.inList}" value="${requirementInstance?.status}" valueMessagePrefix="requirement.status"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code"><g:message code="requirement.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${requirementInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iterations"><g:message code="requirement.iterations.label" default="Iterations" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'iterations', 'errors')}">
                                    <g:select name="iterations" from="${grizzzly.Iteration.list()}" multiple="yes" optionKey="id" size="5" value="${requirementInstance?.iterations*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="requirement.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${requirementInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="requirement.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${grizzzly.Member.list()}" optionKey="id" value="${requirementInstance?.owner?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="project"><g:message code="requirement.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'project', 'errors')}">
                                    <g:select name="project.id" from="${grizzzly.Project.list()}" optionKey="id" value="${requirementInstance?.project?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stories"><g:message code="requirement.stories.label" default="Stories" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'stories', 'errors')}">
                                    
<ul>
<g:each in="${requirementInstance?.stories?}" var="s">
    <li><g:link controller="story" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="story" action="create" params="['requirement.id': requirementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'story.label', default: 'Story')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subRequirementOf"><g:message code="requirement.subRequirementOf.label" default="Sub Requirement Of" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: requirementInstance, field: 'subRequirementOf', 'errors')}">
                                    <g:select name="subRequirementOf.id" from="${grizzzly.Requirement.list()}" optionKey="id" value="${requirementInstance?.subRequirementOf?.id}"  />
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
