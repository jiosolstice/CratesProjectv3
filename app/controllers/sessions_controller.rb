class SessionsController < ApplicationController
    
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          # Log the user in and redirect to the user's show page.
          if user.activated?
            log_in user
            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
              if user.profile.nil?
                  redirect_to new_user_profile_url(user.id)
              else
                  redirect_to root_url
              end
          else
            message  = 'Account not activated.'
            message += "Check your email for the activation link."
            flash[:warning] = message   
            redirect_to root_url
          end
        else
          # Create an error message.
          flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
          render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end 
  
    
end
