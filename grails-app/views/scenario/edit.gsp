

<%@ page import="grizzzly.Scenario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'scenario.label', default: 'Scenario')}" />
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
            <g:hasErrors bean="${scenarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${scenarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${scenarioInstance?.id}" />
                <g:hiddenField name="version" value="${scenarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="code"><g:message code="scenario.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'code', 'errors')}">
                                    <g:textField name="code" value="${scenarioInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="givenClause"><g:message code="scenario.givenClause.label" default="Given Clause" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'givenClause', 'errors')}">
                                    <g:textField name="givenClause" value="${scenarioInstance?.givenClause}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="whenClause"><g:message code="scenario.whenClause.label" default="When Clause" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'whenClause', 'errors')}">
                                    <g:textField name="whenClause" value="${scenarioInstance?.whenClause}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="thenClause"><g:message code="scenario.thenClause.label" default="Then Clause" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'thenClause', 'errors')}">
                                    <g:textField name="thenClause" value="${scenarioInstance?.thenClause}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="iteration"><g:message code="scenario.iteration.label" default="Iteration" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'iteration', 'errors')}">
                                    <g:select name="iteration.id" from="${grizzzly.Iteration.list()}" optionKey="id" value="${scenarioInstance?.iteration?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="scenario.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${grizzzly.Member.list()}" optionKey="id" value="${scenarioInstance?.owner?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="requirement"><g:message code="scenario.requirement.label" default="Requirement" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: scenarioInstance, field: 'requirement', 'errors')}">
                                    <g:select name="requirement.id" from="${grizzzly.Requirement.list()}" optionKey="id" value="${scenarioInstance?.requirement?.id}"  />
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
