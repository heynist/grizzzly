var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}


$(document).ready(function() {
	

	
	$( ".draggable" ).draggable();

	function updateStory(storyId) {
		$.ajax({
			url: "/grizzzly/story/show/" + storyId,
			context: document.body,
			success: function(data){
				$('#storyDetails' + storyId).html(data);
				$('#storyDetails' + storyId).effect('highlight');
			}
		});
	}
	
	function handleData(data) {
		var type = data.substr(0,1);
		switch(type) {
			case 'r':
				var command = data.slice(3);
				var index = command.indexOf("||");
				var element = command.slice(0, index);
				var text = command.slice(index+2);
				$('#' + element).text(text).effect('highlight');
				break; 
			case 'a':
				var command = data.slice(3);
				var index = command.indexOf("||");
				var element = command.slice(0, index);
				var text = command.slice(index+2);
				$('#' + element).append(text);
				break; 
			case 'g':
				var command = data.slice(3);
				var index = command.indexOf("||");
				var entityName = command.slice(0, index);
				var entityId = command.slice(index+2);
				updateStory(entityId);
				break; 
			case 'n':
				var toast = data.substr(3,1);
				var method = null;
				switch(toast) {
					case 'n':
						method='showNoticeToast';
						break;
					case 'w':
						method='showWarningToast';
						break;
					case 'e':
						method='showErrorToast';
						break;
					case 's':
						method='showSuccessToast';
						break;
				}
				if (method) {
					var text = data.slice(6);
					$().toastmessage(method, text);
				}
				break;
		}
	}
});
