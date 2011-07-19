<div id="storyDetails${storyInstance.id}">
	As a ${storyInstance.asA}, I want to ${storyInstance.iWantTo}, 
	<p>so that ${storyInstance.soThat}</p>
	<br/>
	<p>
		<g:remoteLink action="edit" id="${storyInstance.id}" update="storyDetails${storyInstance.id}">edit</g:remoteLink> | 
		<g:link action="delete" id="${storyInstance.id}"onclick="return confirm('Delete this story?')">delete</g:link>
	</p>
	<g:javascript>$('#storyName${storyInstance.id}').text('${storyInstance.name}');</g:javascript>
</div>
