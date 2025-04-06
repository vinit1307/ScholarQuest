package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            logger.info("MySQL JDBC Driver Registered!");

            String url = "jdbc:mysql://localhost:3306/scholarship?useSSL=false&autoReconnect=true&allowPublicKeyRetrieval=true";
            String user = "root";
            String password = "root";

            HttpSession session = request.getSession(false);
            boolean loggedIn = session != null && session.getAttribute("email") != null;

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                String mode = request.getParameter("mode");

                if ("eligible".equalsIgnoreCase(mode) && loggedIn) {
                    String email = (String) session.getAttribute("email");

                    String userQuery = "SELECT date_of_birth, category, gender, annual_income, country FROM user WHERE email = ?";
                    try (PreparedStatement userStmt = conn.prepareStatement(userQuery)) {
                        userStmt.setString(1, email);
                        ResultSet userRs = userStmt.executeQuery();

                        if (userRs.next()) {
                            String dob = userRs.getString("date_of_birth");
                            String caste = userRs.getString("category");
                            String gender = userRs.getString("gender");
                            String country = userRs.getString("country");
                            String incomeStr = userRs.getString("annual_income");

                            double annualIncome = parseIncome(incomeStr);
                            int birthYear = Integer.parseInt(dob.split("-")[0]);
                            int currentYear = java.time.LocalDate.now().getYear();
                            int age = currentYear - birthYear;

                            logger.info("User info - Age: " + age + ", Caste: " + caste + ", Gender: " + gender + ", Income: " + annualIncome + ", Country: " + country);

                            String scholarshipQuery = "SELECT id, name, provider, last_date, category, age, annual_income, caste FROM scholarshipdata";
                            try (PreparedStatement stmt = conn.prepareStatement(scholarshipQuery);
                                 ResultSet rs = stmt.executeQuery()) {

                                while (rs.next()) {
                                    String schAge = rs.getString("age");
                                    String schIncome = rs.getString("annual_income");
                                    String schCaste = rs.getString("caste");
                                    String category = rs.getString("category");

                                    boolean ageEligible = checkAgeEligibility(schAge, age);
                                    boolean incomeEligible = checkIncomeEligibility(schIncome, annualIncome);
                                    boolean casteEligible = schCaste == null || schCaste.equalsIgnoreCase("Any") || schCaste.equalsIgnoreCase(caste);

                                    boolean genderEligible = gender != null && gender.equalsIgnoreCase("Female") && category.toLowerCase().contains("girl");
                                    boolean countryEligible = country != null && country.equalsIgnoreCase("Abroad") && category.toLowerCase().contains("international");

                                    if (ageEligible && incomeEligible && casteEligible) {
                                        scholarships.add(new Scholarship(
                                                rs.getInt("id"),
                                                rs.getString("name"),
                                                rs.getString("provider"),
                                                rs.getString("last_date"),
                                                rs.getString("category")
                                        ));
                                    } else if (genderEligible || countryEligible) {
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
                    }
                } else {
                    String query = "SELECT id, name, provider, last_date, category FROM scholarshipdata";
                    logger.info("Fetching all scholarships");

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

                logger.info("Total scholarships fetched: " + scholarships.size());
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Database error: " + e.getMessage(), e);
        }

        request.setAttribute("scholarships", scholarships);

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("email") != null) {
            request.getRequestDispatcher("Scholarship_logged_in.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("scholarship.jsp").forward(request, response);
        }
    }

    private double parseIncome(String incomeStr) {
        if (incomeStr == null) return 0.0;
        incomeStr = incomeStr.toLowerCase();
        if (incomeStr.contains("less than 1 lakh")) return 100000.0;
        if (incomeStr.contains("1 lakh - 3 lakh")) return 300000.0;
        if (incomeStr.contains("3 lakh - 5 lakh")) return 500000.0;
        if (incomeStr.contains("above 5 lakh")) return 1000000.0;
        try {
            return Double.parseDouble(incomeStr.replaceAll("[^0-9.]", ""));
        } catch (Exception e) {
            return 0.0;
        }
    }

    private boolean checkAgeEligibility(String ageText, int userAge) {
        if (ageText == null || ageText.equalsIgnoreCase("Any")) return true;
        try {
            if (ageText.toLowerCase().contains("less than")) {
                int limit = Integer.parseInt(ageText.replaceAll("[^0-9]", ""));
                return userAge < limit;
            } else {
                int limit = Integer.parseInt(ageText.replaceAll("[^0-9]", ""));
                return userAge <= limit;
            }
        } catch (Exception e) {
            logger.warning("Invalid age format: " + ageText);
            return true;
        }
    }

    private boolean checkIncomeEligibility(String incomeText, double userIncome) {
        if (incomeText == null || incomeText.equalsIgnoreCase("Any")) return true;
        try {
            if (incomeText.toLowerCase().contains("less than")) {
                int limit = Integer.parseInt(incomeText.replaceAll("[^0-9]", ""));
                return userIncome < limit;
            } else {
                int limit = Integer.parseInt(incomeText.replaceAll("[^0-9]", ""));
                return userIncome <= limit;
            }
        } catch (Exception e) {
            logger.warning("Invalid income format: " + incomeText);
            return true;
        }
    }
}
