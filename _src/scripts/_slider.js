function _slider() {
    var elems = document.querySelectorAll('.slider'),
        options = {};

    [].forEach.call(elems, function(elem) {
        M.Slider.init(elem, options);
    });
}