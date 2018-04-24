package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/quizlink")
public class QuizLink extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String csid = request.getParameter("data");
		System.out.println("CSID:"+csid);
		Connection con = null;
		PreparedStatement stmt = null;
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
			String sql = "select * from tbl_quiz where csid='"+csid+"'";
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			String link = "N/A";
			if(rs.next()){
				//enable quiz session
				HttpSession session=request.getSession();  
		        session.setAttribute("quiz","active");
		        session.setAttribute("csid",csid);
				link = "http://localhost:8080/first/views/quiz.jsp";
			}
			PrintWriter out=response.getWriter();
			out.println(link);
		}
		catch(Exception e){
			System.out.println("SQL Exception: "+e.getMessage());
		}
		finally{
			try{
				if(con!=null)
					con.close();
			}
			catch(Exception e){
				System.out.println("SQL Closing Exception: "+e.getMessage());
			}
		}
	}
}
