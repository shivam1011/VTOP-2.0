<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>VTOP 2.0</title>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/first/css/styles.css"/>

</head>
<body>
	
	<div class="container-menu">
        <ul class="menu">
            <li style="margin-left:5%"><a href="http://localhost:8080/first/views/fachome.jsp">
            <img src="http://localhost:8080/first/images/logo.png" alt="VIT Logo" id="vitlogo"/></a></li>
            <li style="font-size: 24px; float: right; margin-right: 0.5%;"><a>VTOP-Beta 2.0</a></li>
        </ul>
    </div>
    
<nav>
	<h4 align="center">Welcome <%= (String)session.getAttribute("fcid")%></h4>
	<ul class="nav-ul">
		<li>
			<span>Academics</span>
			<ul class="dropdown-content">
				<li id="timetable"><a href="http://localhost:8080/first/views/createquiz.jsp">Quiz Manager</a></li>
				<li id="coursepage"><a href="http://localhost:8080/first/views/addlectures.jsp">Video Lecture Manager</a></li>
			</ul>
		</li>
		<li>
			<span>Services</span>
			<ul class="dropdown-content">
				<li id="#"><a href="#" title="Not Available!">Transportation</a></li>
				<li id="#"><a href="#" title="Not Available!">Extracurricular</a></li>
			</ul>
		</li>
		<li>
			<span>Examinations</span>
			<ul class="dropdown-content">
				<li id="#"><a href="#" title="Not Available!">Grade View</a></li>
				<li id="#"><a href="#" title="Not Available!">Marks View</a></li>
			</ul>
		</li>
		<li>
			<span>Account</span>
			<ul class="dropdown-content">
				<li id="#"><a href="#" title="Not Available!">Details</a></li>
				<li id="#"><a href="#" title="Not Available!">Settings</a></li>
			</ul>
		</li>
		<li>
			<button style="background-color: white;"><a style="color: black; text-decoration: none; font-weight: bold;" href="http://localhost:8080/first/logout">Logout</a></button>
		</li>
	</ul>
</nav>


   <article style="background-color: green;">
      	<div id="main-div">
       		<h2 align="center">Spotlight</h2>
				<ul id="ul-spotlight">
				<li><a target="_blank" href="http://localhost:8080/first/spotlight/0.pdf">SAP Manual</a></li>
				<li><a target="_blank" href="http://localhost:8080/first/spotlight/1.pdf">Summer 1 circular</a></li>
				<li><a target="_blank" href="http://localhost:8080/first/spotlight/2.pdf">Summer 2 circular</a></li>
				<li><a target="_blank" href="http://localhost:8080/first/spotlight/3.pdf">Circular: Summer Registration</a></li>
				<li><a target="_blank" href="http://localhost:8080/first/spotlight/4.pdf">Deep Learning Invitation Poster</a></li>
				</ul>
		</div>
   </article>


    <div class="footer">
        <div class="footer">
            <span class="footer-left">Copyright &copy; 2018 <a href="https://www.vit.ac.in" target="_blank">VIT</a></span>
            <span class="footer-right">Bajaj_DK (15BCE0553)</span>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
  	<script>
  		var sess = '<%=(String)session.getAttribute("fcid")%>';
  		//alert("Welcome "+sess);
  	</script>
</body>
</html>