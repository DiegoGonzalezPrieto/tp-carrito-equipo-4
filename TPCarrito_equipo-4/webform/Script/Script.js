function recortarDescripcion() {
    var descripciones = document.getElementsByClassName('descripcion');
    for (var i = 0; i < descripciones.length; i++) {
        var texto = descripciones[i].getElementsByClassName('texto')[0];
        var verMas = descripciones[i].getElementsByClassName('verMas')[0];
        var textoCompleto = texto.textContent;
        if (textoCompleto.length > 15) {
            var textoCorto = textoCompleto.substring(0, 15);
            texto.textContent = textoCorto;
            verMas.style.display = 'inline';
        } else {
            verMas.style.display = 'none';
        }
    }
}

function iniciarCarousel() {
    var $carousel = $('.carousel');
    if ($carousel.data('bs.carousel')) {
        $carousel.carousel('dispose');
    }
    
    $carousel.carousel({
        interval: 2000
    });
}

window.onload = function () {
    recortarDescripcion();
    iniciarCarousel();
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
    setTimeout(function () {
        recortarDescripcion();
        iniciarCarousel();
    }, 100);
});
