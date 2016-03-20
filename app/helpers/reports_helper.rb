module ReportsHelper
    def target_user(user_id)
       User.find(user_id)
    end
    
end
