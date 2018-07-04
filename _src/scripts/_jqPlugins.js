function _jqPluginsInit() {
    var plugins = {
        path: 'assets/components/modxsite/templates/default/libs/',
        magnificPopup: 'magnific-popup/jquery.magnific-popup.js',
        validate: 'validate/jquery.validate.min.js',
        validateMethods: 'validate/additional-methods.min.js'
    };

    _loadPlugin(function() {
        var lightboxGallery = document.querySelectorAll('.lightbox-gallery');

        if (lightboxGallery !== null) {
            loadScript(plugins.path + plugins.magnificPopup, function() {
                [].forEach.call(lightboxGallery, function(item) {
                    $(item).magnificPopup({
                        delegate: 'a',
                        type: 'image',
                        gallery: {
                            enabled:true
                        }
                    });
                })
            });
        }

        var forms = document.querySelectorAll('form');

        if (forms !== null) {
            loadScript(plugins.path + plugins.validate, function() {
                loadScript(plugins.path + plugins.validateMethods, function() {
                    var forms = document.querySelectorAll('form');

                    [].forEach.call(forms, function(elem) {

                        var rules = {
                            phone: {
                                require_from_group: [1, ".require-group"]
                            },
                            email: {
                                require_from_group: [1, ".require-group"],
                                email: true
                            },
                            confirm: {
                                required: true
                            }
                        };

                        if (elem.name === 'feedback') {
                            rules.comment = {
                                required: true
                            }
                        }



                        var validator = {
                            ignore: [],
                            submitHandler: function(form)   {

                                var $form = $(form),
                                    data = $form.serialize() + '&template=' + $form.attr('name');

                                $.ajax({
                                    url: 'assets/components/modxsite/connectors/connector.php',
                                    method: 'post',
                                    data: data,
                                    beforeSend: function() {
                                        $form.find('[type="submit"]')
                                            .prop('disabled', true);
                                    },
                                    success: function(response) {

                                        if (response.success) {

                                            switch ($form.attr('name')) {
                                                case "feіedback":
                                                    gtag('event', 'send', {'event_category': 'form-feedback'});
                                                    yaCounter48211868.reachGoal('form-feedback');
                                                    break;

                                                case 'order':
                                                    gtag('event', 'send', {'event_category': 'form-order'});
                                                    yaCounter48211868.reachGoal('form-order');
                                                    break;

                                                default:
                                            }

                                            M.toast({
                                                html: 'Сообщение успешно отправлено!'
                                            });

                                            var modal = getClosest(elem, '.modal');

                                            if (modal !== null) {
                                                var instace = M.Modal.getInstance(modal);
                                                instace.close();
                                            }

                                            elem.reset();

                                        } else {
                                            M.toast({
                                                html: 'Ошибка отправки запроса.'
                                            });
                                        }
                                    },
                                    error: function(XMLHttpRequest, textStatus, errorThrown){
                                        M.toast({
                                            html: 'Ошибка отправки запроса.'
                                        });
                                    },
                                    complete: function() {
                                        $form.find('[type="submit"]')
                                            .prop('disabled', false);
                                    }
                                });

                                return false;
                            },
                            focusCleanup: true,
                            errorPlacement: function(error, element) {
                                element.parent()
                                    .append(error);
                                return true;
                            },
                            focusInvalid: false,
                            errorClass: 'error',
                            validClass: '',
                            errorElement: 'span',
                            rules: rules,
                            messages: {
                                phone: {
                                    require_from_group: "Укажите ваш номер телефона."
                                },
                                email: {
                                    require_from_group: "Укажите ваш E-mail.",
                                    email: "Неправильный формат электронной почты."
                                },
                                comment: {
                                    required: "Напишите текст вашего сообщения."
                                },
                                confirm: {
                                    required: "Подтвердите согласие с политикой сайта."
                                }
                            }
                        };

                        $(elem).validate(validator);
                    })
                })
            })
        }
    });
}

function _loadPlugin(callback) {
    var settings = {
        cdn: 'https://code.jquery.com/jquery-2.2.4.min.js'
    };

    loadScript(settings.cdn, callback);
}

/**
 * Get the closest matching element up the DOM tree.
 * @private
 * @param  {Element} elem     Starting element
 * @param  {String}  selector Selector to match against
 * @return {Boolean|Element}  Returns null if not match found
 */
var getClosest = function ( elem, selector ) {

    // Element.matches() polyfill
    if (!Element.prototype.matches) {
        Element.prototype.matches =
            Element.prototype.matchesSelector ||
            Element.prototype.mozMatchesSelector ||
            Element.prototype.msMatchesSelector ||
            Element.prototype.oMatchesSelector ||
            Element.prototype.webkitMatchesSelector ||
            function(s) {
                var matches = (this.document || this.ownerDocument).querySelectorAll(s),
                    i = matches.length;
                while (--i >= 0 && matches.item(i) !== this) {}
                return i > -1;
            };
    }

    // Get closest match
    for ( ; elem && elem !== document; elem = elem.parentNode ) {
        if ( elem.matches( selector ) ) return elem;
    }

    return null;

}