package servlets;

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

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	 response.setContentType("text/html");
         PrintWriter out = response.getWriter();
        
         // Retrieving form data
         String fullName = request.getParameter("fullname");
         String email = request.getParameter("email");
         String category = request.getParameter("category");
         String income = request.getParameter("income");
         String gender = request.getParameter("gender");
         String higherSchool = request.getParameter("higher_School");
         String seniorSchool = request.getParameter("senior_School");
         String year = request.getParameter("year");
         String cgpa = request.getParameter("CGPA");
         String dob = request.getParameter("dob");
         String country = request.getParameter("country");
         String state = request.getParameter("state");
         String phone = request.getParameter("phone");
         String password = request.getParameter("password");
         String confirmPassword = request.getParameter("ConfirmPassword");
        
         
         System.out.println("Annual Income: [" + income + "]");
         System.out.println("Year: [" + year + "]");
         
         if (password == null || confirmPassword == null) {
             out.println("<h3 style='color:red;'>Password fields cannot be empty!</h3>");
             return;
         }
        
         if (!password.equals(confirmPassword)) {
             out.println("<h3 style='color:red;'>Passwords do not match!</h3>");
             return;
         }
        
         try {
             // Database connection
             Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver Loaded Successfully");
             System.out.println("MySQL JDBC Driver Loaded Successfully!");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scholarship", "root", "root");
             System.out.println("MySQL Connection build Successfully!");
             
             String query = "INSERT INTO user(full_name, email, category, annual_income, gender, high_school_percentage, higher_secondary_percentage, current_year, cgpa, date_of_birth, country, state, phone_no, password_hash) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
             PreparedStatement ps = con.prepareStatement(query);
             ps.setString(1, fullName);
             ps.setString(2, email);
             ps.setString(3, category);
             ps.setString(4, income);
             ps.setString(5, gender);
             ps.setString(6, higherSchool);
             ps.setString(7, seniorSchool);
             ps.setString(8, year);
             ps.setString(9, cgpa);
             ps.setString(10, dob);
             ps.setString(11, country);
             ps.setString(12, state);
             ps.setString(13, phone);
             ps.setString(14, password);
            
             int result = ps.executeUpdate();
            
             if (result > 0) {
                 // Display message and redirect after 2 seconds
                 out.println("<script type='text/javascript'>");
                 out.println("alert('Registration Successful! Redirecting to login page...');");
                 out.println("setTimeout(function(){ window.location.href = 'login.html'; }, 2000);");
                 out.println("</script>");
             } else {
                 out.println("<h3 style='color:red;'>Registration Failed!</h3>");
             }
            
             con.close();
         } catch (Exception e) {
             out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
         }
     }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    doPost(request, response);
	}

}
