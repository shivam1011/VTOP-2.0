<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

	<table id="student-details">
	<thead>
             <tr>
             	 <th>Sr. No.</th>
                 <th>Video Lectures</th>
             </tr>
         </thead>
         <tbody>
         <%
         	String course = request.getParameter("course");
             Class.forName("org.sqlite.JDBC");
             Connection conn =
                  DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
             Statement stat = conn.createStatement();
             String sql = "select * from tbl_video where csid='"+course+"'";
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
         %>
         </tbody>
</table>