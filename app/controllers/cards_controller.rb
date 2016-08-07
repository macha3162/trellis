class CardsController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_card, only: [:show, :update, :destroy]

  layout 'modal'

  def index
    # TODO: カード検索のために残している.
    redirect_to @board
  end

  def show
  end

  def sort
    Card.sort(@list, params[:card_id].split(','))
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