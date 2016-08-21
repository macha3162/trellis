class CommentsController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_card
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = @card.comments.new(comment_params.merge({user: current_user}))
    respond_to do |format|
      if @comment.save
        BoardChannel.broadcast_card(@card.reload, :update)
        format.js { render :show, status: :created }
      else
        format.js { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        BoardChannel.broadcast_card(@card.reload, :update)
        format.js { render :show, status: :created }
      else
        format.js { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    BoardChannel.broadcast_card(@card.reload, :update)
    respond_to do |format|
      format.js { render :show }
    end
  end

  private
  def set_comment
    @comment = @card.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
