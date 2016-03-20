module ApplicationHelper
    
   def profile_null?
        current_user.profile.nil?
    end

    def admin?
        Admin.exists?(user_id: current_user.id)
    end
end
