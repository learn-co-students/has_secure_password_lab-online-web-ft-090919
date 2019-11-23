class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to '/users/hello'
            else
                redirect_to new_user_path
            end
        else
            redirect_to sessions_new_path
        end
    end

    def hello
    end



    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
