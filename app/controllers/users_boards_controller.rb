class UsersBoardsController < ApplicationController
  before_action :set_board
  before_action :set_users_board, only: [:show, :update, :destroy]

  def index
    @users_boards = @board.users_boards
  end

  def show
  end

  def create
    @users_board = @board.users_boards.build(users_board_params)
    if @users_board.save
      redirect_to board_users_boards_path(@board), notice: 'ボードが共有されました'
    else
      @users_boards = @board.users_boards.reload
      render :index
    end
  end

  def update
    respond_to do |format|
      if @users_board.update(users_board_params)
        format.html { redirect_to board_users_boards_path(@board) }
        format.json { render :show, status: :ok, location: [@board, @list, @card] }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if (@board.users_boards.one?)
      redirect_to board_users_boards_path(@board), alert: '最後の一人のため削除できません'
    elsif (@users_board.user == current_user)
      @users_board.destroy
      redirect_to root_path, alert: 'メンバーから削除されました'
    else
      @users_board.destroy
      redirect_to board_users_boards_path(@board), notice: 'メンバーを削除しました'
    end
  end

  private
  def set_users_board
    @users_board = @board.users_boards.find(params[:id])
  end

  def users_board_params
    params.require(:users_board).permit(:user_id, :favorite)
  end
end
