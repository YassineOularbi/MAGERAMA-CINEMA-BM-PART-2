const signUpButton = document.getElementById("signUp");
const signInButton = document.getElementById("signIn");
const container = document.getElementById("container");

signUpButton.addEventListener("click", () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener("click", () => {
    container.classList.remove("right-panel-active");
});

const images = ['images/bg1.jpg', 'images/bg2.jpg', 'images/bg3.jpg', 'images/bg4.jpg', 'images/bg5.jpg'];
let currentIndex = 0;
let bodyElement = document.getElementById("img-src");
function changeBackgroundImage() {
    bodyElement.style.background = `${backgroundImages[currentIndex]} no-repeat top right/cover`;
    currentIndex = (currentIndex + 1) % backgroundImages.length;
    setTimeout(changeBackgroundImage, 2000);


}
const sign_in_btn = document.querySelector("#sign-in-btn"); // Corrected selector
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
    container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
});