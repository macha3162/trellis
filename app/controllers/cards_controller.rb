class CardsController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  layout 'modal'

  def index
    redirect_to @board
  end

  def show
  end

  def sort
    # List間を移動すると、メソッドチェーンでFindできなくなるので、とりあえず通常Find.
    cards = Card.find(params[:card_id].split(','))
    cards.each_with_index do |card, index|
      card.update_attributes({list: @list, ordinal: index})
    end
    render body: nil
  end

  def new
    @card = Card.new
  end

  def edit
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
