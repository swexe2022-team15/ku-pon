class ApplicationController < ActionController::Base
  def sign_in(user)
    remember_token=User.new_remember_token
    cookies.peranent[:user_remember_token]=remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user=user
  end
  def sign_out
    cookies.delete(:user_remember_token)
  end
  
  def sign_in(usercorporate)
    remember_token=Corporate.new_remember_token
    cookies.permanent[:corporate_remember_token]=remember_token
    corporate.update!(remember_token: Corporate.encrypt(remember_token))
    @current_user=corporate
  end
  def sign_out
    cookies.delete(:corporate_remember_token)
  end
  
  protect_from_forgery with: :exception
  include SessionsHelper
end
