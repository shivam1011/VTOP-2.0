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
            <li style="margin-left:5%"><a href="http://localhost:8080/first/views/home.jsp">
            <img src="http://localhost:8080/first/images/logo.png" alt="VIT Logo" id="vitlogo"/></a></li>
            <li style="font-size: 24px; float: right; margin-right: 0.5%;"><a>VTOP-Beta 2.0</a></li>
        </ul>
    </div>
    
<nav>
	<h4 align="center">Welcome <%= (String)session.getAttribute("usid")%></h4>
	<ul class="nav-ul">
		<li>
			<span>Academics</span>
			<ul class="dropdown-content">
				<li id="timetable"><a href="http://localhost:8080/first/views/timetable.jsp">Time Table</a></li>
				<li id="coursepage"><a href="http://localhost:8080/first/views/coursepage.jsp">Course Page (with video lectures)</a></li>
				<li id="quiz"><a href="http://localhost:8080/first/views/quizlink.jsp">Quiz</a></li>
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
				<li id="details"><a href="http://localhost:8080/first/views/details.jsp">Details</a></li>
				<li id="#"><a href="#" title="Not Available!">Settings</a></li>
			</ul>
		</li>
		<li>
			<button style="background-color: white;"><a style="color: black; text-decoration: none; font-weight: bold;" href="http://localhost:8080/first/logout">Logout</a></button>
		</li>
	</ul>
</nav>


   <article>
			<h2 align="center">Time Table</h2>
			
				<table id="student-details">
				<thead>
                <tr>
                    <!--th>Reg. No.</th-->
                    <th>Course Code</th>
                    <th>Faculty ID</th>
                    <th>Slot</th>
                </tr>
            </thead>
            <tbody>
            <%
                Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
                Statement stat = conn.createStatement();
                String sql = "select * from tbl_tt where usid='"+(String)session.getAttribute("usid")+"'";
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
                    out.println("<tr><td>");
                    //out.println(rs.getString("usid"));
                    //out.println("</td><td>");
                    out.println(rs.getString("csid"));
                    out.println("</td><td>");
                    out.println(rs.getString("fcid"));
                    out.println("</td><td>");
                    out.println(rs.getString("slot"));
                    out.println("</td></tr>");
                }
                rs.close();
                conn.close();
            %>
            </tbody>
			</table>			
		
   </article>


    <div class="footer">
        <div class="footer">
            <span class="footer-left">Copyright &copy; 2018 <a href="https://www.vit.ac.in" target="_blank">VIT</a></span>
            <span class="footer-right">Bajaj_DK (15BCE0553)</span>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://localhost:8080/first/js/timetable.js" type="text/javascript"></script>
</body>
</html>