class UsersController < ApplicationController

    def new
    end
    
    def create 
        user = User.new(user_params)
        if user.valid?
            user.save
            set_user(user)
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show
        if logged_in?
            @user = current_user
            redirect_to user_path
        else
            redirect_to new_user_path
        end
    end

end
