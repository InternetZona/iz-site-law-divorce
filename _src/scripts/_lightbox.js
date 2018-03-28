function _lightbox() {
    var elems = document.querySelectorAll('.materialboxed'),
        options = {};

    [].forEach.call(elems, function(elem) {
        M.Materialbox.init(elem, options);
    });
}