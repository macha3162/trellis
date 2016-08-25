json.extract! card_file, :id, :card_id, :title, :file, :created_at, :updated_at
json.url card_file_url(card_file, format: :json)