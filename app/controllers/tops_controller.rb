class TopsController < ApplicationController
    def index
    end
    def index2
        @user=User.find_by(user_params[:age])
    end
    private
    def user_params
        params.permit(:age, :gender, :email, :password, :password_confirmation)
    end
end
