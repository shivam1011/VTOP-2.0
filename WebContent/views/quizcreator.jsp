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
            <li style="margin-left:5%"><img src="http://localhost:8080/first/images/logo.png" alt="VIT Logo" id="vitlogo"/></li>
            <li style="font-size: 24px; float: right; margin-right: 0.5%;"><a>VTOP-Beta 2.0</a></li>
        </ul>
    </div>

   <article style="margin-left: 0; width: 96.5%;">
		<h2 align="center">Quiz Creator for <%= request.getParameter("csid")%></h2>
		<div class = "login">
		<form action="http://localhost:8080/first/quizadder" method="POST">
			<input type="hidden" name="csid" value="<%=request.getParameter("csid")%>"/>
			<input type="text" name="question" placeholder="Question"/>
			<input type="text" name="opta" placeholder="Option A"/>
			<input type="text" name="optb" placeholder="Option B"/>
			<input type="text" name="optc" placeholder="Option C"/>
			<input type="text" name="optd" placeholder="Option D"/>
			<br><br><select name="answer" id="select-quiz-course">
			<option value="none" selected disabled>Select Answer</option>
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>
			<option value="D">D</option>
			</select><br><br>
			<button style="width: 100%; margin: auto; left: 0;" type="submit" onclick="return questionadd();">Add Question To Quiz in Database</button><br><br>
			<br><a href="http://localhost:8080/first/views/createquiz.jsp">Exit</a>
		</form>
		</div>
	</article>


    <div class="footer">
        <div class="footer">
            <span class="footer-left">Copyright &copy; 2018 <a href="https://www.vit.ac.in" target="_blank">VIT</a></span>
            <span class="footer-right">Bajaj_DK (15BCE0553)</span>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://localhost:8080/first/js/quiz.js" type="text/javascript"></script>
    <script>
    	function questionadd(){
    	alert("Question added succesfully!");
    	return true;
    	}
    </script>
</body>
</html>