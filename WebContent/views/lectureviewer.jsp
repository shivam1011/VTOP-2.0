<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>


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

   <article>
      	<div id="main-div">
       		<h2 align="center">Lectures</h2>
			<table id="student-details">
			<tr>
			<th>Sr. No.</th>
			<th>Video</th>
			</tr>
				<%
				String csid = request.getParameter("csid");
				String slot = request.getParameter("slot");
				Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
                Statement stat = conn.createStatement();
                String sql = "select * from tbl_video where csid='"+csid+"'";
                ResultSet rs = stat.executeQuery(sql);
                int i=1;
                while (rs.next()) {
                	out.println("<tr><td>");
               	 	out.println(i++);
                    out.println("</td><td>");
                    String vlink = rs.getString("videolink");
                    out.println("<video width='320' height='240' controls><source src='"+vlink+"' type='video/mp4'></video>");
                    out.println("</td></tr>");
                }
                rs.close();
                conn.close();
                out.println("<tr><td></td><td><form action='http://localhost:8080/first/lectureadder' method='POST' enctype='multipart/form-data'>");
                out.println("<input type='hidden' name='csid' value='"+csid+"'/>");
                out.println("<input type='hidden' name='slot' value='"+slot+"'/>");
                out.println("<input type='hidden' name='sr_no' value='"+(i)+"'/>");
                out.println("<input type='file' name='vlink' /> &nbsp <button type='submit' onclick='return addlecture();'>Upload</button>");
                out.println("</td></tr>");
				%>
			</table>
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
  		function addlecture(){
  			alert("Lecture has been added successfully!");
  			return true;
  		}
  	</script>
</body>
</html>