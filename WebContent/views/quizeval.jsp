<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<%
String csid = (String)session.getAttribute("csid");
System.out.println("jsp wali csid durin eval:" + csid);
Class.forName("org.sqlite.JDBC");
Connection conn =
     DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
Statement stat = conn.createStatement();
String sql = "select * from tbl_quiz where csid='"+csid+"'";
ResultSet rs = stat.executeQuery(sql);
	int score = 0;
	int max_score = 0;
	int opt = 1;
	while(rs.next()){
		String ans = rs.getString("answer");
		String selopt = request.getParameter("opt"+(opt++));
		if(ans.trim().equals(selopt.trim())){
			score++;
		}
		max_score++;
	}
	out.println("<html><head>");
	out.println("<link rel='stylesheet' type='text/css' href='http://localhost:8080/first/css/styles.css'/>");
	out.println("</head><body><table id='student-details'>");
	out.println("<tr><th>Quiz Result</th></tr>");
	out.println("<tr><td>"+score+"/"+max_score+"</td></tr>");
	out.println("<tr><td><button><a href='http://localhost:8080/first/views/home.jsp'>Home</a></button></td></tr>");
	out.println("</table></body></html>");
%>
	