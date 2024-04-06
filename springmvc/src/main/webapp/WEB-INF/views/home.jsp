<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
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

nav {
	padding: 20px;
}

li {
	display: inline-block;
	margin-left: 5px;
}

a {
	margin: 5px;
	padding: 10px;
	background-color: black;
	color: white;
	box-shadow: 0px 0px 5px white;
	border-radius: 10px;
	text-decoration: none;
}

nav ul {
	margin-left: 50%;
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
	padding-top: 10px;
}

input {
	display: block;
	background: none;
	color: white;
	border: none;
	border-bottom: 2px solid white;
	margin: 18px auto;
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
	margin: 50px;
}

nav {
	margin-top: 50px;
}
main{
margin-top: 50px;
}
</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href="home">HOME</a></li>
			<li><a href="#">CONTACT</a></li>
			<li><a href="aboutus">ABOUT US</a></li>
			<li><a href="sign_out">SIGN OUT</a></li>
			<li><a href="deleteuser">DELETE ACCOUNT</a></li>
		</ul>
	</nav>
	<main align ="center">
		<h1>Car Dekho</h1>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h2><%=message%></h2>
		<%
		}
		%>
		<div id="options">
			<a href="allcars">All Cars</a> <a href="addpage">Add Car</a> <a
				href="mycars">My Cars</a>
		</div>
	</main>
</body>
</html>