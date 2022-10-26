<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>   


<html>
<head>
	<title>Flights</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>


<%	
	String origin = request.getParameter("origin");
	String destination = request.getParameter("destination");
	String date = request.getParameter("date");
	
	
	
	String url = "jdbc:mysql://localhost:3306/airline";
	String username = "root";
	String password = "lovedeep";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement ps = con.prepareStatement("select * from flight where origin=? && destination=? && flight_date=?");
	ps.setString(1, origin);
	ps.setString(2,destination);
	ps.setString(3,date);
	ResultSet rs = ps.executeQuery(); 
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
		<h3 class="heading">Flights</h3>
		<div class="underline"></div>
	<table class="table mt-5 table-dark">
		<tr>
			<th>S.no.</th>
			<th>Origin</th>
			<th>Destination</th>
			<th>Flight No.</th>
			<th>Flight Date</th>
			<th>Book Flight</th>
		</tr>
		<%while(rs.next()){%>
			
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td>
				<form action=" passenger.jsp" method="get">
					<input type="hidden" name="flightno" value="<%=rs.getString(4)%>" /> 
					<button class="btn btn-light" type="submit">Book</button>
				</form>
			</td>
		</tr>
		
		<%}%>
	</table>
	</section>
</body>
</html>
