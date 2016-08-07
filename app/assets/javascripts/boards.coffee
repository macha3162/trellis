jQuery ->
  $(".sortable").sortable({
    connectWith: '.sortable',
    cursor: "move",
    items: "li:not(.not-sortable)"
  });

  $(".sortable").bind('sortupdate', (event, ui)->
    list = ui.item.parent()
    $.ajax({
      type: "POST",
      url: list.data('list_url') + "/" + $("#" + list.attr('id')).sortable('toArray').join(',') + "/sort"
    });
  );
