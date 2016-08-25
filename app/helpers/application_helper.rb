module ApplicationHelper

  def favorite_editor(users_board)
    best_in_place [users_board.board, users_board], :favorite, as: :checkbox, collection: {true: fa_icon('star'), false: fa_icon('star-o')}, class: 'star', title: 'お気に入り設定'
  end

  def need_body_class?
    !(controller_name == 'boards' and action_name == 'show')
  end
end
