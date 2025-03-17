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
        <h2 style="text-align: center; margin-top: 20px;font-size: 35px;font-weight: bold;">All Scholarships</h2>
        
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
