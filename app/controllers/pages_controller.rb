class PagesController < ApplicationController
    before_action :is_logged_in, only: [:home,:crate_manager]
    
    def home
        @active_crates = search_byst(current_user.id, 1)
        @inactive_crates = search_byst(current_user.id, 2)
        @fin_crates = search_byst(current_user.id, 3)
    end
    
    def crate_manager
        @active_crates = search_byst(current_user.id, 1)
        @inactive_crates = search_byst(current_user.id, 2)
        @fin_crates = search_byst(current_user.id, 3)    
        if (params.has_key?(:crate_id) && params.has_key?(:active_id))
            Crate.find(params[:crate_id]).update_attributes(active_status_id: params[:active_id])
        end
    end
    
    def help
    end
    
    def community
        @users = User.all
        @groups = Group.all
        @forum_cat = ForumCategory.all
    end
    
    def home_guest
        
    end
    
    private
    def search_byst(us_id,st_id)
        Crate.where(["user_id = ? and active_status_id = ?", us_id , st_id])
    end
    
    def is_logged_in
        render :home_guest unless logged_in?
    end
end
