let backgroundImages = ['https://lh3.googleusercontent.com/drive-viewer/AKGpihaLyQWG5IPh_7MSC47R33WjvQbXeQU6c-9_fFrD15nWL-lVIqt0r-kt0VJlrJA193Cbtz7CSMGm7FEMlQFSJFzSFrakF2s1BBg=s1600-rw-v1', 'url(https://lh3.googleusercontent.com/drive-viewer/AKGpihaLyQWG5IPh_7MSC47R33WjvQbXeQU6c-9_fFrD15nWL-lVIqt0r-kt0VJlrJA193Cbtz7CSMGm7FEMlQFSJFzSFrakF2s1BBg=s1600-rw-v1)', 'url(https://lh3.googleusercontent.com/drive-viewer/AKGpihaLyQWG5IPh_7MSC47R33WjvQbXeQU6c-9_fFrD15nWL-lVIqt0r-kt0VJlrJA193Cbtz7CSMGm7FEMlQFSJFzSFrakF2s1BBg=s1600-rw-v1)', 'url(images/bg4.jpg)', 'url(images/bg5.jpg)', 'url(images/bg6.jpg)', 'url(images/bg7.jpg)'];
let currentIndex = 0;
let bodyElement = document.querySelector(".body-home");

function changeBackgroundImage() {
    bodyElement.style.background = `${backgroundImages[currentIndex]} no-repeat top right/cover`;
    currentIndex = (currentIndex + 1) % backgroundImages.length;
    setTimeout(changeBackgroundImage, 3000);
}

changeBackgroundImage();
let appendNumber = 600;
let prependNumber = 1;
const swiper = new Swiper('.swiper', {
    slidesPerView: 3,
    centeredSlides: true,
    spaceBetween: 30,
    pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    virtual: {
        slides: (function () {
            const slides = [];
            for (var i = 0; i < 600; i += 1) {
                slides.push('Slide ' + (i + 1));
            }
            return slides;
        })(),
    },
});

document
    .querySelector('.slide-1')
    .addEventListener('click', function (e) {
        e.preventDefault();
        swiper.slideTo(0, 0);
    });

document
    .querySelector('.slide-250')
    .addEventListener('click', function (e) {
        e.preventDefault();
        swiper.slideTo(249, 0);
    });

document
    .querySelector('.slide-500')
    .addEventListener('click', function (e) {
        e.preventDefault();
        swiper.slideTo(499, 0);
    });

document
    .querySelector('.prepend-2-slides')
    .addEventListener('click', function (e) {
        e.preventDefault();
        swiper.virtual.prependSlide([
            'Slide ' + --prependNumber,
            'Slide ' + --prependNumber,
        ]);
    });

document
    .querySelector('.append-slide')
    .addEventListener('click', function (e) {
        e.preventDefault();
        swiper.virtual.appendSlide('Slide ' + ++appendNumber);
    });


