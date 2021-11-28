document.addEventListener('turbolinks:load', function(event) {
    if (typeof gtag === 'function') {
        gtag('config', 'G-TL3XF56LHJ', {
            'page_location': event.data.url
        });
    }
});