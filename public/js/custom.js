$('document', function(){
  $("input#program-filter").on('input', function() {
    var search_term = $(this).val().toLowerCase();
    var programs = $(".masonry__item.program");

    programs.each(function(){
      var tags = $(this).data('tags');
      if(tags.match(search_term)) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
    $('.masonry__container').isotope();
  });

  $(".tag-cloud a").on('click', function(e) {
    e.preventDefault();
    $("input#program-filter").val($(this).text())
                             .trigger('input');
  });
})
