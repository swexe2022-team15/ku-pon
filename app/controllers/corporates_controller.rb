class CorporatesController < ApplicationController
    def new
        @corporate=Corporate.new
    end
    
    def create
        @corporate=Corporate.new(corporate_params)
        if @corporate.save!
            redirect_to corporate_login_path
        else
            render 'new'
        end
    end
    def destroy
        log_out
        redirect_to ports_index3_path
    end
    
    private
    def corporate_params
        params.require(:corporate).permit(:name, :password, :password_confirmation)
    end
end
