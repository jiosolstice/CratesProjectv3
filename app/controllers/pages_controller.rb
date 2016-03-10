class PagesController < ApplicationController
    
    def home
        render :home_guest unless logged_in?
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
