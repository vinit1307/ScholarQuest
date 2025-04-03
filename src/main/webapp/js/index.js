// let currentSlide = 0;

// function changeSlide(direction) {
//     const slides = document.querySelectorAll('.slide');
//     slides[currentSlide].classList.remove('active');

//     // currentSlide = (currentSlide + direction + slides.length) % slides.length;
//     // slides[currentSlide].classList.add('active');
    
//     currentSlide += direction;

//     if (currentSlide < 0) {
//         currentSlide = slides.length - 1;
//     } else if (currentSlide >= slides.length) {
//         currentSlide = 0;
//     }

//     slides[currentSlide].classList.add('active');
//     document.querySelector('.slides').style.transform = 'translateX(' + (-currentSlide * 100) + '%)';
// }




// let slideIndex = 0;

// function moveSlide(direction) {
//   const slides = document.querySelectorAll('.slide');
//   slideIndex = (slideIndex + direction + slides.length) % slides.length;
//   document.getElementById('slider').style.transform = `translateX(-${slideIndex * 100}%)`;
// }

// function autoSlide() {
//   moveSlide(1);
//   setTimeout(autoSlide, 3000); // Slide every 3 seconds
// }

let slideIndex = 0;

    function moveSlide(direction) {
      const slides = document.querySelectorAll('.slide');
      slideIndex = (slideIndex + direction + slides.length) % slides.length;
      document.getElementById('slider').style.transform = `translateX(-${slideIndex * 100}%)`;
    }

    function autoSlide() {
      moveSlide(1);
      setTimeout(autoSlide, 3500); // Slide every 3 seconds
    }

    setTimeout(autoSlide, 3500);


// let slideIndex = 0;

// function moveSlide(direction) {
//     const slides = document.querySelectorAll('.slide');
//     slideIndex = (slideIndex + direction) % slides.length;
    
//     // If slideIndex is negative, set it to the last slide index
//     if (slideIndex < 0) {
//         slideIndex = slides.length - 1;
//     }

//     document.getElementById('slider').style.transform = `translateX(-${slideIndex * 100}%)`;
// }

// function autoSlide() {
//     moveSlide(1);
//     setTimeout(autoSlide, 3000); // Slide every 3 seconds
// }

// // Start auto slideshow after initial delay
// setTimeout(autoSlide, 3000);
