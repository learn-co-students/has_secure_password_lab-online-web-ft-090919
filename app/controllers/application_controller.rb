class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id]
  end
  
  def set_user(user) # this method feels weird
      session[:user_id] = user.id unless user.nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
