App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    @board_subscribe($('#board_id').val())

  disconnected: ->

  received: (data) ->
    $('#' + data.card.id).remove()
    list = $('#list_' + data.card.list_id)
    switch data.action
      when 'update', 'move'
        if(list.find('li').size() == 0)
          list.append(data.dom)
        else if(data.card.ordinal >= list.children('li').size())
          list.find('li:last').after(data.dom)
        else
          list.find('li').eq(data.card.ordinal).before(data.dom)
      when 'create'
        list.append(data.dom)
  board_subscribe: (id) ->
    @perform 'board_subscribe', id: id
  move_card: (id) ->
    @perform 'move_card', id: id
