

<%@ page import="grizzzly.Story" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
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
            <g:hasErrors bean="${storyInstance}">
            <div class="errors">
                <g:renderErrors bean="${storyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="story.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${storyInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="owner"><g:message code="story.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${grizzzly.Member.list()}" optionKey="id" value="${storyInstance?.owner?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="asA"><g:message code="story.asA.label" default="As A" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'asA', 'errors')}">
                                    <g:select name="asA.id" from="${grizzzly.Actor.list()}" optionKey="id" value="${storyInstance?.asA?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="iWantTo"><g:message code="story.iWantTo.label" default="IW ant To" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'iWantTo', 'errors')}">
                                    <g:textField name="iWantTo" value="${storyInstance?.iWantTo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="soThat"><g:message code="story.soThat.label" default="So That" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'soThat', 'errors')}">
                                    <g:textField name="soThat" value="${storyInstance?.soThat}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="iteration"><g:message code="story.iteration.label" default="Iteration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'iteration', 'errors')}">
                                    <g:select name="iteration.id" from="${grizzzly.Iteration.list()}" optionKey="id" value="${storyInstance?.iteration?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="requirement"><g:message code="story.requirement.label" default="Requirement" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: storyInstance, field: 'requirement', 'errors')}">
                                    <g:select name="requirement.id" from="${grizzzly.Requirement.list()}" optionKey="id" value="${storyInstance?.requirement?.id}"  />
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
