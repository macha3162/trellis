App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    @board_subscribe($('#board_id').val())

  disconnected: ->

  received: (data) ->
    $('#' + data.card.id).remove()
    console.info(data.action)
    switch data.action
      when 'update', 'move'
        $('#list_' + data.card.list_id + ' li').eq(data.card.ordinal).after(data.dom)
      when 'create'
        $('#list_' + data.card.list_id).append(data.dom)
  board_subscribe: (id) ->
    @perform 'board_subscribe', id: id
    
  move_card: (id) ->
    @perform 'move_card', id: id
