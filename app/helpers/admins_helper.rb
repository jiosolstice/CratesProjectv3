module AdminsHelper
       
    def find_admins(id)
        User.find(id)
    end
    
end
