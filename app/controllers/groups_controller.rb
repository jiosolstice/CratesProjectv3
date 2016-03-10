class GroupsController < ApplicationController
    
    def index
    end
    
    def show
        @group = Group.find(params[:id])
        @users = User.in_group(@group)

    end
    
    
    
    
    
end
 