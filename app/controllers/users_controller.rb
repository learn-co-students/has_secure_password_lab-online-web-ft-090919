class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to '/login'
  end

  def show
    @user = User.find(session[:user_id])
    redirect_to '/login' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confimation)
  end
end
