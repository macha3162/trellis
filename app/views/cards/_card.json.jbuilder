json.extract! card, :id, :description, :list_id, :user_id, :order, :created_at, :updated_at
json.url card_url(card, format: :json)