class SessionsController < ApplicationController 
    def new 
        @user = User.new
    end 

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to 'welcome/home'
        else 
            redirect_to 'new'
        end 
    end 

    def destroy
        session.delete :user_id 
    end 
end 