package servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ScholarshipDetailsServlet")
public class ScholarshipDetailsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String scholarshipId = request.getParameter("scholarshipId");

        // Null and empty check before parsing
        if (scholarshipId == null || scholarshipId.isEmpty()) {
            // Redirect if ID is missing
            response.sendRedirect("scholarship.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(scholarshipId);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/scholarship", "root", "root");

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM scholarshipdata WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Scholarship s = new Scholarship(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("provider"),
                    rs.getString("category"),
                    rs.getString("last_date"),
                    rs.getString("amount"),
                    rs.getString("age"),
                    rs.getString("annual_income"),
                    rs.getString("caste"),
                    rs.getString("eligibility"),
                    rs.getString("documents_required"),
                    rs.getString("official_link")
                );

                request.setAttribute("scholarship", s);
                RequestDispatcher rd = request.getRequestDispatcher("allScholarships.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("scholarship.jsp");
            }

        } catch (NumberFormatException e) {
            // If ID is not a number
            e.printStackTrace();
            response.sendRedirect("scholarship.jsp");
        } catch (Exception e) {
            // For DB and general errors
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
