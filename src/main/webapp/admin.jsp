<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Details</title>
<link href="css/index.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
  <div class="container">
    <a class="navbar-brand" href="http://localhost:8090/AirlineReservation/Blue%20Airlines.html">Blue Airlines</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
    <div class="mx-auto"></div>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8090/AirlineReservation/Blue%20Airlines.html">Book Flight</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="managebooking.html">Manage Booking</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="admin.html">Admin</a>
        </li>
      </ul>
    		</div>
  		</div>
	</nav>
<% 
 	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	
	String url = "jdbc:mysql://localhost:3306/airline";
	String username = "root";
	String password = "lovedeep";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username,password);
	
	PreparedStatement ps = con.prepareStatement("select * from passenger");
	ResultSet rs = ps.executeQuery();
	
	PreparedStatement ps1 = con.prepareStatement("select * from flight");
	ResultSet rs1 = ps1.executeQuery();
	
	PreparedStatement ps2 = con.prepareStatement("select * from booking");
	ResultSet rs2 = ps2.executeQuery();
	
	
%>
<section class="container m-5">
		<h3 class="heading">Passenger Details</h3>
		<div class="underline"></div>
	<table class="table mt-5 table-dark">
		<tr>
			<th>S.no.</th>
			<th>First Name</th>
			<th>Gender</th>
			<th>Last Name</th>
			<th>Booking ID</th>
		</tr>
		<%while(rs.next()){%>
			
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		
		<%}%>
	</table>
	</section>
	
	<section class="container m-5">
		<h3 class="heading">Flight Details</h3>
		<div class="underline"></div>
	<table class="table mt-5 table-dark">
		<tr>
			<th>S.no.</th>
			<th>Origin</th>
			<th>Destination</th>
			<th>Flight No</th>
			<th>Flight Date</th>
			<th>Fare_id</th>
			<th>Inv_id</th>
		</tr>
		<%while(rs1.next()){%>
			
		<tr>
			<td><%=rs1.getString(1)%></td>
			<td><%=rs1.getString(2)%></td>
			<td><%=rs1.getString(3)%></td>
			<td><%=rs1.getString(4)%></td>
			<td><%=rs1.getString(5)%></td>
			<td><%=rs1.getString(6)%></td>
			<td><%=rs1.getString(7)%></td>
		</tr>
		
		<%}%>
	</table>
	</section>
	
	
	<section class="container m-5">
		<h3 class="heading">Bookings</h3>
		<div class="underline"></div>
	<table class="table mt-5 table-dark">
		<tr>
			<th>S.no.</th>
			<th>Booking Date</th>
			<th>Destination</th>
			<th>Fare</th>
			<th>Flight Date</th>
			<th>Flight No</th>
			<th>Origin</th>
			<th>Status</th>
		</tr>
		<%while(rs2.next()){%>
			
		<tr>
			<td><%=rs2.getString(1)%></td>
			<td><%=rs2.getString(2)%></td>
			<td><%=rs2.getString(3)%></td>
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getString(5)%></td>
			<td><%=rs2.getString(6)%></td>
			<td><%=rs2.getString(7)%></td>
			<td><%=rs2.getString(8)%></td>
		</tr>
		
		<%}%>
	</table>
	</section>
<section class="footer container-fluid d-flex align-items-center justify-content-center">
	<p class="text-white">Blue Airlines - 2022 ®</p>
</section>


</body>
</html>