<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 21/04/2024
  Time: 03:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<section class="home">
    <div style="position: absolute; top:250px; left: 37px;"  class="container rounded">
        <table style="width: 107%; background: rgba(12,14,18,0.78)" class="table table-striped rounded">
            <thead style="padding: 10px">
            <tr>
                <th style="padding-left: 20px; border-top-left-radius: 10px">Reservation ID</th>
                <th>Film ID</th>
                <th>User ID</th>
                <th>User Name</th>
                <th>User Email</th>
                <th>Date Reservation</th>
                <th>Time Reservation</th>
                <th style="border-top-right-radius: 10px">Actions</th> <!-- J'ai changé le nom de la colonne pour inclure les actions -->
            </tr>
            </thead>
            <tbody style="padding: 10px">
            <c:forEach var="reservation" items="${arrayReservation}">
                <tr>
                    <td style="padding-left: 20px">${reservation.getIdReservation()}</td>
                    <td>${reservation.getIdUser()}</td>
                    <td>${reservation.getIdFilm()}</td>
                    <td>${reservation.getUserName()}</td>
                    <td>${reservation.getUserMail()}</td>
                    <td>${reservation.getDateReservation()}</td>
                    <td>${reservation.getTimeReservation()}</td>
                    <td>
                        <a href="reservation-ticket?reservationId=${reservation.getIdReservation()}" style="background: red; padding: 10px 20px; height: 20px; width: 50px;" role="button">Ticket</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

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

