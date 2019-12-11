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
            flash[:alert] = "Incorrect Password."
            redirect_to new_session_path
        end 
    end

    def destroy
        session.delete :user_id
    end

end