class ApplicationController < ActionController::Base

  Forem::ApplicationController.class_eval do
    before_filter :logged_in_user
  end
    
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
    
    # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
        flash[:error] = "Please log in."
      redirect_to login_url
    end
  end
    
  def forem_user
    current_user
  end
     
  def check_auth
        unless admin?
            flash[:error] = "Invalid Action"
            redirect_to root_url
        end
  end    
    
  
    
end
