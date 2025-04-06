package servlets;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.logging.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ScholarshipServlet")
public class ScholarshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ScholarshipServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Scholarship> scholarships = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/scholarship?useSSL=false&autoReconnect=true&allowPublicKeyRetrieval=true";
            String user = "root";
            String password = "root";

            HttpSession session = request.getSession(false);
            boolean loggedIn = session != null && session.getAttribute("email") != null;

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String mode = request.getParameter("mode");

                if ("eligible".equalsIgnoreCase(mode) && loggedIn) {
                    String email = (String) session.getAttribute("email");

                    String userQuery = "SELECT date_of_birth, category, gender, annual_income FROM user WHERE email = ?";
                    try (PreparedStatement userStmt = conn.prepareStatement(userQuery)) {
                        userStmt.setString(1, email);
                        ResultSet userRs = userStmt.executeQuery();

                        if (userRs.next()) {
                            String dob = userRs.getString("date_of_birth");
                            String userCaste = userRs.getString("category");
                            String userGender = userRs.getString("gender");
                            String incomeStr = userRs.getString("annual_income");

                            double userIncome = parseIncome(incomeStr);
                            int userAge = calculateAge(dob);

                            String scholarshipQuery = "SELECT id, name, provider, last_date, category, age, annual_income, caste FROM scholarshipdata";
                            try (PreparedStatement stmt = conn.prepareStatement(scholarshipQuery);
                                 ResultSet rs = stmt.executeQuery()) {

                                while (rs.next()) {
                                    String schAge = rs.getString("age");
                                    String schIncome = rs.getString("annual_income");
                                    String schCaste = rs.getString("caste");
                                    String schCategory = rs.getString("category");

                                    // Gender filter
                                    if ("male".equalsIgnoreCase(userGender) &&
                                            schCategory != null &&
                                            schCategory.toLowerCase().contains("girl")) {
                                        logger.info("Skipped girl-only scholarship for male");
                                        continue;
                                    }
                                    if ("female".equalsIgnoreCase(userGender) &&
                                            schCategory != null &&
                                            schCategory.toLowerCase().contains("boy")) {
                                        logger.info("Skipped boy-only scholarship for female");
                                        continue;
                                    }

                                    boolean casteEligible = schCaste == null || schCaste.equalsIgnoreCase("Any") ||
                                            schCaste.equalsIgnoreCase(userCaste);
                                    boolean incomeEligible = isIncomeEligible(schIncome, userIncome);
                                    boolean ageEligible = isAgeEligible(schAge, userAge);

                                    logger.info("Scholarship ID " + rs.getInt("id") +
                                            " | Caste Eligible: " + casteEligible +
                                            " | Income Eligible: " + incomeEligible +
                                            " | Age Eligible: " + ageEligible);

                                    if (casteEligible && incomeEligible && ageEligible) {
                                        scholarships.add(new Scholarship(
                                                rs.getInt("id"),
                                                rs.getString("name"),
                                                rs.getString("provider"),
                                                rs.getString("last_date"),
                                                schCategory
                                        ));
                                    }
                                }
                            }
                        }
                    }
                } else {
                    // Show all scholarships
                    String query = "SELECT id, name, provider, last_date, category FROM scholarshipdata";
                    try (PreparedStatement stmt = conn.prepareStatement(query);
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
                    }
                }

            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error: " + e.getMessage(), e);
        }

        request.setAttribute("scholarships", scholarships);

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("email") != null) {
            request.getRequestDispatcher("Scholarship_logged_in.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("scholarship.jsp").forward(request, response);
        }
    }

    private int calculateAge(String dob) {
        try {
            LocalDate birthDate = LocalDate.parse(dob);
            return Period.between(birthDate, LocalDate.now()).getYears();
        } catch (Exception e) {
            return 0;
        }
    }

    private double parseIncome(String incomeStr) {
        if (incomeStr == null || incomeStr.equalsIgnoreCase("Any")) return 0.0;

        incomeStr = incomeStr.toLowerCase().replaceAll(",", "").trim();

        try {
            return Double.parseDouble(incomeStr.replaceAll("[^0-9]", ""));
        } catch (Exception e) {
            return 0.0;
        }
    }

    private boolean isIncomeEligible(String schIncome, double userIncome) {
        if (schIncome == null || schIncome.trim().equalsIgnoreCase("Any")) return true;

        schIncome = schIncome.toLowerCase().replaceAll(",", "").trim();

        try {
            if (schIncome.contains("less than")) {
                int limit = Integer.parseInt(schIncome.replaceAll("[^0-9]", ""));
                return userIncome < limit;
            } else if (schIncome.contains("more than")) {
                int limit = Integer.parseInt(schIncome.replaceAll("[^0-9]", ""));
                return userIncome > limit;
            } else {
                int limit = Integer.parseInt(schIncome.replaceAll("[^0-9]", ""));
                return userIncome <= limit;
            }
        } catch (Exception e) {
            return true;
        }
    }

    private boolean isAgeEligible(String schAge, int userAge) {
        if (schAge == null || schAge.trim().equalsIgnoreCase("Any")) return true;

        schAge = schAge.toLowerCase().replaceAll(",", "").trim();

        try {
            if (schAge.contains("less than")) {
                int limit = Integer.parseInt(schAge.replaceAll("[^0-9]", ""));
                return userAge < limit;
            } else if (schAge.contains("more than")) {
                int limit = Integer.parseInt(schAge.replaceAll("[^0-9]", ""));
                return userAge > limit;
            } else {
                int limit = Integer.parseInt(schAge.replaceAll("[^0-9]", ""));
                return userAge <= limit;
            }
        } catch (Exception e) {
            return true;
        }
    }
}
