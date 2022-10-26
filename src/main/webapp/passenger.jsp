<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>   



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Passenger Details</title>
<link href="css/index.css" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<%
	String flightno = request.getParameter("flightno");
%>
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
<section class="passenger mt-5">
	<div class="row container justify-content-evenly mt-5 mb-5">
		<div class="col">
			<img class="detail-img rounded" src="https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80">
		</div>
		<form class="passenger-form col" action="detail.jsp">
			<h3 class="heading">Passenger Details</h3>
			<div class="underline"></div>
			<input type="hidden" name="flightno" value="<%=flightno%>" /> 
			<div class="form-floating mb-3 mt-5">
  				<input name="firstname" type="text" class="form-control" id="floatingfirst" placeholder="Riya">
  				<label for="floatingfirst">FIRST NAME</label>
			</div>
			<div class="form-floating mb-3">
  				<input  name="lastname" type="text" class="form-control" id="floatinglast" placeholder="Singh">
  				<label for="floatinglast">LAST NAME</label>
			</div>
			<div class="form-floating">
  				<input  name="gender" type="text" class="form-control" id="floatinggender" placeholder="Singh">
  				<label for="floatinggender">GENDER</label>
			</div>
			<button class="btn btn-outline-dark mt-3 " type="submit">Book</button>
		</form>
	</div>
</section>
<section class="footer container-fluid d-flex align-items-center justify-content-center">
	<p class="text-white">Blue Airlines - 2022 �</p>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>

