<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 27/04/2024
  Time: 02:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style><%@include file="css/style.css"%></style>
    <!-- BOX ICONS  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body class="body">

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
            <div class="offcanvas-body ">
                <p style="text-align: center; width: 1000px; font-size: 17px;">Select your ticket online now</p>
            </div>

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
<section class="movie-trend">
    <img style="z-index: -1000; width: 1250px; position: absolute; top: -300px; left: 0;" src="images/bg2.jpg">
    <div style="width: 100%; padding-top: 50px; padding-left: 120px; display: flex; flex-direction: row;"
         class="text-white my-4">
        <img style="height: 250px; width: 170px; margin: 10px 0;" class="card border-0"
             src="${Movie.getPictureURL()}" alt="">
        <div style="margin-left: 20px;">
            <h4 class="movieTitle" style="text-align: start; padding-top: 10px;">${Movie.getTitleFilm()}</h4>
            <p style="font-size: 15px; text-align: start;">Genre : ${Movie.getGenreFilm()}</p>
            <p style="font-size: 11px; text-align: start;">${Movie.getRunTimeFilm()} - <span>${Movie.getProducedIn()} - </span><span
                    style="font-weight: bold;">${Movie.getDirectedBy()}</span></p>
            <p style="font-size: 11px; text-align: start;"><span
                    style='color:#fdb000; background: rgba(0, 0, 0, 0.6);' class="text-success rounded p-1">92%
                        Match </span><span style='background: rgba(0, 0, 0, 0.6);' class="rounded p-1 mx-1">TV -
                        MA</span><span style=' background: rgba(0, 0, 0, 0.6); font-weight: bold;'
                                       class="rounded p-1 mx-1">HD</span><span style='color:#fdb000; background: rgba(0, 0, 0, 0.6);'
                                                                               class="rounded p-1 mx-1">${Movie.getRatingFilm()} <i class='bx bxs-star' style='color:#fdb000'></i></span></p>
            <div class="text-light">
                <h5>Stream Date </h5>
                <div style="display: flex; gap: 30px;" class="buttons">
                    <c:forEach var="date" items="${dates}">
                        <button style="font-size: 15px; display: flex; flex-direction: column;"
                                class="btn px-4 py-1 text-light mt-2">
                            <span>${date.getDay()}</span>
                            <span style="font-size: 25px;">${date.getNumDay()}</span>
                            <span>${date.getMonth()}</span>
                        </button>
                    </c:forEach>
                </div>

                <h5 class="mt-4">Stream Time </h5>
                <div style="display: flex; gap: 20px;" class="">
                    <button style="font-size: 15px; display: flex; flex-direction: column; background-color: rgba(2, 94, 30, 0.436); border: 1px solid green;"
                            class="btn py-1 text-success mt-2"><p style="margin: 5px;">10:00</p></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column; background-color: rgba(2, 94, 30, 0.436); border: 1px solid green;"
                            class="btn py-1 text-success mt-2"><p style="margin: 5px;">12:00</p></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column; background-color: rgba(2, 94, 30, 0.436); border: 1px solid green;"
                            class="btn py-1 text-success mt-2"><p style="margin: 5px;">14:00</p></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column; background-color: rgba(2, 94, 30, 0.436); border: 1px solid green;"
                            class="btn py-1 text-success mt-2"><p style="margin: 5px;">16:00</p></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column; background-color: rgba(2, 94, 30, 0.436); border: 1px solid green;"
                            class="btn py-1 text-success mt-2"><p style="margin: 5px;">18:00</p></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column; background-color: rgba(2, 94, 30, 0.436); border: 1px solid green;"
                            class="btn py-1 text-success mt-2"><p style="margin: 5px;">20:00</p></button>
                </div>
                <h5 class="mt-4">Stream Experience </h5>
                <div style="display: flex; gap: 20px;" class="">
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/4DX.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/screenX.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/onyx.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/mx4d.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/IMAX.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/dolby.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/D-BOX.png"
                                                                  alt=""></button>
                    <button style="font-size: 15px; display: flex; flex-direction: column;"
                            class="btn py-1 text-light mt-2"><img style="height: 20px;" src="images/Logo_BIG.png"
                                                                  alt=""></button>
                </div>
            </div>
        </div>

    </div>

    <section style="width: 100%; margin-top: 20px; display: flex; flex-direction: row;" class="seat text-light">
        <div style="height: 500px; width: 400px;" class="container">
            <div style="width: 90%; height: 85%; margin-top: 50px; margin-left: 10px; border-radius: 20px; background-color: rgba(140,140,140,0.3); border: 1px solid rgba(150, 26, 26, 0.6);" class="">
                <div style="padding-left: 50px;" class="col-10 py-2">
                    <label style="font-size: 15px;" for="date">Date</label>
                    <input class="form-control text-light bg-dark mt-2 px-4" type="date" id="date" class="date" name="date" value="" min="${minDate}" max="${maxDate}" />
                </div>
                <div style="padding-left: 50px;" class="col-10 py-2">
                    <label style="font-size: 15px;" for="time">Time</label>
                    <input class="form-control text-light bg-dark mt-2 px-4" type="time" id="time" class="time" name="time" list="hoursList" min="10:00:00" max="20:00:00">
                    <datalist id="hoursList">
                        <option value="10:00:00"></option>
                        <option value="12:00:00"></option>
                        <option value="14:00:00"></option>
                        <option value="16:00:00"></option>
                        <option value="18:00:00"></option>
                        <option value="20:00:00"></option>
                    </datalist>

                </div>
                <div style="padding-left: 50px;" class="col-10 py-2">
                    <label style="font-size: 15px;" for="CheckIn">Experience</label>
                    <select class="form-select text-light bg-dark mt-2 px-4" id="stream-experience" name="experience" class="experience" aria-label="Stream Experience">
                        <option selected disabled>Select experience</option>
                        <option value="4DX">4DX</option>
                        <option value="ScreenX">ScreenX</option>
                        <option value="Onyx">Onyx</option>
                        <option value="MX4D">MX4D</option>
                        <option value="IMAX">IMAX</option>
                        <option value="Dolby">Dolby</option>
                        <option value="D-BOX">D-BOX</option>
                        <option value="BIG">BIG</option>
                    </select>

                </div>
                <div style="padding-left: 50px;" class="col-10 py-2">
                    <label style="font-size: 15px;" for="Promotions">Promotions</label>
                    <div style="display: flex; gap: 20px;">
                        <label style="height: 60px; width: 50px;" class="form-control bg-dark mt-2 offer" ><input style="display: none;" type="checkbox" value="RedBull" id="offer" class="offer-checkbox" name="offer" >
                            <img style="height: 50px;" src="images/redBull.png" alt="">
                        </label>
                        <label style="height: 60px; width: 60px;" class="form-control bg-dark mt-2 offer" ><input style="display: none;" type="checkbox" value="PopCorn" id="offer" class="offer-checkbox" name="offer" >
                            <img style="height: 50px;" src="images/popcorn.png" alt="">
                        </label>
                        <label style="height: 60px; width: 75px;" class="form-control bg-dark mt-2 offer" ><input style="display: none;" type="checkbox" value="Burger" id="offer" class="offer-checkbox" name="offer" >
                            <img style="height: 50px;" src="images/burger.png" alt="">
                        </label>
                    </div>
                    <div style="display: flex; gap: 29px;">
                        <label style="height: 50px; width: 100px; text-align: center;" class="form-control bg-dark mt-2 offer" ><input style="display: none;" type="checkbox" value="Pizza" id="offer" class="offer-checkbox" name="offer" >
                            <img style="height: 40px;" src="images/pizza.png" alt="">
                        </label>
                        <label style="height: 50px; width: 100px; text-align: center;" class="form-control bg-dark mt-2 offer" ><input style="display: none;" type="checkbox" value="3d Glass" id="offer" class="offer-checkbox" name="offer" >
                            <img style="height: 40px;" src="images/3dGlass.png" alt="">
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: flex; flex-direction: column; align-items: center;">
            <h5>Select your seats</h5>
            <p>Magemara de Béni Mellal</p>
            <img style=" width: 400px;" src="images/screen-mirror.png" alt="">
            <p style="margin-top: -30px; color: #460d0d; font-weight: bold;">Screen mirror</p>

            <div style="margin-top: 30px; width: 500px; height: 300px;"
                 class="chairs container d-flex flex-direction-row justify-content-center">

                <table class="vip1">
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->

                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A0"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-A9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-B9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-C9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                </table>
                <table style="margin: 0 30px;">
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="A12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="B12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="C8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="D1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="D2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="D3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="D4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="D5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="D6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="E12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="F12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>

                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="G12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="H1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="H2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="H3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="H4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="H5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="H6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="IJ12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K10"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K11"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="K12"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>

                </table>
                <table>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-D9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-E9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F2"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F3"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F4"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F5"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F6"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F7"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F8"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                    </tr>
                    <tr>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-F9"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <td><label><input hidden type="radio" class="chair-radio" name="chair1" value="VP-G1"><i class='bx bx-chair bx-rotate-180 chair' style='color:#ffffff'></i></label></td>
                        <th class="empty-cell"></th> <!-- Cellule vide -->
                    </tr>
                </table>


            </div>

        </div>
        <form action="reserve-now" method="post">
            <div style="height: 500px; width: 400px;" class="container">
                <div style="width: 90%; height: 85%; margin-top: 50px; margin-left: 30px; border-radius: 20px; border: 1px solid rgba(150, 26, 26, 0.6); background-color: rgba(140,140,140,0.3)">
                    <div style="padding-left: 15px; border-bottom: 1px solid #460d0d;">
                        <p>You have selected :</p>
                        <input type="hidden" name="idInput" class="idInput" value="${Movie.getIdFilm()}">
                    </div>
                    <div style="background-color: black; height: 340px; padding-left: 15px;">
                        <span style="color: gray; font-size: 15px;">Movie</span>
                        <p id="titleInput"></p>
                        <input type="hidden" name="titleInput" class="titleInput" value="">
                        <span style="color: gray; font-size: 15px;">Location</span>
                        <p>Magemara de Béni Mellal</p>
                        <input type="hidden" name="locationInput" class="locationInput" value="">
                        <span style="color: gray; font-size: 15px;">Date</span>
                        <p id="dateInput">YYYY-MM-DD</p>
                        <input type="hidden" name="dateInput" class="dateInput" value="">
                        <div style="display: flex; gap: 30px;">
                            <div>
                                <span style="color: gray; font-size: 15px;">Time</span>
                                <p id="timeInput">--:--:--</p>
                                <input type="hidden" name="timeInput" class="timeInput" value="">
                            </div>
                            <div>
                                <span style="color: gray; font-size: 15px; padding-top: 5px;">Experience</span>
                                <p id="experienceInput">AAA</p>
                                <input type="hidden" name="experienceInput" class="experienceInput" value="">
                            </div>
                            <div>
                                <span style="color: gray; font-size: 15px; padding-top: 5px;">Seat</span>
                                <p   id="selectedSeat">AA-AA</p>
                                <input type="hidden" name="seatInput" class="seatInput" id="seatInput" value="">
                            </div>

                        </div>
                        <span style="color: gray; font-size: 15px; padding-top: 5px;">Promotions</span>
                        <p name="promo-1"  id="selectedOffers"></p>
                        <input type="hidden" name="offerInput" class="offerInput" id="offerInput" value="">
                    </div>
                    <button style="width: 100%; height: 42px; background-color: rgba(150, 26, 26); border-top-left-radius: 0; border-top-right-radius: 0;" type="submit" value="submit" class="btn text-light"> Reserve</button>
                </div>
            </div>
        </form>
    </section>
    <section style="height: 300px; padding-left: 50px; margin-top: -850px;" class="movie-card-section">

    </section>
<script>
        document.addEventListener('DOMContentLoaded', function () {
            const chairCells = document.querySelectorAll('.bx-chair');

            chairCells.forEach(function (chairCell) {
                chairCell.addEventListener('click', function () {
                    const isGreen = chairCell.style.color === "rgb(6, 192, 6)";
                    chairCells.forEach(function (cell) {
                        cell.style.color = '#ffffff';
                    });
                    if (!isGreen) {
                        chairCell.style.color = "rgb(6, 192, 6)";
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            const offers = document.querySelectorAll('.offer');
            offers.forEach(function (offer) {
                offer.addEventListener('click', function () {
                    this.classList.remove('initial-state');
                    this.classList.add('selected-offer');
                });
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            const movieTitleElement = document.querySelector('.movieTitle');
            const titleParagraph = document.getElementById('titleInput');
            const titleValue = document.querySelector('.titleInput');
            if (movieTitleElement && titleParagraph) {
                const movieTitle = movieTitleElement.textContent.trim();
                titleParagraph.textContent = movieTitle;
                titleValue.value = movieTitle;

            }
        });
        document.addEventListener('DOMContentLoaded', function () {
            const dateInput = document.getElementById('date');
            const dateParagraph = document.getElementById('dateInput');
            const dateValue = document.querySelector('.dateInput')
            if (dateInput && dateParagraph) {
                dateInput.addEventListener('change', function () {
                    dateParagraph.textContent = dateInput.value;
                    dateValue.value = dateInput.value
                });
            }
        });
        document.addEventListener('DOMContentLoaded', function () {
            const dateInput = document.getElementById('time');
            const dateParagraph = document.getElementById('timeInput');
            const timeValue = document.querySelector('.timeInput')
            if (dateInput && dateParagraph) {
                dateInput.addEventListener('change', function () {
                    dateParagraph.textContent = dateInput.value;
                    timeValue.value = dateInput.value;
                });
            }
        });
        document.addEventListener('DOMContentLoaded', function () {
            const dateInput = document.getElementById('stream-experience');
            const dateParagraph = document.getElementById('experienceInput');
            const experienceValue = document.querySelector('.experienceInput');
            if (dateInput && dateParagraph) {
                dateInput.addEventListener('change', function () {
                    dateParagraph.textContent = dateInput.value;
                    experienceValue.value = dateInput.value;
                });
            }
        });
        document.addEventListener('DOMContentLoaded', function () {
            const chairs = document.querySelectorAll('.chair-radio');
            const selectedSeat = document.getElementById('selectedSeat');
            const valueSeat = document.querySelector('.seatInput');
            chairs.forEach(function (chair) {
                chair.addEventListener('change', function () {
                    chairs.forEach(function (c) {
                        c.closest('td').classList.remove('selected-seat');
                    });
                    if (this.checked) {
                        this.closest('td').classList.add('selected-seat');
                        selectedSeat.textContent = this.value;
                        valueSeat.value = this.value;
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            const offerCheckboxes = document.querySelectorAll('.offer-checkbox');
            const selectedOffers = document.getElementById('selectedOffers');
            const valueOffers = document.getElementById('offerInput');
            offerCheckboxes.forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    let selectedOffersArray = [];
                    offerCheckboxes.forEach(function (cb) {
                        if (cb.checked) {
                            selectedOffersArray.push(cb.value);
                            cb.closest('label').classList.add('selected-offer');
                        } else {
                            cb.closest('label').classList.remove('selected-offer');
                        }
                    });
                    selectedOffers.textContent = selectedOffersArray.join(' - ');
                    valueOffers.value = selectedOffersArray.join(' - ');
                });
            });
        });

    </script>
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