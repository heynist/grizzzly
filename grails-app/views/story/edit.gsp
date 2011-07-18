<div id="story${storyInstance.id}">
	<g:hasErrors bean="${storyInstance}">
		<div class="errors">
			<g:renderErrors bean="${storyInstance}" as="list" />
		</div>
	</g:hasErrors>
	<g:formRemote 
		name="editorForm"
		url="[action: 'update', id:storyInstance.id]"
		update="storyDetails${storyInstance.id}">
		
		<g:render template="editor"
			model="[storyInstance:storyInstance]"/>
			
		<div id="editButtons">
			<g:submitButton name="save" value="Save"/>
			<g:submitToRemote
				url="[action:'show',id:storyInstance.id]"
				update="storyDetails${storyInstance.id}"
				name="cancel"
				value="Cancel" />
		</div>
	</g:formRemote>
</div>
