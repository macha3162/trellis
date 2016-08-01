json.extract! board, :id, :name, :scope, :bgcolor, :created_at, :updated_at
json.url board_url(board, format: :json)