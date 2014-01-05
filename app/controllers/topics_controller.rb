class TopicsController < ApplicationController
  before_action :validate_user!, except: [:show]
  before_action only: [:edit, :update, :destroy] do
    validate_permission!(set_topic.user)
  end
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.new
    # @form_url = 'forum_topics_path'
  end

  def edit
    # @form_url = 'edit_topic_path(@topic)'
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.new(topic_params)
    @topic.user = current_user
    # @form_url = 'forum_topics_path'

    if @topic.save
      redirect_to @topic, notice: 'Konu başarıyla oluşturuldu'
    else
      render :new
    end
  end

  def update
    # @form_url = 'edit_topic_path(@topic)'
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Konu başarıyla güncellendi.'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to root_url, notice: 'Konu başarıyla silindi'
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
