<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Passenger Details</title>
</head>
<body>

	<%
	try{
	String flightno = request.getParameter("flightno");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String gender = request.getParameter("gender");
	
	String url = "jdbc:mysql://localhost:3306/airline";
	String username = "root";
	String password = "lovedeep";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement ps = con.prepareStatement("select * from flight,fare where flight.id = fare.fare_id");
	ResultSet rs = ps.executeQuery();
	rs.next();
	String destination = rs.getString(3);
	String fare = rs.getString(9);
	String flight_date = rs.getString(5);
	String origin = rs.getString(2);
	
	
	PreparedStatement ps1 = con.prepareStatement("select * from booking");
	ResultSet rs1 = ps1.executeQuery();
	rs1.next();
	String id = rs.getString(1);
	Integer num = Integer.parseInt(id);
	
	
	PreparedStatement ps2 = con.prepareStatement("select curdate()");
	ResultSet rs2 = ps2.executeQuery();
	rs2.next();
	String booking_date = rs2.getString(1);
	
	String confirm = "BOOKING CONFIRMED";
	
	// Booking created
	PreparedStatement ps3 = con.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?)");
	ps3.setInt(1,num+1);
	ps3.setString(2,booking_date);
	ps3.setString(3,destination);
	ps3.setString(4,fare);
	ps3.setString(5,flight_date);
	ps3.setString(6,flightno);
	ps3.setString(7,origin);
	ps3.setString(8,confirm);
	ps3.execute();
	
	// Passenger created
	PreparedStatement ps4 = con.prepareStatement("insert into passenger values(?,?,?,?,?)");
	ps4.setInt(1,num+1);
	ps4.setString(2,firstname);
	ps4.setString(3,lastname);
	ps4.setString(4,gender);
	ps4.setInt(5,num+1);
	ps4.execute();
	
    String redirectURL = "http://localhost:8090/AirlineReservation/Blue%20Airlines.html";
    response.sendRedirect(redirectURL);
 
	}catch(Exception err){%>
	
	<h1>You got an error</h1>	
	<% } %>
	
	
</body>
</html>