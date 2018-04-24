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
       		<h2 align="center">Create Quiz</h2>
			<table id="student-details">
			<tr>
			<th>Course</th>
			<th>Slot</th>
			<th>Status</th>
			</tr>
				<%
				Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
                Statement stat = conn.createStatement();
                String sql = "select * from tbl_subjects where fcid='"+(String)session.getAttribute("fcid")+"'";
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
                	String csid = rs.getString("csid");
                	String slot = rs.getString("slot");
                	out.println("<tr><td>"+csid+"</td><td>"+slot+"</td><td>");
                	String sql2 = "select * from tbl_quiz where csid='"+csid+"'";
                	Statement stat2 = conn.createStatement();
                	ResultSet rs2 = stat2.executeQuery(sql2);
                    int flag=0;
                    while(rs2.next()){
                    	flag=1;
                    }
                    rs2.close();
                    //System.out.println(csid+slot);
                    if(flag==0){
                    	out.println("No quiz available: <button style='background-color: silver'><a href='http://localhost:8080/first/views/quizcreator.jsp?&csid="+csid+"'>Create Quiz</a></button></td></tr>");
                    }
                    else{
                    	out.println("Quiz available: <button style='background-color: cyan'><a href='http://localhost:8080/first/views/quizviewer.jsp?&csid="+csid+"'>View Quiz</a></button></td></tr>");
                    }
                }
                rs.close();
                conn.close();
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
    <script src="http://localhost:8080/first/js/fachome.js" type="text/javascript"></script>
  	<script>
  		var sess = '<%=(String)session.getAttribute("fcid")%>';
  		//alert("Welcome "+sess);
  	</script>
</body>
</html>