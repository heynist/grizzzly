
<%@ page import="grizzzly.Story" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'story.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'story.code.label', default: 'Code')}" />
                        
                            <th><g:message code="story.owner.label" default="Owner" /></th>
                        
                            <th><g:message code="story.asA.label" default="As A" /></th>
                        
                            <g:sortableColumn property="iWantTo" title="${message(code: 'story.iWantTo.label', default: 'IW ant To')}" />
                        
                            <g:sortableColumn property="soThat" title="${message(code: 'story.soThat.label', default: 'So That')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${storyInstanceList}" status="i" var="storyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${storyInstance.id}">${fieldValue(bean: storyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "code")}</td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "owner")}</td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "asA")}</td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "iWantTo")}</td>
                        
                            <td>${fieldValue(bean: storyInstance, field: "soThat")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${storyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
