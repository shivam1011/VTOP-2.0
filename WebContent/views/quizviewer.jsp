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
		<h2 align="center">View Mode for <%= request.getParameter("csid")%> Quiz</h2>
		   <%
			    String csid = request.getParameter("csid");
			    System.out.println("jsp wali csid:" + csid);
		   		Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
                Statement stat = conn.createStatement();
                String sql = "select * from tbl_quiz where csid='"+csid+"'";
                ResultSet rs = stat.executeQuery(sql);
		   		int qno = 1;
		   		out.println("<form id='quiz-form' action='#'>");
		   		while(rs.next()){
		   			String ques = rs.getString("question");
		   			String opta = rs.getString("opta");
		   			String optb = rs.getString("optb");
		   			String optc = rs.getString("optc");
		   			String optd = rs.getString("optd");
		   			out.println("<table id='student-details'><tr><th>Question: "+(qno++)+"</th><th>"+ques+"</th></tr>");
		   			out.println("<tr><td>A.<input type='radio' value='A' name='opt"+(qno-1)+"'/></td><td>"+opta+"</td></tr>");
		   			out.println("<tr><td>B.<input type='radio' value='B' name='opt"+(qno-1)+"'/></td><td>"+optb+"</td></tr>");
		   			out.println("<tr><td>C.<input type='radio' value='C' name='opt"+(qno-1)+"'/></td><td>"+optc+"</td></tr>");
		   			out.println("<tr><td>D.<input type='radio' value='D' name='opt"+(qno-1)+"'/></td><td>"+optd+"</td></tr>");
		   			out.println("</table><hr>");
		   		}
		   		out.println("</form>");
		   %>
		   <br><a href='http://localhost:8080/first/views/createquiz.jsp'>Exit</a>
	</article>


    <div class="footer">
        <div class="footer">
            <span class="footer-left">Copyright &copy; 2018 <a href="https://www.vit.ac.in" target="_blank">VIT</a></span>
            <span class="footer-right">Bajaj_DK (15BCE0553)</span>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://localhost:8080/first/js/quiz.js" type="text/javascript"></script>
    
</body>
</html>