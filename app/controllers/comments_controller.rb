class CommentsController < ApplicationController
  before_action :validate_user!
  before_action only: [:edit, :update, :destroy] do
    validate_permission!(set_topic.user)
  end
  before_action :select_comment, only: [:edit, :update, :destroy]

  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @topic, notice: 'Yorumunuz eklendi.'
    else
      render :new
    end
  end

  private

  def select_comment
      @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
