<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - ScholarQuest</title>
    
    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Varela+Round&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            font-family: 'Varela Round', sans-serif;
            background-color: #f8f9fa;
        }

        .heading {
            text-align: center;
            padding: 40px 20px 20px;
            background-color: #007bff;
            color: white;
        }

        .about-container {
            padding: 40px 20px;
        }

        .about-card {
            max-width: 1000px;
            margin: auto;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .about-image {
            flex: 1 1 300px;
        }

        .about-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .about-content {
            flex: 1 1 400px;
            padding: 30px;
        }

        .about-content h2 {
            font-family: 'Merriweather', serif;
            color: #007bff;
            font-weight: 600;
        }

        .about-content p {
            margin-top: 20px;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .about-card {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>
    <header>
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i>
            <a href="index.html"><h2><b>ScholarQuest </b></h2></a>
        </div>
        <nav>
            <ul>
                <% 
                    // Check if the user is logged in by checking the session for the email
                    String email = (String) session.getAttribute("email");
                    if (email == null) { // User is logged out
                %>
                    <li><a href="index.html"><b>Home</b></a></li> <!-- Redirects to index.jsp when logged out -->
                <% 
                    } else { // User is logged in
                %>
                    <li><a href="dashboard.jsp"><b>Home</b></a></li> <!-- Redirects to dashboard.jsp when logged in -->
                <% 
                    }
                %>
                <li><a href="about.jsp"><b>About</b></a></li>
                
                <li><button class="dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    Scholarships
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="ScholarshipServlet"><b>All Scholarships</b></a></li><br>
                    <li><a class="dropdown-item" href="login.html"><b>Eligible Scholarships</b></a></li>
                </ul>
                </li>
                <% 
                    if (email != null) { // If logged in
                %>
                    <li><a href="LogoutServlet"><b>Logout</b></a></li>
                <% 
                    } else { // If logged out
                %>
                    <li><a href="login.html"><b>Login</b></a></li>
                    <li><a href="register.html"><b>Register</b></a></li>
                <% 
                    }
                %>
            </ul>
        </nav>
    </header>

    <div class="heading">
        <h1>ABOUT US</h1>
        <p>"Empowering dreams, enabling success: Your one-stop destination for scholarships that transform lives and shape futures."</p>
    </div>

    <div class="about-container">
        <div class="about-card">
            <div class="about-image">
                <img src="images/aboutus_img.jpg" alt="About ScholarQuest">
            </div>
            <div class="about-content">
                <h2>"Scholarships: Unlocking doors to brighter futures."</h2>
                <p>Scholar Quest is dedicated to bridging the gap between ambition and opportunity. We provide a streamlined platform that connects students with a wide range of scholarships to support their educational journey. By simplifying the search and application process, we empower learners to focus on their dreams and aspirations. Scholar Quest is your trusted ally in making education affordable and unlocking a world of possibilities.</p>
            </div>
        </div>
    </div>
</body>
</html>
