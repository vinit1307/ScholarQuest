<%@ page import="java.util.List" %>
<%@ page import="servlets.Scholarship" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Scholarships</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" crossorigin="anonymous" />

    <style>
        body {
            background: linear-gradient(to right, #A1C4FD, #C2E9FB);
            font-family: Arial, sans-serif;
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
    background: white;
    border-radius: 8px;
    padding: 15px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    margin: 15px;
    transition: transform 0.2s;
    cursor: pointer;
    min-height: 200px; /* Ensures equal height */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: stretch; /* Ensures all columns stretch to the same height */
}
        
        .scholarship-box:hover {
            transform: scale(1.05);
        }
        h3 {
            font-size: 18px;
            font-weight: bold;
        }
        p {
            margin: 5px 0;
            font-size: 14px;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .logo {
            display: flex;
            align-items: center;
        }
        .logo h2 {
            margin-left: 10px;
            font-weight: bold;
            color: black;
        }
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        nav ul li {
            display: inline;
        }
        nav ul li a {
            text-decoration: none;
            color: black;
            font-weight: bold;
            transition: 0.3s;
        }
        nav ul li a:hover, nav ul li a.active {
            color: #007bff;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i>
            <a href="index.html"><h2>ScholarQuest</h2></a>
        </div>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="ScholarshipServlet" class="active">Scholarships</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="register.html">Register</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <h2 style="text-align: center; margin-top: 20px;">All Scholarships</h2>
        
        <div class="container">
            <div class="row">
                <% List<Scholarship> scholarships = (List<Scholarship>) request.getAttribute("scholarships"); %>
                <% if (scholarships != null && !scholarships.isEmpty()) { %>
                    <% for (Scholarship s : scholarships) { %>
                        <div class="col-md-4 d-flex">
                            <div class="scholarship-box w-100" onclick="redirectToDetails('<%= s.getId() %>')">
                                <h3><%= s.getName() %></h3>
                                <p><strong>Provider:</strong> <%= s.getProvider() %></p>
                                <p><strong>Last Date:</strong> <%= s.getLastDate() %></p>
                                <p><strong>Category:</strong> <%= s.getCategory() %></p>
                            </div>
                        </div>
                    <% } %>
                <% } else { %>
                    <p style="color:red; text-align:center;">No scholarships available.</p>
                <% } %>
            </div>
        </div>
    </main>
    
    <script>
        function redirectToDetails(scholarshipId) {
            let isLoggedIn = <%= (session.getAttribute("user") != null) ? "true" : "false" %>;
            if (!isLoggedIn) {
                window.location.href = "login.html";
            } else {
                window.location.href = "ScholarshipDetailsServlet?scholarshipId=" + scholarshipId;
            }
        }
    </script>
</body>
</html>
