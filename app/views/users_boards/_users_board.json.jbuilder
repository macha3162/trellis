json.extract! users_board, :id, :user_id, :board_id, :favorite, :created_at, :updated_at
json.url board_users_boards_path(@board, format: :json)