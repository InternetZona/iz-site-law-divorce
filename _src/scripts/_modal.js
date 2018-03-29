function _modal()
{
    var elems = document.querySelectorAll('.modal'),
        options= {};

    if (elems != null) {
        [].forEach.call(elems, function(elem) {

            if (elem.id == 'modal-service') {

                options.onOpenStart = function() {
                    // get opening trigger data
                    var serviceId = parseInt(instance._openingTrigger.dataset.serviceId || 0);

                    if (serviceId) {
                        var input = elem.querySelector('input[name="service"]');

                        if (input !== null) {
                            input.value = serviceId;
                        } else {
                            var input = document.createElement('input');

                            input.type = 'hidden';
                            input.name = 'service';
                            input.value = serviceId;

                            elem.querySelector('form')
                                .appendChild(input);
                        }
                    }
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