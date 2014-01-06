class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:user_name])

    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to root_url, notice: 'Oturum açıldı.'
    else
      flash[:error] = "Kullanıcı adı/parola hatalı."
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Oturumunuz sonlandırıldı.'
  end
end
