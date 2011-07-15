
<%@ page import="grizzzly.Story" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storyInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storyInstance, field: "code")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${storyInstance?.owner?.id}">${storyInstance?.owner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.asA.label" default="As A" /></td>
                            
                            <td valign="top" class="value"><g:link controller="actor" action="show" id="${storyInstance?.asA?.id}">${storyInstance?.asA?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.iWantTo.label" default="IW ant To" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storyInstance, field: "iWantTo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.soThat.label" default="So That" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storyInstance, field: "soThat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.iteration.label" default="Iteration" /></td>
                            
                            <td valign="top" class="value"><g:link controller="iteration" action="show" id="${storyInstance?.iteration?.id}">${storyInstance?.iteration?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.subStoryOf.label" default="Sub Story Of" /></td>
                            
                            <td valign="top" class="value"><g:link controller="story" action="show" id="${storyInstance?.subStoryOf?.id}">${storyInstance?.subStoryOf?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.subStories.label" default="Sub Stories" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${storyInstance.subStories}" var="s">
                                    <li><g:link controller="story" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="story.requirement.label" default="Requirement" /></td>
                            
                            <td valign="top" class="value"><g:link controller="requirement" action="show" id="${storyInstance?.requirement?.id}">${storyInstance?.requirement?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${storyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
