function _map () {
    var elem = document.getElementById('yandex-map');

    if (elem != null) {
        var script = document.createElement('script');

        script.src = "https://api-maps.yandex.ru/2.1/?lang=ru_RU";
        script.async = true;
        script.onload = function() {
            ymaps.ready(function() {
                var map = new ymaps.Map('yandex-map', {
                    center: appProps.map.coords,
                    zoom: 15,
                    behaviors: ["drag", "dblClickZoom", "rightMouseButtonMagnifier", "multiTouch"]
                }),
                    placemark = new ymaps.Placemark(map.getCenter(), {
                        hintContent: appProps.siteName
                    }, {
                        iconLayout: 'default#image',
                        iconImageHref: 'assets/components/modxsite/templates/default/images/marker.png',
                        iconImageSize: [48, 54],
                        iconImageOffset: [-5, -38]
                    });
                map.geoObjects
                    .add(placemark);
            })
        }

        document.body.appendChild(script);
    }
}