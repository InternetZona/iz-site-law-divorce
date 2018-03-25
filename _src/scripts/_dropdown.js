function _dropdown() {
    var elem = document.querySelector('.dropdown-trigger'),
        options = {
            constrainWidth: false,
            coverTrigger: false,
            container: 'body',
            hover: true
        };
    var instance = M.Dropdown.init(elem, options);
}