<%@page import="com.jspiders.springmvc.dto.CarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Car</title>
<style>
* {
	color: white;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2016/05/05/18/01/coupe-1374436_1280.jpg");
}

table {
	padding: 3px;
	border: 0px;
	background: none;
	text-align: center;
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

input {
	background: none;
	color: white;
	border: none;
	border-bottom: 2px solid white;
	margin: 8px auto;
	font-size: 15px;
}

input[type="submit"] {
	text-align:center;
	border-radius: 10px;
	padding: 10px;
	color: white;
	text-shadow: 0px 0px 10px white;
}
.label{
	font-size: 15px;
</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href="home">HOME</a></li>
			<li><a href="#">CONTACT</a></li>
			<li><a href="aboutus">ABOUT</a></li>
		</ul>
	</nav>
	<div id="display">

		<%
		CarDTO car = (CarDTO) request.getAttribute("car");
		%>
		<div align="center">
			<h2>UPDATE CAR DETAILS</h2>
			<form action="updatecar" method="post">
				<table>
					<tr>
						<td class="label">Id:</td>
						<td ><input type="text" value=<%=car.getId()%>
							name="id" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="label">Name:</td>
						<td><input type="text"
							value=<%=car.getName()%> name="name"></td>
					</tr>
					<tr>
						<td class="label">Brand:</td>
						<td><input type="text"
							value=<%=car.getBrand()%> name="brand"></td>
					</tr>
					<tr>
						<td class="label">Fuel Type:</td>
						<td><input type="text"
							value=<%=car.getFuel()%> name="fuel"></td>
					</tr>
					<tr>
						<td class="label">Price:</td>
						<td><input type="text"
							value=<%=car.getPrice()%> name="price"></td>
					</tr>
				</table>
				<input type="submit" value="UPDATE">
			</form>
		</div>
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
	</div>
</body>
</html>