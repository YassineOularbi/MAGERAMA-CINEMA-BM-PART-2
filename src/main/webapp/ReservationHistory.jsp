<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>

<%!
    // Fonction pour formater la date SQL
    public String formatDateFromSQL(Date sqlDate) {
        try {
            // Format de sortie désiré
            SimpleDateFormat outputFormat = new SimpleDateFormat("EEE, MMMM dd 'TH' yyyy");

            // Conversion de la date SQL en objet Date
            Date date = new Date(sqlDate.getTime());
            // Formatage de la date selon le format de sortie
            String formattedDate = outputFormat.format(date);

            return formattedDate;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error formatting date";
        }
    }
%>

<%
    if(session.getAttribute("login") != null){
        String login = session.getAttribute("login").toString();
    }else{
        try {
            response.sendRedirect("authentication.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
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
<body>
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
            <form action="s" method="post">
                <li class="nav-link search-bar active rounded col-10">
                    <input class="search col-10 text-light bg-slight border border-0 px-3 py-1 rounded" id="titleFilm" name="titleFilm"
                           type="text" placeholder="Search for movie...">
                    <i type="submit" style="color: white;" class="bx bx-search-alt icon rounded"></i>
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
                <a href="reserve-history"  class="btn btn-danger text-light">Reservation<i class='bx bxs-coupon'
                                                                   style='color:#ffffff'></i></a>
            </div>
        </div>
    </div>
</div>

<img style="z-index: -1000; width: 1300px; height: 800px; position: absolute; top: 0; left: 0;" src="images/bg-GOT.jpg">
    <section style="margin-top: -120px;" class="home">

        <div class="container">
            <h1 class="upcomming">Your reservation's history</h1>
            <c:forEach var="reservation" items="${arrayReservation}" varStatus="loop">
                <div class="item">
                    <div class="item-right">
                        <span class="up-border"></span>
                        <span class="down-border"></span>
                        <h1 style="padding-top: 13px; font-size: 50px;">#${loop.index + 1}</h1>
                    </div> <!-- end item-right -->

                    <div class="item-left">
                        <div class="info">
                            <p style="margin: 0;" class="text-dark">
                                <span style="font-weight: bold;">Date :</span>${reservation.getDateReservation()}</p>
                            <p style="margin: 0;" class="text-dark"><span style="font-weight: bold;">Time :</span> ${reservation.getTimeReservation()}</p>
                        </div>
                        <div class="barcode">
                            <img style="height: 60px;" src="images/barcode.png" alt="">
                            <p style="margin: 0;" class="text-dark">${reservation.getQrCodeBillet()}</p>
                        </div>
                        <button class="tickets">
                            <a href="reservation-ticket?reservationId=${reservation.getIdReservation()}" class="rounded-pill Reservation" style="height: 35px; width: 35px; background-color: #cb1111;">
                                <i style="padding: 9px;"  class='bx bxs-coupon' style='color:#ffffff'></i>
                            </a>
                        </button>
                    </div> <!-- end item-right -->
                </div> <!-- end item -->
            </c:forEach>


        </div>
    </section>

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

