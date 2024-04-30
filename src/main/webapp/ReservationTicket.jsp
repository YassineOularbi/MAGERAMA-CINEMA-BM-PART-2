<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language = "java" %>
<%@ page import = "java.sql.*" %>

<%


    if(session.getAttribute("login") != null){
        String login = session.getAttribute("login").toString();

    }else{
        response.sendRedirect("authentication.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maregara Cinema</title>
    <link rel="icon" href="images/logo.png">
    <!-- bootstrap css link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer">
    <!-- Css link -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style><%@include file="css/style.css"%></style>
    <!-- BOX ICONS  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body class="body-ticket">
<!-- Navbar -->
<nav class="navbar nav-movie fixed-top navbar-expand-lg py-0" style="height: 50px;">
    <div class="container">
        <img class="navbar-brand me-auto" style="width: 40px" src="images/logo.png">
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
             aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">WELCOME TO YOUR CINEMA</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                    <li class="nav-item active-menu">
                        <a class="nav-link text-light mx-lg-2 mx-4" href="/Magerama_cinema_BM_war_exploded/display">ShowTimes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-lg-2 mx-4" href="#">Films</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-lg-2 mx-4" href="#">Cinemas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-lg-2 mx-4" href="#">Promotions</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light mx-lg-2 mx-4" href="#">Events</a>
                    </li>
                </ul>
            </div>

        </div>
        <div class="search">
            <form action="">
                <li class="nav-link search-bar active rounded col-10">
                    <input class="search col-10 text-light bg-slight border border-0 px-3 py-1 rounded" id="search"
                           type="text" placeholder="Search for movie...">
                    <i style="color: white;" onclick="searchWeather()" class="bx bx-search-alt icon rounded"></i>
                </li>
            </form>
        </div>
        <i class='bx bx-user bx-flip-horizontal icon rounded' style='color:white' data-bs-toggle="modal" data-bs-target="#exampleModal" type="button"></i>



        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-dark text-light">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">User account</h5>
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Ajoutez ici le contenu des coordonnées de l'utilisateur -->
                <p>Nom: ${login}</p>
                <p>Email: ${login}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="Logout" type="button" class="btn btn-warning">Log out</a>
                <a href="reserve-history" class="btn btn-danger text-light">Reservation<i class='bx bxs-coupon'
                                                                   style='color:#ffffff'></i></a>
            </div>
        </div>
    </div>
</div>
<img style="position: absolute; width: 1280px; height: 590px; z-index: -1000;" src="${Movie.getBackgroundURL()}" alt="">
<div class="ticket created-by-anniedotexe">
    <div class="left">
        <div class="image">
            <img style="margin-bottom: -430px; z-index: -1000; height: 457px; width: 300px;" src="${Movie.getPictureURL()}" alt="">
            <p style="margin-top: -30px;" class="admit-one">
                <span>TICKET ONE</span>
                <span>TICKET ONE</span>
                <span>TICKET ONE</span>
            </p>
            <div style="margin-top: -15px; padding-left: 290px" class="ticket-number">
                <p>
                    ${qrcode}
                </p>
            </div>
        </div>
        <div style="margin-left: 40px;" class="ticket-info">
            <p class="date">

                <span style="width: 260px;" class="june-29">${date}</span>
                <span> AT </span>
                <span>${time}</span>
            </p>
            <div class="show-name">
                <h1>Your cinema Ticket</h1>
                <h2>${Movie.getTitleFilm()}</h2>
            </div>
            <div class="time">
                <p>Seat code <span>:</span> ${seat}</p>
                <c:choose>
                    <c:when test="${experience == '4DX'}">
                        <p>Experience :  <span><img style="height: 30px; align-items: center;" src="images/4DX.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'ScreenX'}">
                        <p>Experience :  <span><img style="height: 30px; align-items: center;" src="images/screenX.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'MX4D'}">
                        <p>Experience :  <span><img style="height: 30px; align-items: center;" src="images/mx4d.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'Onyx'}">
                        <p>Experience :  <span><img style="height: 30px; align-items: center;" src="images/onyx.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'IMAX'}">
                        <p>Experience :  <span><img style="height: 30px; align-items: center;" src="images/IMAX.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'Dolby'}">
                        <p>Experience :  <span><img style="height: 30px; align-items: center;" src="images/dolby.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'D-BOX'}">
                        <p>Experience : <span><img style="height: 30px; align-items: center;" src="images/D-BOX.png"></span></p>
                    </c:when>
                    <c:when test="${experience == 'BIG'}">
                        <p>Experience : <span><img style="height: 30px; align-items: center;" src="images/BIG.png"></span></p>
                    </c:when>
                </c:choose>
                <p>Promotions <span>:</span> ${offer}</p>
            </div>
            <p class="location"><span>Magemara Cinema</span>
                <span class="separator"><img style="height: 30px;" src="images/logo.png"></span> de Béni Mellal
            </p>
        </div>
    </div>
    <div class="right">
        <p class="admit-one">
            <span>TICKET ONE</span>
            <span>TICKET ONE</span>
            <span>TICKET ONE</span>
        </p>
        <div class="right-info-container">
            <div class="show-name">
                <h1>MORE INFO</h1>
            </div>

            <img class="barcode">
                <img style="width: 170px" src="https://i.ibb.co/pPrkf5y/Untitled.png" alt="QR code">
            </div>
            <div style="padding-left: 70px" class="playstore">
                <img style="width: 135px;" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png">
                <img style="width: 127px; padding-left: 9px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Download_on_the_App_Store_Badge.svg/2560px-Download_on_the_App_Store_Badge.svg.png
">
            </div>

            <p style="padding-left: 100px" class="ticket-number">${qrcode}</p>
        </div>
    </div>



<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- JavaScript Link -->
<script><%@include file="js/script.js"%></script>

<!-- JavaScript Link -->

<!-- bootstrap js link -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- bootstrap js link -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>


</html>