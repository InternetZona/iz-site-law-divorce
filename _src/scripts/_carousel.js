function _carousel() {
    var elems = document.querySelectorAll('.carousel'),
        defaultOptions = {
            indicators: true
        };

    if (elems === null) return;

    [].forEach.call(elems, function(elem) {

        var options = {};

        switch (elem.id) {
            case 'carousel-testimonials':
                var height = 0;
                options = Object.assign(defaultOptions, {
                    padding: 20,
                    shift: 0,
                    dist: 0,
                    indicators: true
                });

                height = getMaxHeight(elem);

                var innerCards = elem.querySelectorAll('.card');
                [].forEach.call(innerCards, function (card) {
                    card.style.height = height + 'px';
                });

                // add indicators height
                height = parseInt(height) + 62;

                elem.style.height = height + 'px';

                break;
            case 'carousel-portfolio':
                options = Object.assign(defaultOptions, {
                    fullWidth: true
                });
                break;
            default: options = defaultOptions;
        }

        // init carousel
        var instance = M.Carousel.init(elem, options);

        /*var _timer = autoplayProсces(instance);

        elem.onmouseover = function(e) {
            clearInterval(_timer);
        };

        elem.onmouseout = function(e) {
            clearInterval(_timer);
            _timer = autoplayProcсes(instance);
        };*/
    });
}

// Return max offsetHeight
function getMaxHeight(elem)
{
    var items,
        maxHeight = 0;

    items = elem.querySelectorAll('.carousel-item');

    [].forEach.call(items, function(item) {
        if (item.offsetHeight > maxHeight) {
            maxHeight = item.offsetHeight;
        }
    });

    return maxHeight;
}

// Carousel autoplay
function autoplayProcсes(instance) {
    return setInterval(function() {
        instance.next();
    }, instance.el.dataset.speed );
}