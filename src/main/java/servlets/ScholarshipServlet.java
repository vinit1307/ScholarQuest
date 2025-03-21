package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ScholarshipServlet")
public class ScholarshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScholarshipServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        ArrayList<Scholarship> scholarships = new ArrayList<>();

        try {
            // Load MySQL JDBC Driver for MySQL 8
            Class.forName("com.mysql.cj.jdbc.Driver");
            logger.info("MySQL JDBC Driver Registered!");

            // Connection parameters
            String url = "jdbc:mysql://localhost:3306/scholarship?useSSL=false&autoReconnect=true&allowPublicKeyRetrieval=true";
            String user = "root";  
            String password = "root";  

            // Establish connection with try-with-resources
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement stmt = conn.prepareStatement("SELECT id, name, provider, last_date, category FROM scholarshipdata");
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    scholarships.add(new Scholarship(
                        rs.getInt("id"), 
                        rs.getString("name"), 
                        rs.getString("provider"), 
                        rs.getString("last_date"), 
                        rs.getString("category")
                    ));
                }
                logger.info("Scholarships retrieved: " + scholarships.size());
            }

        } catch (Exception e) {
            logger.severe("Database error: " + e.getMessage());
            e.printStackTrace();
        }

        // Forwarding to JSP
        request.setAttribute("scholarships", scholarships);
        RequestDispatcher dispatcher = request.getRequestDispatcher("scholarship.jsp");
        dispatcher.forward(request, response);
    }
}
