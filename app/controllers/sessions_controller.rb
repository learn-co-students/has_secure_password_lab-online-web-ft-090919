class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    #require 'pry'
    #binding.pry
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users/#{session[:user_id]}"
    else
      return head(:forbidden)
    end

  end

  def destroy
    session.delete :username
  end
end