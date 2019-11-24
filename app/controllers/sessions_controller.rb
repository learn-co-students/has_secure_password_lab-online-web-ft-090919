class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to :welcome
        else
            flash[:notice] = "Login is incorrect"
            redirect_to :new_session
        end
    end
end
