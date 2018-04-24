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

@WebServlet("/faclogin")
public class FacultyLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fcid, pswd;
		fcid = request.getParameter("fcid");
		pswd = request.getParameter("pswd");
		boolean valid = check(fcid, pswd);
		if(valid == true){
			HttpSession session=request.getSession();  
	        session.setAttribute("fcid",fcid);
	        request.getRequestDispatcher("/views/fachome.jsp").forward(request, response);
		}
		else{
			request.getSession().setAttribute("error", "Unknown user, please try again");
            request.getRequestDispatcher("/views/faclogin.jsp").forward(request, response);
		}
	}
	protected boolean check(String fcid, String pswd){
		Connection con = null;
		PreparedStatement stmt = null;
		int flag=0;
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
			String sql = "select * from tbl_faculty where fcid='"+fcid+"' and pswd='"+pswd+"'";
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				flag=1;
			}
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
		if(flag==1)
			return true;
		return false;
	}
}