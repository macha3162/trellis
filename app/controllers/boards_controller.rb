class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = current_user.boards
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
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: 'Board was successfully destroyed.'
  end

  private
  def board_params
    params.require(:board).permit(:name, :scope, :bgcolor)
  end
end
