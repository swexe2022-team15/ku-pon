class UsersController < ApplicationController
    def main
        if user_signed_in?
            render 'index2'
        else
            render 'sign_up'
        end
    end
    
    def login
        if params[:age] == "kindai" and params[:gender] == "sanriko"
            session[:login_uid] = params[:gender]
            redirect_to tops_index2_path
        else
            render 'login_failed'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to roo_path
    end
    def new
        @user=User.new
    end
    def create
        @user=User.new(user_params)
        if @user.save!
            redirect_to login_path
        else
            render 'tops/index'
        end
    end
    def show
        @nickname=current_user.nickname
        @tweets=current_user.tweets
    end
    private
    def user_params
        params.require(:user).permit(:age, :gender, :email, :password, :password_confirmation)
    end
end