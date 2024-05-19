<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language = "java" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

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
    <style><%@include file="css/view.css"%></style>

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

<section class="movie-trend">
    <img style="z-index: -1000; width: 1275px; position: absolute; top: -300px; left: 0;" src="images/bg5.jpg">
    <div style="width: 70%; padding-top: 50px; padding-left: 120px; display: flex; flex-direction: row;"
         class="text-white my-4">
        <div style="display: flex; flex-direction: column">
            <img style="height: 250px; width: 170px; margin: 10px 0;" class="card border-0"
                 src="${Movie.getPictureURL()}" alt="">
        </div>
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
            <p style="font-size: 15px; text-align: start;">${Movie.getDescriptionFilm()}</p>
            <div class="buttons text-light">
                <a  class="btn text-light mt-2">Add to playlist <i class='bx bxs-right-arrow'
                                                                   style='color:#ffffff'></i></a>
                <a href="reserve-now?id=${trendFilms.getIdFilm()}" class="btn btn-book text-light mt-2">Book Now <i class='bx bxs-coupon'
                                                                                                                    style='color:#ffffff'></i></a>
            </div>
        </div>
    </div>
    </div>

</section>
<!-- video -->


<div class="container" style="margin-top: -350px">
    <div class="flex flex-col justify-content-center align-items-center">
        <div class="flex flex-col gap-1 items-center mt-3">
            <h1 s class="font-weight-bold text-white m-5">${Movie.getTitleFilm()} | Official Trailer (${Movie.getDirectedBy()})</h1>
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
        <div class="app">
            <div class="rating">
                <div class="rating__average">
                    <h1 class="average">${average}</h1>
                    <div class="star-outer">
                        <div class="star-inner"></div>
                    </div>
                    <p style="font-size: 20px;">${total}</p>
                </div>
                <div class="rating__progress">
<c:forEach var="rating" items="${RatingCount}">
                    <div class="rating__progress-value">
                        <p>${rating.getRating()} <span class="star">&#9733;</span></p>
                        <div class="progress">
                            <div class="bar" style="width: ${rating.getPercent()}%;">
                            </div>
                        </div>
                        <p>${rating.getCount()}</p>
                    </div>
</c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<section style="height: 600px; padding-left: 50px; position: absolute; top: 400px; width: 100%; z-index: -1000" class="movie-card-section">

</section>
<div class="comment-section animate__animated animate__fadeIn">
    <form action="view-now" method="post">
    <h2>Comments & Ratings</h2>
    <div class="comments"></div>
    <textarea name="comment" id="commentInput" placeholder="Add a comment..."></textarea>
    <div class="rating">
        <div class="stars" onclick="setRating(event)">
            <span class="star" data-value="1">&#9733;</span>
            <span class="star" data-value="2">&#9733;</span>
            <span class="star" data-value="3">&#9733;</span>
            <span class="star" data-value="4">&#9733;</span>
            <span class="star" data-value="5">&#9733;</span>
        </div>
    </div>
    <input class="rated" type="hidden" name="rating" value="">
    <input type="hidden" name="filmId" value="${Movie.getIdFilm()}">
    <button class="btn btn-danger" type="submit">Add Comment ></button>
    </form>
</div>

<%-- exlkdnjkelzjfnrkejfn --%>

<div class="container mt-5">

    <div class="row  d-flex justify-content-center">

        <div class="">

            <c:forEach var="show" items="${shows}">
                <div class="card p-3  bg-dark my-4">

                    <div class="d-flex justify-content-between align-items-center">

                        <div class="user d-flex flex-row align-items-center">

                            <img src="https://i.imgur.com/hczKIze.jpg" width="30" class="user-img rounded-circle mr-2">
                            <span style="margin-left: 25px"><small class="font-weight-bold text-danger" style="font-size: 25px">${show.getUserName()}</small> <br><small class="font-weight-bold text-white  " style="">${show.getCommentText()}</small></span>

                        </div>


                        <small>2 days ago</small>

                    </div>


                    <div class="action d-flex justify-content-between mt-2 align-items-center">

                        <div class="reply px-4">
                            <small>Remove</small>
                            <span class="dots"></span>
                            <small>Reply</small>
                            <span class="dots"></span>
                            <small>Translate</small>

                        </div>

                        <div style="width: 120px;display: flex;gap: 10px;" class="icons align-items-center">
                            <i class="fa fa-star text-warning"></i>
                            <p style="color: gold; font-size: 15px;">${show.getRating()}</p>
                            <i class="fa fa-check-circle-o check-icon"></i>

                        </div>

                    </div>



                </div>

            </c:forEach>
        </div>


        <script>
            let rating_average = document.querySelector(".average").textContent;
            document.querySelector(".star-inner").style.width = (rating_average / 5) * 100 + "%";




            function setRating(event) {
                const star = event.target;
                const value = parseInt(star.getAttribute("data-value"));

                document.querySelector(".rated").value = value;

                const stars = document.querySelectorAll(".star");
                stars.forEach((s) => {
                    const starValue = parseInt(s.getAttribute("data-value"));
                    if (starValue <= value) {
                        s.classList.add("active");
                    } else {
                        s.classList.remove("active");
                    }
                });
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>

</body>

</html>

