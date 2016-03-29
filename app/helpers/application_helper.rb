module ApplicationHelper
    
   def profile_null?
        current_user.profile.nil?
    end

    def admin?
        Admin.exists?(user_id: current_user.id) unless current_user == nil
    end
    
    def target_user(user_id)
        @target_user = User.find(user_id)
    end
    
    def is_owner?(user_id)
        @current_user.id == user_id
    end
    
    def is_pinned?(post_id)
        ForumPost.find(post_id).is_pin?
    end
    
    
end
