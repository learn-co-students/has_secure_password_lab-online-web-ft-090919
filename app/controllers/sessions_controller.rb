class SessionsController < ApplicationController

    def create # used for logging in
        if set_user(User.find_by(user_params))
            redirect_to user_path(current_user)
        else
            redirect_to new_session_path
        end
    end

end
