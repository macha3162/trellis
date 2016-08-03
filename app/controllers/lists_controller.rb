class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = @board.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to board_path(@board), notice: 'リストを作成しました！' }
        format.json { render :show, status: :created, location: [@board, @list] }
      else
         pp @list.errors.full_messages
        format.html { redirect_to board_path(@board), alert: 'リスト名を入力してください'}
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to board_path(@board), notice: 'リストを更新しました！' }
        format.json { render :show, status: :ok, location: [@board, @list] }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to @board, notice: 'リストを削除しました。' }
      format.json { head :no_content }
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :board_id, :order)
  end
end
