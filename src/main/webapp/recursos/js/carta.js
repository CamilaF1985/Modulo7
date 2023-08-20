  $(document).ready(function() {
    // Inicializa el plugin Isotope para la galería
    $('.portfolio-item').isotope({
      itemSelector: '.item',
      layoutMode: 'fitRows'
    });

    // Maneja el clic en los elementos del menú de filtrado
    $('.portfolio-menu ul li').click(function(){
      // Remueve la clase 'active' de todos los elementos del menú
      $('.portfolio-menu ul li').removeClass('active');
      // Agrega la clase 'active' al elemento clickeado
      $(this).addClass('active');
      
      // Obtiene el filtro correspondiente al elemento clickeado
      var selector = $(this).attr('data-filter');
      // Aplica el filtro al contenedor de la galería
      $('.portfolio-item').isotope({
        filter: selector
      });
      return false;
    });

    // Simula hacer clic en el filtro "Picoteo Japonés" al cargar la página
    $('.portfolio-menu ul li[data-filter=".pij"]').click();

    // Inicializa el plugin Magnific Popup para las imágenes
    var popup_btn = $('.popup-btn');
    popup_btn.magnificPopup({
      type: 'image',
      gallery: {
        enabled: true
      }
    });

    // función para mostrar los captions en el lightbox
    popup_btn.on('mfpOpen', function() {
      var caption = $(this).data('caption');
      $('.mfp-title').text(caption);
    });
  });