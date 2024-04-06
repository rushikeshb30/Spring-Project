<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CarDekho Home Page</title>
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	color: white;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2016/05/05/18/01/coupe-1374436_1280.jpg");
}

#login {
	width: 20%;
	height: 280px;
	margin: 20px auto;
	border: 2px solid white;
	border-radius: 20px;
	text-shadow: 0px 0px 10px black;
}

h3 {
	margin: 10px;
	padding-top: 10px;
	font-size: 15px;
}
#heading{
	margin-top: 15px;
}
main {
	margin-top: 100px;
}

input {
	display: block;
	background: none;
	color: white;
	border: none;
	border-bottom: 2px solid white;
	margin: 20px auto;
	background: none;
	font-size: 15px;
	text-align: center;
	outline: none;
}

input[type="submit"] {
	border-radius: 10px;
	padding: 10px;
	color: white;
	text-shadow: 0px 0px 10px black;
}

#options {
	margin: 25px;
}
</style>
</head>
<body>
	<main align="center">
		<h1>Welcome to Car Dekho</h1>
		<h2>Eye it - try it - buy it!</h2>
		<div id="login">
			<form action="check_user" method="post">
				<h2 id="heading">Signin Here!</h2>
				<input type="text" name="email" placeholder="Email"> 
				<input type="text" name="password" placeholder="Password"> 
				<input type="submit" value="Signin">
			</form>
			<h3>
				Not a member? <a href="sign_up">Sign Up</a>
			</h3>
		</div>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h2><%=message%></h2>
		<%
		}
		%>
	</main>
</body>
</html>