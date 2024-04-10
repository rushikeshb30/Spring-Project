<%@page import="com.jspiders.springmvc.dto.CarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cars</title>
<style>
* {
	color: white;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2016/05/05/18/01/coupe-1374436_1280.jpg");
}

table {
width: 45%;
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

input[type="submit"] {
	color: white;
	font-size: 12px;
}
.action{
	background: none;
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
			<h2>YOUR CARS</h2>
			<table border="1px solid" cellspacing="2" cellpadding="4">
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>BRAND</th>
					<th>FUEL TYPE</th>
					<th>PRICE</th>
					<th colspan="2">ACTION</th>
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
					<td id="action">
						<form action="deletecar" method="post">
							<input type="text" value=<%=car.getId()%> name="id" hidden="true">
							<input type="submit" value="Delete" class="action">
						</form>
					</td>
					<td>
						<form action="editcar" method="post">
							<input type="text" value=<%=car.getId()%> name="id" hidden="true">
							<input type="submit" value="Update" class="action">
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<%
		}
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