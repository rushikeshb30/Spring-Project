<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
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
	padding: 20px 25px;
}

li {
	display: inline-block;
	margin: 10px;
}

a {
	padding: 10px;
	margin: 10px;
	background-color: black;
	color: white;
	box-shadow: 0px 0px 5px white;
	border-radius: 10px;
	text-decoration: none;
	background-color: black;
}

nav ul {
	margin-left: 65%;
}

#signup {
	width: 25%;
	height: 250px;
	margin: 20px auto;
	padding: 25px;
	border: 2px solid white;
	border-radius: 20px;
	text-shadow: 0px 0px 10px black;
	border: 2px solid white;
}

input {
	display: block;
	background: none;
	color: white;
	border: none;
	border-bottom: 2px solid white;
	margin: 15px auto;
	font-size: 15px;
}

input[type="submit"] {
	border-radius: 10px;
	padding: 10px;
	color: white;
	text-shadow: 0px 0px 10px white;
}
.label{
	font-size: 15px;
}
</style>
</head>
<body>
	<div>
		<div>
			<nav>
				<ul>
					<li><a href="home">HOME</a></li>
					<li><a href="#">CONTACT</a></li>
					<li><a href="#">ABOUT</a></li>
				</ul>
			</nav>
		</div>
		<div id="signup">
			<form action="add_user" method="post">
				<table>
					<tr>
						<td class="label">Name:</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td class="label">Email:</td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<td class="label">Password:</td>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<input type="submit" value="Sign Up">
			</form>
			<%
			String message = (String) request.getAttribute("message");
			if (message != null) {
			%>
			<h2 align="center"><%=message%></h2>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>