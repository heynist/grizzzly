<html>
	<head>
		<title>Login Page</title>
		<meta name="layout" content="main"/>
		<style type="text/css" media="screen">
			form { width: 300px; }
			input {
				position: absolute;
				left: 130 px;
			}
			p { margin-left: 30px; }
			.button { margin-top: 30px}
		</style>
	</head>
	<body>
		<div class="message">${flash.message}</div>
		<p>
			Welcome to the Grizzzly platform. Login below.
		</p>
		<form controller="user" action="handleLogin">
			<p>
				<label for="login">Login:</label>
				<input type="text" name="login" />
			</p>
			<input type="submit" value="Login" />
		</form>
	</body>
</html>
