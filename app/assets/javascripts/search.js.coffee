jQuery ->
  $('#ajax-search').select2
    placeholder: 'カードを検索'
    minimumInputLength: 1
    ajax:
      url: '/search'
      dataType: 'json'
      delay: 250
      type: 'GET'
      cache: true
      data: (params) ->
        q: params.term
      processResults: (data) ->
        results: $.map(data, (obj) ->
          id: obj.board_id, text: obj.name + ':' + obj.title)
  .on 'change', (e) ->
    location.href = '/boards/' + $('#ajax-search').val()
