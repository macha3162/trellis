class CommentsController < ApplicationController
  before_action :set_board, except: %i(index)
  before_action :set_list, except: %i(index)
  before_action :set_card
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @card.comments
  end

  def show
    render formats: :js
  end

  def new
    @comment = @card.comments.build
  end

  def edit
  end

  def create
    @comment = @card.comments.new(comment_params.merge({user: current_user}))
    respond_to do |format|
      if @comment.save
        format.js { render :show, status: :created }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'コメントを編集しました' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
  def set_comment
    @comment = @card.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
