<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Car</title>
<style>
* {
	color: white;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2016/05/05/18/01/coupe-1374436_1280.jpg");
}

table {
	border: 0px;
	background: none;
	text-align: center;
}
.label{
	font-size: 15px;
}
input {
	display: block;
	background: none;
	color: white;
	border: none;
	border-bottom: 2px solid white;
	margin: 8px auto;
	font-size: 15px;
}

#display {
	margin-top: 50px;
	margin-left: 50px;
}

nav {
	padding: 20px 25px;
}

li {
	display: inline-block;
	margin-left: 10px;
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
	margin-left: 65%;
}
input[type="submit"] {
	border-radius: 10px;
	padding: 10px;
	color: white;
	text-shadow: 0px 0px 10px white;
}
</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href="home">HOME</a></li>
			<li><a href="#">CONTACT</a></li>
			<li><a href="aboutus">ABOUT US</a></li>
		</ul>
	</nav>
	<div align ="center" id="display">
		<h2>ADD CAR DETAILS</h2>
		<form action="addcar" method="post">
			<table cellspacing="2" cellpadding="4">
				<tr>
					<td class="label">Name:</td>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td class="label">Brand:</td>
					<td><input type="text" name="brand" required></td>
				</tr>
				<tr>
					<td class="label">Fuel Type:</td>
					<td><input type="text" name="fuel" required></td>
				</tr>
				<tr>
					<td class="label">Price:</td>
					<td><input type="text" name="price" required></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="ADD"></td>
				</tr>
			</table>

			<%
			String message = (String) request.getAttribute("message");
			if (message != null) {
			%>
			<div align="center">
				<h2><%=message%></h2>
			</div>
			<%
			}
			%>

		</form>
	</div>
</body>
</html>