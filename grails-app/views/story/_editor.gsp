<div id="editor">
	<p>
		<label for="grzlUuid"><g:message code="story.grzlUuid.label" default="Grzl Uuid" /></label>
		<g:textField class="value ${hasErrors(bean: storyInstance, field: 'grzlUuid', 'errors')}"
			name="grzlUuid"
			value="${storyInstance?.grzlUuid}" />
	</p>

	<p>
		<label for="code"><g:message code="story.code.label" default="Code" /></label>
		<g:textField class="value ${hasErrors(bean: storyInstance, field: 'code', 'errors')}"
			name="code"
			value="${storyInstance?.code}" />
	</p>

	<p>
		<label for="name"><g:message code="story.name.label" default="Name" /></label>
		<g:textField class="value ${hasErrors(bean: storyInstance, field: 'name', 'errors')}"
			name="name" 
			value="${storyInstance?.name}" />
	</p>

	<p>
		<label for="owner"><g:message code="story.owner.label" default="Owner" /></label>
		<g:select name="owner.id" 
			from="${grizzzly.Member.list()}" 
			optionKey="id" 
			value="${storyInstance?.owner?.id}" 
			noSelection="['null': '']" />
	</p>

	<p>
		<label for="asA"><g:message code="story.asA.label" default="As A" /></label>
		<g:select class="value ${hasErrors(bean: storyInstance, field: 'asA', 'errors')}"
			name="asA.id" 
			from="${grizzzly.Actor.list()}" 
			optionKey="id" 
			value="${storyInstance?.asA?.id}" 
			noSelection="['null': '']" />
	</p>


	<p>
		<label for="iWantTo"><g:message code="story.iWantTo.label" default="IW ant To" /></label>
		<g:textField class="value ${hasErrors(bean: storyInstance, field: 'iWantTo', 'errors')}"
			name="iWantTo" 
			value="${storyInstance?.iWantTo}" />
	</p>

	<p>
		<label for="soThat"><g:message code="story.soThat.label" default="So That" /></label>
		<g:textField class="value ${hasErrors(bean: storyInstance, field: 'soThat', 'errors')}"
			name="soThat" 
			value="${storyInstance?.soThat}" />
	</p>

	<p>
		<label for="iteration"><g:message code="story.iteration.label" default="Iteration" /></label>
		<g:select class="value ${hasErrors(bean: storyInstance, field: 'iteration', 'errors')}"
			name="iteration.id" 
			from="${grizzzly.Iteration.list()}" 
			optionKey="id" 
			value="${storyInstance?.iteration?.id}" 
			noSelection="['null': '']" />
	</p>

	<p>
		<label for="requirement"><g:message code="story.requirement.label" default="Requirement" /></label>
		<g:select class="value ${hasErrors(bean: storyInstance, field: 'requirement', 'errors')}"
			name="requirement.id" 
			from="${grizzzly.Requirement.list()}" 
			optionKey="id" 
			value="${storyInstance?.requirement?.id}" 
			noSelection="['null': '']" />
	</p>

	<p>
		<label for="subStoryOf"><g:message code="story.subStoryOf.label" default="Sub Story Of" /></label>
		<g:select class="value ${hasErrors(bean: storyInstance, field: 'subStoryOf', 'errors')}"
			name="subStoryOf.id" 
			from="${grizzzly.Story.list()}" 
			optionKey="id" 
			value="${storyInstance?.subStoryOf?.id}" 
			noSelection="['null': '']" />
	</p>

	<p>
		<label for="currentState"><g:message code="story.currentState.label" default="Current State" /></label>
		<g:textField class="value ${hasErrors(bean: storyInstance, field: 'currentState', 'errors')}"
			name="currentState" 
			value="${storyInstance?.currentState}" />
	</p>
</div>
