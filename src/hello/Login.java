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

@WebServlet("/login")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usid, pswd;
		usid = request.getParameter("usid");
		pswd = request.getParameter("pswd");
		boolean valid = check(usid, pswd);
		if(valid == true){
			//System.out.println("WOW");
			//request.getRequestDispatcher("/views/home.jsp").forward(request,response);
			//System.out.println("oyeoye");
			HttpSession session=request.getSession();  
	        session.setAttribute("usid",usid);			
			//load home page
			//response.sendRedirect("/views/home.jsp");
	        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
		}
		else{
			/*
			PrintWriter out=response.getWriter();
			String ans = usid + " " + pswd;
			out.println("false");*/
			request.getSession().setAttribute("error", "Unknown user, please try again");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
	}
	protected boolean check(String usid, String pswd){
		Connection con = null;
		PreparedStatement stmt = null;
		int flag=0;
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
			String sql = "select * from tbl_login where usid='"+usid+"' and pswd='"+pswd+"'";
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			//System.out.println("\n******\naha\n******\n");
			if(rs.next()){
				//System.out.println("\n******\nwallah\n******\n");
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
		//System.out.println("Bokachoda: "+flag);
		if(flag==1)
			return true;
		return false;
	}
}