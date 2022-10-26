<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Bookings</title>
<link href="css/index.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<% 
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	
	String url = "jdbc:mysql://localhost:3306/airline";
	String username = "root";
	String password = "lovedeep";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement ps = con.prepareStatement("select * from passenger where first_name=? and last_name=?");
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	String booking_id = rs.getString(5);
	Integer num = Integer.parseInt(booking_id);
	
	// booking info using booking id
	PreparedStatement ps1 = con.prepareStatement("select * from booking where booking.id = ?");
	ps1.setInt(1,num);
	ResultSet rs1 = ps1.executeQuery();
	
	
%>
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
	<section class="conatiner m-5">
		<h3 class="heading">Your Bookings</h3>
		<div class="underline"></div>
		<table class="table mt-5 table-dark">
		  <thead>
		    <tr>
		      <th scope="col">S.no</th>
		      <th scope="col">Origin</th>
		      <th scope="col">Destination</th>
		      <th scope="col">Flight No.</th>
		      <th scope="col">Booking Date</th>
		      <th scope="col">Flight Date</th>
		      <th scope="col">Fare</th>
		      <th scope="col">Status</th>
		    </tr>
		  </thead>
		  <tbody>
		  <% while(rs1.next()){ %>
		    <tr>
		      <th scope="row"><%=rs1.getString(1)%></th>
		      <td><%=rs1.getString(7)%></td>
		      <td><%=rs1.getString(3)%></td>
		      <td><%=rs1.getString(6)%></td>
		      <td><%=rs1.getString(2)%></td>
		      <td><%=rs1.getString(5)%></td>
		      <td><%=rs1.getString(4)%></td>
		      <td><%=rs1.getString(8)%></td>
		    </tr>
		    <% }%>
		  </tbody>
		</table>
	</section>
	
</body>
</html>