class CardsController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  layout 'modal'

  def index
    # TODO: カード検索のために残している.
    redirect_to @board
  end

  def show
  end

  def sort
    Card.transaction do
      # List間を移動するとメソッドチェーンでFindできなくなるので、とりあえず通常Find.
      cards = Card.find(params[:card_id].split(','))
      cards.each_with_index do |card, index|
        # update_attributesを使うと無駄なSQLが発行されるので複数行で対応
        card.list = @list
        card.ordinal = index
        card.save
      end
    end
    render body: nil
  end

  def create
    @card = @list.cards.build(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to board_path(@board) }
        format.json { render :show, status: :created, location: [@board, @list, @card] }
      else
        format.html { redirect_to board_path(@board), alert: 'カード名を入力してください' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to board_path(@board) }
        format.json { render :show, status: :ok, location: [@board, @list, @card] }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to board_path(@board) }
      format.json { head :no_content }
    end
  end

  private
  def set_card
    @card = @list.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :order).merge(user: current_user)
  end
end
