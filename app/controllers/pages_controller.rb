class PagesController < ApplicationController
    
    
    def home
        render :home_guest unless logged_in?
        if logged_in?
            @active_crates = Crate.where(["user_id = ? and active_status_id = ?", current_user.id , 1])
            @inactive_crates = Crate.where(["user_id = ? and active_status_id = ?", current_user.id , 2])
        end
    end
    

    def help
    end
    
    def community
        @users = User.all
        @groups = Group.all
    end
    
    def home_guest
        
    end
    
end
