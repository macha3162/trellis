json.extract! users_board, :id, :user_id, :board_id, :favorite, :created_at, :updated_at
json.url users_board_url(users_board, format: :json)