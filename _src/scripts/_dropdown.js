function _dropdown() {
    var elems = document.querySelectorAll('.dropdown-trigger'),
        options = {
            constrainWidth: false,
            coverTrigger: false,
            container: 'body',
        };
    
    [].forEach.call(elems, function(elem) {

        if (elem.dataset.target == 'nav-desktop-dd') {
            options.hover = true;
        }

        var instance = M.Dropdown.init(elem, options);
    });
}