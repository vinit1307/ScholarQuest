package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
    	  PrintWriter out = response.getWriter();
          String myemail = request.getParameter("email");
          String mypassword = request.getParameter("password");
          
          try {
        	  Class.forName("com.mysql.cj.jdbc.Driver");
        	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scholarship", "root", "root");
        	   
              PreparedStatement ps = con.prepareStatement("select * from User where email=? and password_hash=?");
              ps.setString(1, myemail);
              ps.setString(2, mypassword);
              
              ResultSet rs = ps.executeQuery();
              if(rs.next())
              { 
            	  response.sendRedirect("dashboard.html");
              }
              else {
            	  out.println("<script type='text/javascript'>");
                  out.println("alert('EMAIL AND PASSWORD IS INCORRECT ...');");
                  out.println("setTimeout(function(){ window.location.href = 'login.html'; });");
                  out.println("</script>");
            	 
              }
              
              con.close();
          }
          catch(Exception e)
          {
        	  out.println("Error: " + e.getMessage());
          }
         
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    doPost(request, response);
	}


}
