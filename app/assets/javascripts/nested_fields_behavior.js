$(function() {
  $('#choices').on('cocoon:after-insert', function(e) {
    // ajouter le numéro dans le span
    var choice_number = $('#choices .nested-fields').length;
    $('#choices .nested-fields').last().find('.choice_number').html(choice_number);
    // afficher / cacher selon le numéro dansl a liste
    $('#choices .nested-fields').last().find('.remove-link').removeClass('hidden');
  });


  $('#choices .nested-fields').each(function(i, el) {
    $(this).find('.choice_number').html(i + 1);
  });
})
