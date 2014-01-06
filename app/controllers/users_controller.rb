class UsersController < ApplicationController
  before_action :select_user, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    validate_permission! select_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_url, notice: 'Aramıza hoş geldin!'
    else
      render :new
    end
  end

  def show
    sayfa = params[:sayfa] || 'konular'

    if sayfa == 'konular'
      @data = @user.topics
    else
      @data = @user.comments
    end

    render layout: "profile", locals: {page: sayfa}
  end

  def edit
    render layout: "profile"
  end

  def update
    update_params = user_params
    if update_params.has_key?(:password)
      update_params.delete([:password, :password_confirmation])
    end

    if @user.update(update_params)
      redirect_to profile_url(@user), notice: 'Profil bilgileriniz güncellendi.'
    else
      render :edit, layout: "profile"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def select_user
    @user = User.find_by_username(params[:id])
  end
end
