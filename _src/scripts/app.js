'use strict'
// Import Materialize javascript library
//= ../node_modules/materialize-css/dist/js/materialize.min.js
//= ../node_modules/swiper/dist/js/swiper.js

// Initialize GreenSock plugin
//= ../node_modules/gsap/TweenLite.js
//= ../node_modules/gsap/ScrollToPlugin.js
//= ../node_modules/imask/dist/imask.js
//= _waves.js
//= _carousel.js
//= _modal.js
//= _map.js
//= _navbar.js
//= _dropdown.js
//= _jqPlugins.js

var _arr 	= {};
function loadScript(scriptName, callback) {

    if (!_arr[scriptName]) {
        _arr[scriptName] = true;

        var body 		= document.getElementsByTagName('body')[0];
        var script 		= document.createElement('script');
        script.type 	= 'text/javascript';
        script.src 		= scriptName;
        script.onload = callback;
        body.appendChild(script);
    } else if (callback) {
        callback();
    }
}

var App = {
  load: function () {
    this.init();
  },
  init: function () {
      _navbar();
      _waves();
      _carousel();
      _modal();
      _map();
      _dropdown();
      _jqPluginsInit();

    if (document.querySelector('.swiper-container') !== null) {
      new Swiper ('.swiper-container', {
        loop: true,
        spaceBetween: 10,
        slidesPerView: 3,
        autoHeight: true,
        roundLengths: true,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
        breakpoints: {
          600: {
            slidesPerView: 1,
            spaceBetween: 0
          },
          // when window width is <= 640px
          992: {
            slidesPerView: 2,
            spaceBetween: 20
          }
        }
      });
    }

      window.onscroll = function () {
          if (window.pageYOffset > 0) {
              document.body.classList.add('page--sticky-header');
          } else {
              document.body.classList.remove('page--sticky-header');
          }

          if (window.pageYOffset > 250) {
              document.querySelector('.scroller')
                  .classList.add('scroller--active');
          } else {
              document.querySelector('.scroller')
                  .classList.remove('scroller--active');
          }
      }

      var scroller = document.querySelector('.scroller');

      if (scroller !== null) {
          scroller.onclick = function(event) {
              event.preventDefault();
              TweenLite.to(window, 1, {
                  scrollTo:{
                      y: 0
                  }
              });
          }
      }

      var phoneInputs = document.querySelectorAll('input[type="tel"]');

      [].forEach.call(phoneInputs, function (elem) {
          new IMask(
              elem, {
                  mask: '+7 (000) 000-00-00'
              });
      });
  }
}

App.load()
