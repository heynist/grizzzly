<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grizzzly Platform" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'js/jquery/css',file:'jquery.toastmessage.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript library="jquery" plugin="jquery"/>
        <g:javascript library="application" />
		<style type="text/css" media="screen">
			#eventWrapper {
				position:absolute;
				top: 0px;
				width: 25em;
				left: 300px;
				margin: 0 auto;
			}

			#signInOutWrapper {
				position:absolute;
				top: 0px;
				width: 25em;
				left: 600px;
				margin: 0 auto;
			}
			
			.events {
				background-color: lightblue;
				border: 1px solid darkblue;
				color: blue;
				padding: 5px;
			}

			.signInOut {
				background-color: lightgreen;
				border: 1px solid darkgreen;
				color: blue;
				padding: 5px;
			}
			
			.searchbar {
				margin-top: 10px;
				background-color: lightgrey;
				border: 1px solid darkgrey;
				width: 97%;
				height: 30px;
				padding: 5px;
			}

			.search {
				float: right;
				color: white;
			}
			.pageContent {
				width: 97%;
			}
			#grizzzlyLogo h1 { 
				margin-top: 5px;
				margin-right: 30px;
				float: right;
			}
			.listItemHeader {
				font-size: 14px;
				color: red;
			}
			.listItemHeader a {
				font-size: 10px;
			}
		</style>

		<atmosphere:resources/>
		<jqui:resources/>

		<jq:plugin name="toastmessage"/>

		<jq:jquery>
			$('input:submit').button();
		</jq:jquery>
        
        <g:layoutHead />
        
        <jq:jquery>

	var connectedEndpointEvents;
	var locationEvents = 'http://' + window.location.host + '/grizzzly/atmosphere/events';

	function eventCallback(response) {
		//alert('callbackEvents');
		if (response.transport != 'polling' && response.state != 'connected' && response.state != 'closed') {
			if (response.status == 200) {
				var data = response.responseBody;
				$('#data1').text(data);
				if (data.length > 5) {
					handleData(data);
				}
			}
		}
	}
	
	function subscribeEvents() {
		//alert('subscribing to events');
		$.atmosphere.subscribe(locationEvents, eventCallback,
				$.atmosphere.request = { transport: 'websocket' });
		connectedEndpointEvents = $.atmosphere.response;
		//alert('subscribed to events');
	}
	

	$('#send1').click( function () {
		var text = $('#phrase').val();
		//alert('phrase: ' + text);
		connectedEndpointEvents.push(locationEvents,
                            null,
                            $.atmosphere.request = {data: 'message=' + text});
	});
	$('#sub1').click( function () {
		subscribeEvents();
	});



	var connectedEndpointStory;
	var locationStory = 'http://' + window.location.host + '/grizzzly/atmosphere/story';

	function storyCallback(response) {
		if (response.transport != 'polling' && response.state != 'connected' && response.state != 'closed') {
			if (response.status == 200) {
				var data = response.responseBody;
		alert('data: ' + data);
				$('#data2').text(data);
				if (data.length > 5) {
					handleData(data);
				}
			}
		}
	}

	function subscribeStory() {
		$.atmosphere.subscribe(locationStory, storyCallback,
				$.atmosphere.request = { transport: 'websocket' });
		connectedEndpointEvents = $.atmosphere.response;
	}

	$('#sub2').click( function () {
		subscribeStory();
	});
	
	$('#send2').click( function () {
		var text = $('#phrase').val();
		connectedEndpointStory.push(locationStory,
                            null,
                            $.atmosphere.request = {data: 'message=' + text});
	});
		</jq:jquery>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div><input type="button" id="sub1" value="subscribe to data1"/><span id="data1">data1...</span><input type="button" id="send1" value="send to data1"/></div>
        <div><input type="button" id="sub2" value="subscribe to data2"/><span id="data1">data2...</span><input type="button" id="send2" value="send to data2"/></div>
        <input type="text" id="phrase" name="phrase" value="message..."/>
        <div id="grizzzlyLogo">
			<a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a>
			<g:if test="${session.user}">
				<h1>You are signed in as ${session.user.firstName} ${session.user.lastName}</h1>
			</g:if>
        </div>
		<g:if test="${session.user}">
			<div class="searchbar">
				<div class="search">
					<g:form controller="story" action="search">
						<g:textField name="q" value="${params.q}"/> <g:submitButton name="search" value="search" />
					</g:form>
				</div>
			</div>
		</g:if>
		<div id="test">CLICK ME PLEASE</div>
        <g:layoutBody />
    </body>
</html>
