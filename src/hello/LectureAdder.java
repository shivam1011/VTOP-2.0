package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.*;
import java.nio.file.Files;


@WebServlet("/lectureadder")
@MultipartConfig
public class LectureAdder extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String csid = request.getParameter("csid");
		String slot = request.getParameter("slot");
		Part filePart = request.getPart("vlink");
		String sr_no = request.getParameter("sr_no");
		
		//File uploads = new File(new java.net.URL("http://localhost:8080/").getPath());
		String videolink = csid.concat("_".concat(sr_no.concat(".mp4")));
		
		//File file = new File(uploads, videolink);
		File file = new File(videolink);
		videolink = "http://localhost:8080/first/videos/".concat(videolink);
		try (InputStream input = filePart.getInputStream()) {
			System.out.println("Saved: "+file.getPath());
		    Files.copy(input, file.toPath());
		}
		
		Connection con = null;
		Statement stmt = null;
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:Z:\\Softwares\\sqlite-tools-win32-x86-3220000\\dtclass.db");
			stmt=con.createStatement();
			String sql="INSERT INTO tbl_video VALUES('"+videolink+"','"+csid+"','"+slot+"');";
			System.out.println(sql);
            int i = stmt.executeUpdate(sql);
		}
		catch(Exception e){
			System.out.println("SQL Exception: "+e.getMessage());
		}
		finally{
			try{
				if(con!=null)
					con.close();
				request.getRequestDispatcher("/views/lectureviewer.jsp?&csid="+csid).forward(request, response);
			}
			catch(Exception e){
				System.out.println("SQL Closing Exception: "+e.getMessage());
			}
		}
	}
}

