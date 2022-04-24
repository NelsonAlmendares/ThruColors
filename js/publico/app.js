var swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    spaceBetween: 30,
    slidesPerGroup: 3,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },

    breakpoints: {
        200:{
            slidesPerView: 1,
            spaceBetween: 20,  
        },
        620: {
          slidesPerView: 1,
          spaceBetween: 20,
        },
        680: {
          slidesPerView: 2,
          spaceBetween: 40,
        },
        920: {
          slidesPerView: 3,
          spaceBetween: 40,
        },
      } 
  });