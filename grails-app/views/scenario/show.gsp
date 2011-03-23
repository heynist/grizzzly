
<%@ page import="grizzzly.Scenario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'scenario.label', default: 'Scenario')}" />
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
                            <td valign="top" class="name"><g:message code="scenario.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scenarioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scenarioInstance, field: "code")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.givenClause.label" default="Given Clause" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scenarioInstance, field: "givenClause")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.whenClause.label" default="When Clause" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scenarioInstance, field: "whenClause")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.thenClause.label" default="Then Clause" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: scenarioInstance, field: "thenClause")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.iteration.label" default="Iteration" /></td>
                            
                            <td valign="top" class="value"><g:link controller="iteration" action="show" id="${scenarioInstance?.iteration?.id}">${scenarioInstance?.iteration?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value"><g:link controller="member" action="show" id="${scenarioInstance?.owner?.id}">${scenarioInstance?.owner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="scenario.requirement.label" default="Requirement" /></td>
                            
                            <td valign="top" class="value"><g:link controller="requirement" action="show" id="${scenarioInstance?.requirement?.id}">${scenarioInstance?.requirement?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${scenarioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
