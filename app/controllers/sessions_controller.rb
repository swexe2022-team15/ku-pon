class SessionsController < ApplicationController
    def new
    end
    
    def create
      @user=User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
          redirect_to '/posts/index3'
        else
          render 'tops/index'
        end
    end
    
    def destroy
      log_out
      redirect_to login_path
    end
    
    private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
