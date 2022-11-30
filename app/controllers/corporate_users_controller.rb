class CorporateUsersController < ApplicationController
    def new
    end
    def create
        corporate=Corporate.find_by(name: corporate_user_params[:name])
        if corporate && corporate.authenticate(corporate_user_params[:password])
            redirect_to corporate_user_show_path
        else
            render 'new'
        end
    end
    def show
        @corporate=Corporate.find_by(params[:name])
    end
    def destroy
        corporateuser=Corporate.find_by(params[:name])
        corporateuser.delete
        redirect_to corporate_login_path
    end
    
    private
    def corporate_user_params
        params.require(:corporate_user).permit(:name, :password, :password_confirmation)
    end
    def corporate_params
        params.require(:corporate).permit(:name)
    end
end
