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
        
        .search-container  {
        position: relative;
        display: flex;
        align-items: center;
        width: 60px;
        margin-right: 10px;
        margin-left: 120px;
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
        width: 60px;
        margin-right: 10px;
        margin-left: 120px;
        position: relative;
        }
        
        .dropdown-content {
        display: none;
  		position: absolute;
  		top: 36px;
 		left: 0;
  		background-color: white;
 		border: 1px solid #ddd;
  		border-radius: 6px;
 		box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  		padding: 10px;
  		z-index: 1000;
  		}
  		
  		.dropdown-content label {
  		display: block;
  		margin-bottom: 5px;
  		cursor: pointer;
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
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="ScholarshipServlet" class="active">Scholarships</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="register.html">Register</a></li>
            </ul>
        </nav>
    </header>
    
    
    

    	<br>
        <h2 style="text-align: center; margin-top: 20px;font-size: 35px;font-weight: bold;">All Scholarships</h2>
        
        <br>
        <br>
        
		
        <!-- Filter Button -->
        <!--<div class="filter-dropdown">
        <button id="filterToggle">
        <img src="./images/Filter.png" alt="Filter" style="width: 24px; height: 24px; cursor: pointer;" />
        </button>
        

        <div id="filterMenu" class="dropdown-content">
      	<label><input type="checkbox" value="College Level" class="filter-checkbox" /> College Level</label>
      	<label><input type="checkbox" value="School Level" class="filter-checkbox" /> School Level</label>
      	<label><input type="checkbox" value="Government" class="filter-checkbox" /> Government</label>
      	<label><input type="checkbox" value="Private" class="filter-checkbox" /> Private</label>
      	</div>
      	</div>
      	-->

      	
        
      
        <div class="search-container">
        <div class="search-icon"><i class="fas fa-search"></i></div>
        <input type="text" class="search-input" placeholder="Search">
        </div>
        
    <main>     
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
