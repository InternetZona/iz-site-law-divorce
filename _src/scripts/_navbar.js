function _navbar() {
    

    var elem = document.querySelector('.sidenav'),
        options = {};

    var instance = M.Sidenav.init(elem, options);


    var scrollableLinks = document.querySelectorAll('.scrollable');

    [].forEach.call(scrollableLinks, function(link) {

        link.onclick = function(event) {
            event.preventDefault();

            var offset = (window.innerWidth > 600) ? 125 : 40;

            if (instance.isOpen) {
                instance.close();
            }

            TweenLite.to(window, 1, {
                scrollTo:{
                    y: this.hash,
                    offsetY: offset
                }
            });
        }
    });

    var elemCollapsible = document.querySelector('.collapsible');
    M.Collapsible.init(elemCollapsible, options);
    
}