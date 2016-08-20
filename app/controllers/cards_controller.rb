class CardsController < ApplicationController
  before_action :set_board, except: %i(index)
  before_action :set_list, except: %i(index)
  before_action :set_card, only: [:show, :update, :destroy]

  layout 'modal'

  def index
    keyword = "%#{params[:q]}%"
    @cards = current_user.cards.where('title like :keyword or description like :keyword', {keyword: keyword})
  end

  def show
    @comment = @card.comments.build
  end

  def sort
    Card.sort(@list, params[:card_id].split(','))
    render body: nil
  end

  def create
    @card = @list.cards.build(card_params)
    respond_to do |format|
      if @card.save
        BoardChannel.broadcast_card(@card, :create)
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
        BoardChannel.broadcast_card(@card, :update)
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
      BoardChannel.broadcast_card(@card, :destroy)
      format.html { redirect_to board_path(@board) }
      format.json { head :no_content }
    end
  end

  private
  def card_params
    params.require(:card).permit(:title, :description, :order).merge(user: current_user)
  end
end
