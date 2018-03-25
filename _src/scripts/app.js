'use strict'
// Import Materialize javascript library
//= ../node_modules/materialize-css/dist/js/materialize.min.js

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

      window.onscroll = function () {
          if (window.pageYOffset > 0) {
              document.body.classList.add('page--sticky-header');
          } else {
              document.body.classList.remove('page--sticky-header');
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
