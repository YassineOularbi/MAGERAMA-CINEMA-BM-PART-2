<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language = "java" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Film Rating and Commenting Platform</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style><%@ include file="css/view.css"%></style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maregara Cinema</title>
    <link rel="icon" href="images/logo.png">
    <!-- bootstrap css link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer">
    <!-- Css link -->

    <style><%@include file="css/style.css"%></style>
    <!-- BOX ICONS  -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>

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
                        <a class="nav-link text-light mx-lg-2 mx-4" href="/Magerama_cinema_BM_war_exploded/cinema-home">Films</a>
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
        <i class='bx bx-user bx-flip-horizontal icon rounded' style='color:white'></i>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
<!-- video -->
<div class="container mt-4">
    <div class="flex flex-col justify-content-center align-items-center">
        <div class="flex flex-col gap-1 items-center mt-3">
            <h1 class="text-shadow colored-text font-weight-bold text-white">${Movie.getTitleFilm()}</h1>
        </div>
    </div>
    <div class="flex flex-col justify-content-center align-items-center">
        <div class="d-flex justify-content-center min-width-200">
            <iframe width="960" height="515"  src="${Movie.getTrailer()}"></iframe>
        </div>
    </div>
    <br>
    <!-- Description -->
    <div class="container">
        <div id="ratingSection" class="container p-4 flex flex-col justify-content-center align-items-center">
            <div class="star-rating d-flex justify-content-center gap-3 p-2">
                <span class="fa fa-star-o display-10 disabled" data-rating="1"></span>
                <span class="fa fa-star-o display-10 disabled" data-rating="2"></span>
                <span class="fa fa-star-o display-10 disabled" data-rating="3"></span>
                <span class="fa fa-star-o display-10 disabled" data-rating="4"></span>
                <span class="fa fa-star-o display-10 disabled" data-rating="5"></span>
                <input type="hidden" name="whatever1" class="rating-value" value="0">
            </div>
        </div>
    </div>
</div>


<!-- Rate the film -->
<div id="ratingSection"
     class="container mt-5 border-top p-4 gap-5 flex flex-col justify-content-center align-items-center">
    <h2 class="text-start mb-4">Rate the film</h2>
    <div class="star-rating d-flex justify-content-center gap-3 p-2">
        <span class="fa fa-star-o display-5" data-rating="1"></span>
        <span class="fa fa-star-o display-5" data-rating="2"></span>
        <span class="fa fa-star-o display-5" data-rating="3"></span>
        <span class="fa fa-star-o display-5" data-rating="4"></span>
        <span class="fa fa-star-o display-5" data-rating="5"></span>
        <input type="hidden" name="whatever1" class="rating-value" value="0">
    </div>
</div>


<!-- Comment Form Section -->
<div class="container d-flex flex-column align-items-center justify-content-center rounded-5 p-3 my-5"
     style=" background-position: center; background-size: cover;">
    <form class="col-lg-6" action="view-now" method="post">
        <h2 class="text-center mb-3">Leave a Reply</h2>
        <input type="hidden" name="filmId" value="${Movie.getIdFilm()}">
        <div class="form-group">

            <input type="hidden" class="form-control" id="nameInput" placeholder="Enter your name">
        </div>
        <div class="form-group mt-3">
            <input type="hidden" class="form-control" id="emailInput" placeholder="Enter your email">
        </div>
        <div class="form-group mt-3">
            <textarea class="form-control" id="commentText" rows="3" placeholder="Your comment" name="commentText"></textarea>
        </div>
        <button type="submit" class="btn btn-dark mt-3" id="submitButton">Post comment</button>
    </form>




</div>

<div class="container mt-5">
    <h1 class="text-dark mb-4">Recent Comments</h1>
    <c:forEach var="show" items="${shows}">
        <div class="row align-items-center gap-2  border-top">
            <div class="col-md-2 d-flex align-items-center ">
                <img src="img/user.jpg" class="img-fluid" alt="User Image" width="30px" height="30px">
                <h5>${UserName}</h5>
            </div>
            <div class="col-md-6">
                <p class="mt-2">${show.getCommentText()}</p>
            </div>
        </div><br>

    </c:forEach>

</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script><%@ include file="js/view.js"%></script>
</body>

</html>

