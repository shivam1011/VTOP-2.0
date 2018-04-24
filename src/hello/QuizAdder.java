package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/quizadder")
public class QuizAdder extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String csid = request.getParameter("csid");
		String question = request.getParameter("question");
		String opta = request.getParameter("opta");
		String optb = request.getParameter("optb");
		String optc = request.getParameter("optc");
		String optd = request.getParameter("optd");
		String answer = request.getParameter("answer");
		System.out.println("CSID:"+csid);
		Connection con = null;
		Statement stmt = null;
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
			stmt=con.createStatement();
			String sql="INSERT INTO tbl_quiz VALUES('"+csid+"','"+question+"','"+opta+"','"+optb+"','"+optc+"','"+optd+"','"+answer+"');";
            int i = stmt.executeUpdate(sql);
		}
		catch(Exception e){
			System.out.println("SQL Exception: "+e.getMessage());
		}
		finally{
			try{
				if(con!=null)
					con.close();
				request.getRequestDispatcher("/views/quizcreator.jsp").forward(request, response);
			}
			catch(Exception e){
				System.out.println("SQL Closing Exception: "+e.getMessage());
			}
		}
	}
}

