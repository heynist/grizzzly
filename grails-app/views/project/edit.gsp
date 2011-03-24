

<%@ page import="grizzzly.Project" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
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
            <g:hasErrors bean="${projectInstance}">
            <div class="errors">
                <g:renderErrors bean="${projectInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${projectInstance?.id}" />
                <g:hiddenField name="version" value="${projectInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="project.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${projectInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code"><g:message code="project.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${projectInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="project.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${grizzzly.User.list()}" optionKey="id" value="${projectInstance?.owner?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="modules"><g:message code="project.modules.label" default="Modules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'modules', 'errors')}">
                                    
<ul>
<g:each in="${projectInstance?.modules?}" var="m">
    <li><g:link controller="moduleInstance" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="moduleInstance" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moduleInstance.label', default: 'ModuleInstance')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="members"><g:message code="project.members.label" default="Members" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'members', 'errors')}">
                                    
<ul>
<g:each in="${projectInstance?.members?}" var="m">
    <li><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="member" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'member.label', default: 'Member')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="releases"><g:message code="project.releases.label" default="Releases" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'releases', 'errors')}">
                                    
<ul>
<g:each in="${projectInstance?.releases?}" var="r">
    <li><g:link controller="release" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="release" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'release.label', default: 'Release')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requirements"><g:message code="project.requirements.label" default="Requirements" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'requirements', 'errors')}">
                                    
<ul>
<g:each in="${projectInstance?.requirements?}" var="r">
    <li><g:link controller="requirement" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="requirement" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requirement.label', default: 'Requirement')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="roles"><g:message code="project.roles.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'roles', 'errors')}">
                                    
<ul>
<g:each in="${projectInstance?.roles?}" var="r">
    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="role" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'role.label', default: 'Role')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="actors"><g:message code="project.actors.label" default="Actors" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'actors', 'errors')}">
                                    
<ul>
<g:each in="${projectInstance?.actors?}" var="a">
    <li><g:link controller="actor" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="actor" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'actor.label', default: 'Actor')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subProjectOf"><g:message code="project.subProjectOf.label" default="Sub Project Of" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'subProjectOf', 'errors')}">
                                    <g:select name="subProjectOf.id" from="${grizzzly.Project.list()}" optionKey="id" value="${projectInstance?.subProjectOf?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="website"><g:message code="project.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${projectInstance?.website}" />
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
