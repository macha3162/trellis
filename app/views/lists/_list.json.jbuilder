json.extract! list, :id, :name, :board_id, :ordinal, :created_at, :updated_at
json.url board_list_url(list.board_id, list, format: :json)