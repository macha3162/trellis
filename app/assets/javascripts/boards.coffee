jQuery ->
  $(".sortable").sortable({
    connectWith: '.sortable',
    cursor: "move",
    items: "li:not(.not-sortable)"
  });

  $(".sortable").on('sortstop', (event, ui)->
    list = ui.item.parent()
    $.ajax({
      type: "POST",
      url: list.data('list_url') + "/" + $("#" + list.attr('id')).sortable('toArray').join(',') + "/sort",
      success: (data) ->
        App.board.move_card(ui.item.attr('id'))
    });
  );

  $("#dropdown").select2({
    theme: "bootstrap"
  });
