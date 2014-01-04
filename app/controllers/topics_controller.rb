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
  end

  def edit
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to @topic, notice: 'Konu başarıyla oluşturuldu'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
