<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <i class='bx bx-user bx-flip-horizontal icon rounded' style='color:white'></i>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
<section class="movie-trend">
    <c:if test="${not empty trendFilms}">
        <img style="z-index: -1000; width: 1300px; position: absolute; top: 0; left: 0;" src="${trendFilms[0].getBackgroundURL()}">
        <div style="width: 40%; padding-top: 50px; padding-left: 120px;" class="text-white my-4">
            <img style="height: 250px; width: 170px; margin: 10px 0;" class="card" src="${trendFilms[0].getPictureURL()}" alt="${trendFilms[0].getTitleFilm()}">
            <p style="font-size: 11px; text-align: start;">${trendFilms[0].getRunTimeFilm()} -<span> ${trendFilms[0].getProducedIn()} -</span><span
                    style="font-weight: bold;">${trendFilms[0].getDirectedBy()}</span></p>
            <p style="font-size: 11px; text-align: start;"><span class="text-success">92% Match </span><span
                    class="border rounded px-1 mx-2">TV - MA</span><span style="font-weight: bold;"
                                                                         class="border rounded px-1 mx-1 ">HD</span><span
                    style='color:#fdb000; background: rgba(0, 0, 0, 0.6);' class="rounded border px-2 mx-1">${trendFilms[0].getRatingFilm()} <i
                    class='bx bxs-star' style='color:#fdb000'></i></span></p>
            <h4 style="text-align: start;">${trendFilms[0].titleFilm}</h4>
            <p style="font-size: 15px; text-align: start;">${trendFilms[0].genreFilm}</p>
            <p style="font-size: 10px; text-align: start;">${trendFilms[0].descriptionFilm}</p>
            <div class="buttons text-light">
                <button class="btn text-light mt-2">More details <i class='bx bxs-right-arrow'
                                                                    style='color:#ffffff'></i></button>
                <button class="btn text-light mt-2">View trailer <i class='bx bxs-show'
                                                                    style='color:#ffffff'></i></button>
                <button class="btn btn-book text-light mt-2">Book Now <i class='bx bxs-coupon'
                                                                         style='color:#ffffff'></i></button>
            </div>
        </div>
    </c:if>



</section>

<section style="height: 300px; padding-left: 50px;" class="movie-card-section">
    <div id="slider">
        <p style="font-size: 20px; text-align: start; font-weight: bold;" class="text-light">Trending Now !</p>
        <div class="d-flex flex-row">
            <div style="width: 98%;" class="cards row">
                <div class="swiper">
                    <div style="" class="swiper-wrapper cards row">
                        <c:forEach var="film" items="${ratingFilms}" varStatus="loop">
                            <div class="movie-card-trend text-white">
                                <img style="height: 220px; width: 150px; margin-top: 20px;" class="card" src="${film.pictureURL}" alt="${film.titleFilm}">
                                <h1 style="font-size: 60px; font-weight: bold; opacity: 90%; z-index: 1000; margin-top: -55px; margin-left: -10px;" >${loop.index + 1}</h1>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section  class="showtimes" style="height: 100vh; width: 100%; background-color: black; padding-top: 40px; padding-left: 50px;" >
    <p style="font-size: 20px; text-align: start; font-weight: bold;" class="text-light">ShowTimes</p>
    <div >
        <a style="border-bottom: 2px solid red; padding: 7px; font-weight:500; padding-left: 0;" href="">Showing Now</a>
        <a style="margin-left: 20px; font-weight: 500;" href="">Cooming Soon !</a>
    </div>
    <div class="row">
        <c:forEach var="film" items="${films}">
            <div  class="col-md-4">

                <article style="margin-top: 60px; margin-bottom: 40px;" class="cardss">

                    <img class="card__background" src="${film.pictureURL}" alt=""/>
                    <div class="card__content | flow">
                        <div class="card__content--container | flow">
                            <h2 class="card__title">${film.titleFilm}</h2>
                            <p class="card__description">${film.descriptionFilm}</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/reserve-now?id=${film.getIdFilm()}" class="btn card__button text-light mt-2 rounded align-items-center">Book <i class='bx bxs-coupon' style='color:#ffffff; margin-left: 5px;'></i></a>
                    </div>

                </article>

            </div>
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