class SessionsController < ApplicationController
    def new
        @user.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_session_path
        end
    end
    
    def show 
        redirect_to new_session_path
    end

    def destroy
        session.delete :user_id
    end
end
