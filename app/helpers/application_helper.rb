module ApplicationHelper

  def favorite_editor(board, user)
    best_in_place [board, board.users_boards.find_by(user: user)], :favorite, as: :checkbox, collection: {true: fa_icon('star'), false: fa_icon('star-o')}, class: 'star', title: 'お気に入り設定'
  end

  def need_body_class?
    !(controller_name == 'boards' and action_name == 'show')
  end
end
