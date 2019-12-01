class UsersController < ApplicationController

    def new 
    end 

    def welcome 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render :'welcome'
        else 
            redirect_to new_user_path 
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 

end
