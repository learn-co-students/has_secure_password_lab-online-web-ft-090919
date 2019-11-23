class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_hello_path
    else
      flash[:warning] = "Invalid Username or Password"
      redirect_to sessions_new_path
    end
  end
end
