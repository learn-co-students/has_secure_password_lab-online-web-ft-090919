class SessionsController < ApplicationController

    def new
        @user = User.new
    end 

    def create
      @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            render :'users/welcome'
        else 
            flash[:alert] = "Login failure. Please try again."
            redirect_to new_session_path
        end 
    end

end



# def create
#     @user = User.find_by(name: params[:user][:name])
#     if @user = nil 
#     redirect_to '/new'
#     else 
#     return head(:forbidden) unless @user.authenticate(params[:user][:password])
#     session[:user_id] = @user.id
#     end 
# end