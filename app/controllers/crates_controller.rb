class CratesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :edit]
    before_action :correct_crate,   only: [:destroy, :edit, :update]
    before_action :add_profile, only: [:new,:create]
    rescue_from ::ActiveRecord::RecordNotFound, with: :dont_url_manipulate
    rescue_from ::ActiveRecord::InvalidForeignKey, with: :dont_url_manipulate

    def index
        @search = Crate.ransack(params[:q])
        if params.has_key?(:name)
            @crates = Crate.quick_find(params[:name])
        else
            if params[:tag]
                @crates = Crate.tagged_with(params[:tag])
            else
                @crates = @search.result
            end
        end
        
    end
    
    
    def add_profile
        if current_user.profile.nil?
            flash[:success] = 'Edit your Profile First'
            redirect_to new_user_profile_url(current_user.id)
        end
    end
    
    def new
      @locations = Location.all
      @crate = current_user.crates.build if logged_in?
    end

    def create
        @crate = current_user.crates.build(crate_params)
        if @crate.save
            if params[:images]   
                params[:images].each { |image|
                 @crate.pictures.create(image: image)
                }
            end  
            flash[:success] = 'Crate has been posted!'
            redirect_to root_url
        else
            render '/'
        end        
    end
    
    def edit
        @crate = Crate.find(params[:id])
        @pictures = Picture.where(crate_id: params[:id])
    end
    
    def update
        @crate = Crate.find(params[:id])
        if @crate.update_attributes(crate_params)
            if params[:images]   
                params[:images].each { |image|
                 @crate.pictures.create(image: image)
                }
                flash[:success] = 'Crate has been posted!'
            end
            #successful edit
            flash[:success] = 'Crate updated'
            redirect_to @crate
        else
            render 'edit'
        end
    end
    
    def destroy
        @crate.destroy
        flash[:success] = "Crate deleted"
        redirect_to '/'
    end
    
    
    
    def correct_crate
        @crate = Crate.find(params[:id])
        redirect_to root_url if current_user.id != @crate.user.id
    end
    
    def show
        @crate = Crate.find(params[:id])
        @images = @crate.pictures
    end
       
    private
    def crate_params
        params.require(:crate).permit(:name,:description,:states_id, :all_tags,:price,:qualities_id,:locations_id,:category_id)
    end
    
end
