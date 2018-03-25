function _modal()
{
    var elems = document.querySelectorAll('.modal'),
        options= {};

    if (elems != null) {
        [].forEach.call(elems, function(elem) {
            if (elem.id == 'modal-service') {

                options.onOpenStart = function() {

                };
            }

            var instance = M.Modal.init(elem, options);

            instance.el
                .querySelector('.modal--close')
                .onclick = function(event) {
                event.preventDefault();

                instance.close();
            }
        });
    }
}