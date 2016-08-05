module ApplicationHelper

  def favorite_editor(board, user)
    best_in_place [board, board.users_boards.find_by(user: user)], :favorite, as: :checkbox, collection: {false: fa_icon('star') , true: fa_icon('star-o')}, class: 'star'
  end
end
