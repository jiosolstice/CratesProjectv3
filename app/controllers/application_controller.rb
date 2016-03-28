class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper
    
    # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:error] = "Please log in."
      redirect_to login_url
    end
  end
     
  def check_auth
        unless admin?
            flash[:error] = "Invalid Action"
            redirect_to root_url
        end
  end    
    
  
    
end
