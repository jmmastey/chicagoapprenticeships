$('document', function(){
  $("input#program-filter").on('input', function() {
    var search_term = $(this).val().toLowerCase();

    $('.masonry__container').isotope({ itemSelector: '.masonry__item.program', layoutMode: 'fitRows', filter: function() {
      var tags = $(this).data('tags');
      return tags.match(search_term);
    }});
  });

  $(".tag-cloud a").on('click', function(e) {
    e.preventDefault();
    $("input#program-filter").val($(this).text())
                             .trigger('input');
  });
})
