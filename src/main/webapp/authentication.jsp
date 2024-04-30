<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Double Connection/Registration - Login Page</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
    />
    <style><%@include file="css/authentication.css"%></style>
</head>
<body>
<img id="img-src"style="z-index: -1000; width: 1300px; height: 800px; position: absolute; top: 0; left: 0;" src="images/bg-GOT.jpg">
<input type ="hidden" id="status" value = "<%= request.getAttribute("status") %>">
<div class="background"></div>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form method="post"  action="signUp" >
            <h1>Create an Account</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email to sign up</span>
            <input type="text" name="name" placeholder="Name" />
            <input type="email" name="email" placeholder="Email" />
            <input type="password" name="password" placeholder="Password" />
            <button>Sign Up</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form  method="post" action="Login">
            <h1>Sign In</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your account</span>
            <input type="email" placeholder="email" name="login"/>
            <input type="password" placeholder="Password"  name="pwd"/>
            <a href="#">Forgot Password?</a>
            <button>Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Hello!</h1>
                <p>
                    To stay connected with us, please sign in with your personal information
                </p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello!</h1>
                <p>Enter your personal information and start your journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>
<script><%@include file="js/authentication.js"%></script>









</body>
</html>
