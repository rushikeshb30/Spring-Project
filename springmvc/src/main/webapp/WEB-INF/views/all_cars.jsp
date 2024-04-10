<%@page import="com.jspiders.springmvc.dto.CarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Cars</title>
<style>
* {
	color: white;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2016/05/05/18/01/coupe-1374436_1280.jpg");
}

table {
	width: 35%;
	font-size: 15px;
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
	<div id="display">
		<%
		@SuppressWarnings("unchecked")
		List<CarDTO> cars = (List<CarDTO>) request.getAttribute("cars");
		if (cars != null && cars.size() > 0) {
		%>
		<div align="center">
			<h2>AVAILABLE CARS</h2>
			<table border="1px solid" cellspacing="2" cellpadding="4">
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>BRAND</th>
					<th>FUEL TYPE</th>
					<th>PRICE</th>
				</tr>
				<%
				for (CarDTO car : cars) {
				%>
				<tr>
					<td><%=car.getId()%></td>
					<td><%=car.getName()%></td>
					<td><%=car.getBrand()%></td>
					<td><%=car.getFuel()%></td>
					<td><%=car.getPrice()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>

		<%
		} else {
		%>
		<div align="center">
			<h2>Car details unavailable</h2>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>