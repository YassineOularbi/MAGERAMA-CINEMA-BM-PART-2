var $star_rating = $(".star-rating .fa");

var SetRatingStar = function () {
    return $star_rating.each(function () {
        if (
            parseInt($star_rating.siblings("input.rating-value").val()) >=
            parseInt($(this).data("rating"))
        ) {
            return $(this).removeClass("fa-star-o").addClass("fa-star");
        } else {
            return $(this).removeClass("fa-star").addClass("fa-star-o");
        }
    });
};

$star_rating.on("click", function () {
    $star_rating.siblings("input.rating-value").val($(this).data("rating"));
    return SetRatingStar();
});

SetRatingStar();
$(document).ready(function () {});

$(document).ready(function () {
    $("#ratingSection .disabled").off("click");
});
document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const recipeIndex = parseInt(urlParams.get("recipeIndex"));

    const recipes = JSON.parse(localStorage.getItem("recipes")) || [];
    const selectedRecipe = recipes[recipeIndex];

    if (selectedRecipe && selectedRecipe.rating !== undefined) {
        initializeRating(recipeIndex);
    } else {
        console.log("Rating not found for the selected recipe in localStorage.");
    }

    if (selectedRecipe && selectedRecipe.rating !== undefined) {
        const rating = selectedRecipe.rating;
        const starRating = document.querySelector("#ratingSection .star-rating");
        const ratingValueInput = document.querySelector(
            "#ratingSection .rating-value"
        );

        const stars = starRating.querySelectorAll(".fa-star-o, .fa-star");
        stars.forEach((star, index) => {
            if (index < rating) {
                star.classList.remove("fa-star-o");
                star.classList.add("fa-star");
            } else {
                star.classList.remove("fa-star");
                star.classList.add("fa-star-o");
            }
        });

        ratingValueInput.value = rating;
    }
});

function initializeRating(recipeIndex) {
    const stars = document.querySelectorAll(".star-rating .fa");

    stars.forEach((star, index) => {
        star.addEventListener("click", function (event) {
            const rating = parseInt(event.target.getAttribute("data-rating"));
            setRating(recipeIndex, rating);
        });
    });

    function setRating(recipeIndex, rating) {
        const recipes = JSON.parse(localStorage.getItem("recipes")) || [];
        if (recipes && recipes.length > recipeIndex) {
            recipes[recipeIndex].rating = rating;
            localStorage.setItem("recipes", JSON.stringify(recipes));
        } else {
            console.log("Recipe not found in localStorage.");
        }
    }
}


