json.extract! card, :id, :title, :description, :ordinal, :created_at, :updated_at
json.url board_list_card_url(card.list.board_id, card.list, card, format: :json)