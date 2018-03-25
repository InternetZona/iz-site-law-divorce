function _navbar() {
    var scrollableLinks = document.querySelectorAll('.scrollable');

    [].forEach.call(scrollableLinks, function(link) {

        link.onclick = function(event) {
            event.preventDefault();

            var offset = (window.innerWidth > 600) ? 125 : 40;

            TweenLite.to(window, 1, {
                scrollTo:{
                    y: this.hash,
                    offsetY: offset
                }
            });
        }
    });
}