class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Aramıza hoş geldin!"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @data = []

    if params[:sayfa]
      render layout: "profile", locals: {page: params[:sayfa]}
    else
      render layout: "profile", locals: {page: 'konular'}
    end
  end

  def edit
    @user = User.find(params[:id])

    render layout: "profile"
  end

  def update
    @user = User.find(params[:id])

    update_params = user_params
    if update_params.has_key?(:password)
      update_params.delete([:password, :password_confirmation])
    end

    if @user.update(update_params)
      flash[:notice] = "Profil bilgileriniz güncellendi."
      redirect_to @user
    else
      render :edit, layout: "profile"
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
