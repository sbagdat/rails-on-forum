class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :signed_in?, :current_user

  private

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end

  def validate_user!
    unless signed_in?
      redirect_to login_url, alert: 'Bu sayfaya erişmeden önce oturum açmalısınız.'
    end
  end

  def validate_permission!(user)
    unless current_user == user
      redirect_to root_url, alert: 'Bu işlemi gerçekleştirmek için gerekli olan yetkiye sahip değilsiniz!'
    end
  end
end
