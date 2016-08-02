# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(".sortable").sortable({
    connectWith: '.sortable',
    cursor: "move",
    items: "li:not(.not-sortable)"
  });

  $(".sortable").bind('sortupdate', (event, ui)->
    list = ui.item.parent()
    id = list.attr('id')
    console.log(list)
    console.log(id)
    console.log("#" + id + ":" + $("#" + id).sortable('toArray').join(','))
    $.ajax({
      type: "POST",
      url: "/boards/" + list.data('board_id') + "/lists/" + list.data('list_id') + "/cards/" + $("#" + id).sortable('toArray').join(',') + "/sort"
    });
  );
