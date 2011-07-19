<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Live console</title>

        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<atmosphere:resources/>
		<g:javascript>
			 $(document).ready(function() {
	            var consoleCallbackAdded = false;

	            function subscribeToConsole() {
	                function callbackConsole(response) {
	                    var detectedTransport = response.transport;
	                    if (response.transport != 'polling' && response.state != 'connected' && response.state != 'closed') {
	                        if (response.status == 200) {
	                            var data = response.responseBody;
	                            if (data.length > 0) {
								    $('ul').prepend($('<li></li>').text(data));
	                            }
	                        }
	                    }
	                }
	                
	                var location = 'http://' + window.location.host + '/grizzzly/atmosphere/console';
	                $.atmosphere.subscribe(location, !consoleCallbackAdded ? callbackConsole : null,
	                        $.atmosphere.request = { transport: 'websocket' });
	                consoleCallbackAdded = true;
	            }
	            
				//subscribeToConsole();
			 });
    	</g:javascript>
    </head>
    <body>
        <div class="body">
            <div id="console"><ul></ul></div>
        </div>
    </body>
</html>
