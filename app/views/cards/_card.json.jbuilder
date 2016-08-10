json.extract! card, :id, :title, :description, :board_id, :ordinal, :created_at, :updated_at
json.extract! card.board, :name

json.url board_list_card_url(card.list.board_id, card.list, card, format: :json)