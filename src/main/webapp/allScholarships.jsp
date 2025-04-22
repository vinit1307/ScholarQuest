<%@ page import="servlets.Scholarship" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Scholarships</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/scholar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" crossorigin="anonymous" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Scholarship Details</title>
    <style>
        .container {
            margin: 40px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            max-width: 850px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
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
        
        .search-container  {
        position: relative;
        display: flex;
        align-items: center;
        width: 60px;
        margin-right: 0px;
        margin-left: 2px;
        }
        
        .search-input {
        width: 0;
        padding: 10px;
        border: 2px solid #007BFF;
        border-radius: 5px;
        transition: width 0.5s ease;
        opacity: 0;
        visibility: hidden;
        overflow: hidden;
        padding-left: 10px;
        }
        
        .search-icon {
        font-size: 24px;
        cursor: pointer;
        transition: transform 0.5s ease;
        margin-left: 10px;
        margin-right: 15px;
        }
        
        .search-icon:hover + .search-input {
        width: 200px; /* Expand width on hover */
        }
        
        .search-container:hover .search-input {
        width: 200px; /* Adjust width as needed */
        opacity: 1;
        visibility: visible;
        }
        
        .search-container:hover .search-icon {
        transform: scale(1.2); /* Scale up the icon */
        }
        
        .filter-dropdown {
        position: relative;
        display: flex;
        align-items: center;
        width: 40px;
        margin-right: 0px;
        position: relative;
        
        }
        
        #filterToggle{
        background-color: transparent;
        border: none;
        transition: transform 0.5s ease;
        }
        
        #filterToggle:hover{
        transform: scale(1.2);
        }
        
        .dropdown-content {
        display: none;
  		position: absolute;
  		top: 42px;
 		left: 0px;
 		width: 150px;
 		height: auto;
 		border: 1px solid #ddd;
  		border-radius: 6px;
 		box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  		padding: 10px;
  		z-index: 1000;
  		
  		background-color: rgba(255, 255, 255, 0.2) !important;
    backdrop-filter: blur(10px) !important; /* Smooth glass effect */
    border: none !important;
    /* box-shadow: none !important; */
    backdrop-filter: blur(10px); /* Optional: Glassmorphic effect */
  		}
  		
  		.dropdown-content label {
  		display: block;
  		margin-bottom: 5px;
  		margin-top: 5px;
  		cursor: pointer;
		}
		
		.filter-checkbox{
		margin-right: 6.6px;
		}
		
		.filter-search-wrapper {
 		display: flex;
  		align-items: center;
 		margin-left: 128px;
		}
 		a.button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
        a.button:hover {
            background-color: #0056b3;
        }
        .button {
    display: flex;
    justify-content: center;
    gap: 10px; /* Add some space between buttons */
}
 a.button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
        a.button:hover {
            background-color: #0056b3;
        }
        
        /* Center buttons */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        /* Apply Now button green color */
        .apply-now-btn {
            background-color: green;
        }

        .apply-now-btn:hover {
            background-color: darkgreen;
        }
        .field {
            margin-bottom: 15px;
        }
        .field label {
            font-weight: bold;
            color: #333;
        }
        .field p {
            margin: 4px 0;
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
            <% 
                    String email = (String) session.getAttribute("email");
                    if (email != null) {
                %>
                    <li><a href="dashboard.jsp"><b>Home</b></a></li>
                <% } else { %>
                    <li><a href="index.html"><b>Home</b></a></li>
                <% } %>
                <li><a href="about.jsp"><b>About</b></a></li>
                <li>
                    <button class="dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown">
                        Scholarships
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="ScholarshipServlet"><b>All Scholarships</b></a></li>
                        <li><a class="dropdown-item" href="login.html"><b>Eligible Scholarships</b></a></li>
                    </ul>
                </li>
                <% 
                    String email1 = (String) session.getAttribute("email");
                    if (email1 != null) {
                %>
                    <li><a href="LogoutServlet"><b>Logout</b></a></li>
                <% } else { %>
                    <li><a href="login.html"><b>Login</b></a></li>
                    <li><a href="register.html"><b>Register</b></a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <div class="container">
        <%
            Scholarship s = (Scholarship) request.getAttribute("scholarship");
            if (s != null) {
        %>
            <h2><%= s.getName() %></h2>
            <div class="field"><label>Provider:</label><p><%= s.getProvider() %></p></div>
            <div class="field"><label>Category:</label><p><%= s.getCategory() %></p></div>
            <div class="field"><label>Last Date:</label><p><%= s.getLastDate() %></p></div>
            <div class="field"><label>Amount:</label><p><%= s.getAmount() %></p></div>
            <div class="field"><label>Age:</label><p><%= s.getAge() %></p></div>
            <div class="field"><label>Annual Income:</label><p><%= s.getAnnualIncome() %></p></div>
            <div class="field"><label>Caste:</label><p><%= s.getCaste() %></p></div>
            <div class="field"><label>Eligibility:</label><p><%= s.getEligibility() %></p></div>
            <div class="field"><label>Documents Required:</label><p><%= s.getDocumentsRequired() %></p></div>
            <div class="button-container">
                <a class="button apply-now-btn" href="<%= s.getOfficialLink() %>" target="_blank">Apply Now</a>
                <a class="button back-to-scholarships-btn" href="ScholarshipServlet">← Back to All Scholarships</a>
            </div>
        <%
            } else {
        %>
            <p>Scholarship details not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
