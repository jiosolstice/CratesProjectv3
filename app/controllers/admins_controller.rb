class AdminsController < ApplicationController
    before_action :logged_in_user, only: [:make_admin, :undo_admin]
    before_action :check_auth, only: [:make_admin, :undo_admin]
    
    def show
        @reports = Report.all
        @admins = Admin.all
        
        
        
    end
    
    def make_admin(user_id)
        Admin.create(user_id: user_id)
    end
    
    def undo_admin(user_id)
        Admin.find_by(user_id: user_id).destroy
    end
    
    def disable_account(user_id)
        user = User.find(user_id)
        user.update_attributes(user_status_id: 2)
    end
    
    
    
    
end
