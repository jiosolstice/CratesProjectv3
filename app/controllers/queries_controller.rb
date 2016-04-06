class QueriesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def create
        @crate = Crate.find(params[:query][:crate_id])
        @query = @crate.queries.build(query_params)
        if @query.save
            @query.set_user!(current_user)
            flash[:success] = 'Query Posted'
            redirect_to @crate
        else
            flash[:error] = @query.errors.full_messages.join(", ")
            redirect_to @crate
        end
    end
    
    private
    def query_params
        params.require(:query).permit(:title,:description)
    end
end
