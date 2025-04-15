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
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="js/index.js"></script>
</head>

<style>
	
/*categories*/

.container {
    /* background-color: #f6f6ff; */
    padding: 2rem;
    border-radius: 0.5rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 1400px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.2) !important;
    backdrop-filter: blur(87px) !important; /* Smooth glass effect */
    border: none !important;
    box-shadow: none !important;
    backdrop-filter: blur(10px);
}

.title {
    text-align: center !important;
    font-size: 1.5rem;
    font-weight: 600 !important;
    margin-bottom: 3.10rem;
    margin-top: 7px;
}
.title span {
    font-weight: 700;
}
.grid {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    gap: 1.3rem;
    display: flex;
    /* flex-wrap: wrap;
    justify-content: center; */
    flex-direction: column;
    align-items: center;
    /* gap: 1.5rem; */
    /* gap: 1.5rem; */
    margin-bottom: 15px;
}

.row {
    display: flex;
    justify-content: center;
    gap: 1.5rem;
    flex-wrap: wrap;
}

@media (min-width: 640px) {
    .grid {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media (min-width: 1024px) {
    .grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

/* .card {
    background-color: #ffffff;
    padding: 1rem;
    border-radius: 0.5rem;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center !important;
    justify-content: center !important;
    text-decoration: none;
    height: auto;
    transition: background-color 0.3s ease;
} */

.card {
    width: 308px; /*or any fixed width you prefer*/
    background-color: #ffffff;
    padding: 1rem;
    border-radius: 0.5rem;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    height: auto;
    text-align: center;
    transition: background-color 0.3s ease;
}


.card i{
    color: black;
    /* padding-top: 10px; */
    margin-top: 7.8px;
    /* margin-bottom: 2px; */
    align-items: center !important;
    justify-content: center !important;
}

.card a{
    text-decoration: none;
    color: black;
    /* margin-top: 3%;
    margin-bottom: 1px; */
    
}

.card span{
    /* padding: 9px; */
    margin-top: 9.75px;
    margin-bottom: 2.4px;
}

.card:hover {
    background-color: lightseagreen;  /* Change this to your desired hover color */
}

/* .card a:hover{
    color: lightseagreen;
    
} */

.card a:hover::after{
    transform: scaleX(1);
    color: aqua;
    
}

.card i {
    font-size: 1.5rem;
    margin-right: 0.5rem;
}
</style>

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
                <li><button class="dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    Scholarships
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="ScholarshipServlet"><b>All Scholarships</b></a></li><br>
                    <li><a class="dropdown-item" href="ScholarshipServlet?mode=eligible"><b>Eligible Scholarships</b></a></li>
                </ul>
                </li>
                <li><a href="LogoutServlet"><b>Logout</b></a></li>
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
    
 <!--<div class="container">
  <h2 class="title"><span>Popular Scholarship Categories</span></h2>
  <div class="grid">
    <div class="row">
      <div class="card">
        <i class="fas fa-female"></i>
        <span><a href="categories.jsp?category=For Girls">For Girls</a></span>
      </div>
      <div class="card">
        <i class="fas fa-plane"></i>
        <span><a href="categories.jsp?category=International">International</a></span>
      </div>
      <div class="card">
        <i class="fas fa-users"></i>
        <span><a href="categories.jsp?category=Government">Government</a></span>
      </div>
    </div>

    <div class="row">
      <div class="card">
        <i class="fas fa-university"></i>
        <span><a href="categories.jsp?category=College Level">College Level</a></span>
      </div>
      <div class="card">
        <i class="fas fa-school"></i>
        <span><a href="categories.jsp?category=School Level">School Level</a></span>
      </div>
    </div>
  </div>
</div>-->


<div class="container">
    <h2 class="title"><span>Popular Scholarship Categories</span></h2>
    <div class="grid">
      <div class="row">
        <div class="card">
          <i class="fas fa-female"></i>
          <span><a href="categories.jsp?category=For Girls">For Girls</a></span>
        </div>
        <div class="card">
          <i class="fas fa-plane"></i>
          <span><a href="categories.jsp?category=International">International</a></span>
        </div>
        <div class="card">
          <i class="fas fa-users"></i>
          <span><a href="categories.jsp?category=Government">Government</a></span>
        </div>
      </div>
  
      <div class="row">
        <div class="card">
          <i class="fas fa-university"></i>
          <span><a href="categories.jsp?category=College Level">College Level</a></span>
        </div>
        <div class="card">
          <i class="fas fa-school"></i>
          <span><a href="categories.jsp?category=School Level">School Level</a></span>
        </div>
      </div>
    </div>
  </div>

    <br>
    <br>
    <br>
    
</body>
</html>
