module ApplicationHelper
    
   def profile_null?
        current_user.profile.nil?
    end

end
