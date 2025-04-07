<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.html");
        return;
    }
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Scholarships</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" crossorigin="anonymous" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="js/index.js"></script>
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
    <div class="slider-container">
        <div class="slider" id="slider">
          <div class="slide"><img src="indimg/F11 Final.jpg" alt="Slide 1"></div>
          <div class="slide"><img src="./indimg/G3.jpg" alt="Slide 2"></div>
          <div class="slide"><img src="./indimg/H6 Final.jpg" alt="Slide 3"></div>
          <div class="slide"><img src="./indimg/K5.jpg" alt="Slide 4"></div>

          <!-- <div class="slide"><img src="./images/Four.jpg" alt="Slide 1"></div> -->
           
          <div class="slide">
            <div class="slidepre">
                <h2><b>Prime Minister's Scholarship Scheme (PMSS)</b></h2> 
                <br>
                <h6>By The Department of Ex-servicemen Welfare, Ministry of Defence</h6> 
                <br>
                <h5><strong>Rs.2,500/-</strong> per Month for Boys and <strong>Rs.3,000/-</strong> per Month for Girls </h5>
                <br>
                <h6>Scholarships are available for Education at various Technical Institutions</h6>
                <br>
                <a href="https://desw.gov.in/prime-ministers-scholarship-scheme-pmss" class="apply-button">APPLY NOW</a>
            </div>
          </div>
        </div>
        <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
        <button class="next" onclick="moveSlide(1)">&#10095;</button>
      </div>

    <br>
    <br>
    <br>
    <br>
    
    <div class="container">
    <h2 class="title"><span>Popular Scholarship Categories</span></h2>
    <div class="grid">
      <div class="row">
        <div class="card">
          <i class="fas fa-female"></i>
          <span><a href="login.html">For Girls</a></span>
        </div>
        <div class="card">
          <i class="fas fa-plane"></i>
          <span><a href="login.html">International</a></span>
        </div>
        <div class="card">
          <i class="fas fa-users"></i>
          <span><a href="login.html">Government</a></span>
        </div>
      </div>
  
      <div class="row">
        <div class="card">
          <i class="fas fa-university"></i>
          <span><a href="login.html">College Level</a></span>
        </div>
        <div class="card">
          <i class="fas fa-school"></i>
          <span><a href="login.html">School Level</a></span>
        </div>
      </div>
    </div>
  </div>

    <br>
    <br>
    <br>
    
</body>
</html>
