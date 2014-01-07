class ForumsController < ApplicationController
  before_action {@forums = Forum.all}

  def index
    @topics = Topic.includes(:forum, :user)
  end

  def show
    @forum  = Forum.find(params[:id])
    @topics = @forum.topics.includes(:user)
  end
end
