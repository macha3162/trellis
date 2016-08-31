class BoardsController < ApplicationController
  # 細かい事だし、どっちでも良いのですが  %i(show edit update destroy) と書くのもシンプルで好きです
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
    # scaffoldと異なる感じなのが気になりました。
    # ここは、current_user.boards.build(board_params)にしておいて、boardモデルのコールバックで中間テーブルを作成しても良いかなと思いました。
    # 中間テーブル(users_board)を作成するために先にcreateしている.
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
