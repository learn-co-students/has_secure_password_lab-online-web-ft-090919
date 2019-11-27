class User < ApplicationRecord
    validates :password, confirmation: true

    # why not use has_secure_password?
    # why write this simple dumb method?
    def authenticate(password_confirmation)
        self if self.password == password_confirmation
    end

end
