
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DarkPan - Bootstrap 5 Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">



    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <style><%@include file="lib/owlcarousel/assets/owl.carousel.min.css"%></style>
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <style><%@include file="lib/owlcarousel/assets/owl.carousel.min.css"%></style>
    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style><%@include file="lib/owlcarousel/assets/owl.carousel.min.css"%></style>
    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style><%@include file="lib/owlcarousel/assets/owl.carousel.min.css"%></style>
</head>

<body>
<div class="container-fluid position-relative d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-secondary navbar-dark">
            <a href="index.html" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary"><img src="img/logo.png" alt="" width="50px" height="50px">
                </h3>
            </a>

            <div class="navbar-nav w-100">
                <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                    <div class="dropdown-menu bg-transparent border-0">
                        <a href="button.html" class="dropdown-item">Buttons</a>
                        <a href="typography.html" class="dropdown-item">Typography</a>
                        <a href="element.html" class="dropdown-item">Other Elements</a>
                    </div>
                </div>
                <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>

                </div>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <form class="d-none d-md-flex ms-4" >
                <input class="form-control bg-dark border-0" type="search" placeholder="Search">
            </form>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-envelope me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Message</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="ms-2">
                                    <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                    <small>15 minutes ago</small>
                                </div>
                            </div>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">See all message</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-bell me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Notificatin</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Profile updated</h6>
                            <small>15 minutes ago</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">New user added</h6>
                            <small>15 minutes ago</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Password changed</h6>
                            <small>15 minutes ago</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">See all notifications</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/user.png" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">Admin</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">My Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="#" class="dropdown-item">Log Out</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Form Start -->
        <div class="bg-secondary rounded h-100 p-4 d-flex justify-content-center align-items-center">
            <div class="col-sm-12 col-xl-6">
                <h6 class="mb-4">Edit Film</h6>
                <form action="UpDateFilms" method="post">
                    <input type="hidden" name="idFilm" value="${film.getIdFilm()}">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="titleFilm" name="titleFilm" value="${film.getTitleFilm()}">
                        <label for="titleFilm">Titre du film</label>
                    </div>
                    <div class="form-floating mb-3">
                        <textarea class="form-control" id="descriptionFilm" name="descriptionFilm" style="height: 150px;">${film.getDescriptionFilm()}</textarea>
                        <label for="descriptionFilm">Description du film</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="runTimeFilm" name="runTimeFilm" value="${film.getRunTimeFilm()}">
                        <label for="runTimeFilm">Durée du film</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="genreFilm" name="genreFilm" value="${film.getGenreFilm()}">
                        <label for="genreFilm">Genre du film</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="producedIn" name="producedIn" value="${film.getProducedIn()}">
                        <label for="producedIn">Produit en</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="directedBy" name="directedBy" value="${film.getDirectedBy()}">
                        <label for="directedBy">Dirigé par</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="pictureURL" name="pictureURL" value="${film.getPictureURL()}">
                        <label for="pictureURL">URL de l'image</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="streamingNow" name="streamingNow" value="${film.getStreamingNow()}">
                        <label for="streamingNow">Diffusion en continu (Dates)</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="ratingFilm" name="ratingFilm" value="${film.getRatingFilm()}">
                        <label for="ratingFilm">Classification du film</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="backgroundURL" name="backgroundURL" value="${film.getBackgroundURL()}">
                        <label for="backgroundURL">URL de l'arrière-plan</label>
                    </div>
                    <button type="submit" class="btn btn-primary" value="UpDateFilm" > Edit </button>
                </form>
            </div>
        </div>




        <!-- Form End -->


        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-secondary rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Your Site Name</a>, All Right Reserved.
                    </div>

                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="lib/easing/easing.min.js"></script>
<style><%@include file="lib/easing/easing.min.js"%></style>
<script src="lib/waypoints/waypoints.min.js"></script>
<style><%@include file="lib/waypoints/waypoints.min.js"%></style>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<style><%@include file="lib/owlcarousel/owl.carousel.min.js"%></style>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<style><%@include file="lib/tempusdominus/js/moment.min.js"%></style>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<style><%@include file="lib/tempusdominus/js/moment-timezone.min.js"%></style>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<style><%@include file="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"%></style>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
