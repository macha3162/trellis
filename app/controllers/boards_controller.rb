class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @users_boards = current_user.users_boards.includes(:board)
  end

  def show
  end

  def new
    @board = current_user.boards.build
  end

  def edit
  end

  def create
    # 中間テーブルを作成するために先にcreateしている.
    @board = current_user.boards.create(board_params)
    if @board.valid?
      redirect_to @board, notice: 'ボードを新規作成しました'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board }
        format.json { respond_with_bip(@board) }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: 'ボードを削除しました'
  end

  private
  def board_params
    params.require(:board).permit(:name, :scope, :bgcolor)
  end
end
