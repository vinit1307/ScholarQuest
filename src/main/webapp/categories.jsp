<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String cat = request.getParameter("category");
    if (cat == null || cat.trim().isEmpty()) {
        cat = "General"; // default value or redirect
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Scholarships</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" crossorigin="anonymous" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
<style>
      h5{
         text-align : center;
         color: red;
      } 
        .container {
            margin-top: 20px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .scholarship-box {
        	background-color: transparent;
   	 		border-radius: 10px;
    		padding: 15px;
    		box-shadow: 0px 0px 36px 0px rgba(0,0,0,0.1);
    		margin: 15px;
    		transition: transform 0.2s;
    		cursor: pointer;
    		min-height: 200px; /* Ensures equal height */
    		display: flex;
   		 	flex-direction: column;
   		 	justify-content: space-between;
   		 	max-width: 400px;
    		width: 700px;
		}
		.row {
   			 display: flex;
   			 flex-wrap: wrap;
   			 justify-content: center;
    		 align-items: stretch; /* Ensures all columns stretch to the same height */
		}
        
        .scholarship-box:hover {
            transform: scale(1.1);
        }
        h3 {
            font-size: 19px;
            font-weight: bold;
        }
        p {
            margin: 5px 0;
            font-size: 14px;
        }
        h4 {
            font-family: 'Georgia', serif;
            font-weight: bold;
            font-size: 30px;
            margin-top: 15px; 
            text-align: center;
        }
    </style>
</head>
<body>
<header>
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i>
            <a href="index.html"><h2><b>ScholarQuest</b></h2></a>
        </div>
        <nav>
            <ul>
                <li><a href="dashboard.jsp"><b>Home</b></a></li>
                <li><a href="about.html"><b>About</b></a></li>
                <li><a href="LogoutServlet"><b>Logout</b></a></li>
                <li><button class="dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    Scholarships
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="ScholarshipServlet"><b>All Scholarships</b></a></li><br>
                    <li><a class="dropdown-item" href="ScholarshipServlet?mode=eligible"><b>Eligible Scholarships</b></a></li>
                </ul>
                </li>
            </ul>
        </nav>
    </header>
    <h4>Scholarships For <%= cat %></h4>
    <div class="container">
        <div class="row">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scholarship", "root", "root");
                    PreparedStatement ps = con.prepareStatement("SELECT name, provider, last_date, category FROM ScholarshipData WHERE category = ?");
                    ps.setString(1, cat);
                    ResultSet rs = ps.executeQuery();
                    boolean found = false;
                    while (rs.next()) {
                        found = true;
                        String name = rs.getString("name");
                        String provider = rs.getString("provider");
                        String last_date = rs.getString("last_date");
                        String catego = rs.getString("category");
            %>
                        <div class="col-md-4 d-flex">
                            <div class="scholarship-box">
                                <h3><%= name %></h3>
                                <p><strong>Provider:</strong> <%= provider %></p>
                                <p><strong>Last Date:</strong> <%= last_date %></p>
                                <p><strong>Category:</strong> <%= catego %></p>
                            </div>
                        </div>
            <%
                    }
                    if (!found) {
                        out.println("<h5> No scholarships found for category : " + cat + "</h5>");
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<p>An error occurred: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>
