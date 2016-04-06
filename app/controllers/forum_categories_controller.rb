class ForumCategoriesController < ApplicationController
    def show
        @fcat = ForumCategory.find(params[:id])
        @forum_posts = ForumPost.where(:forum_category_id => params[:id]).by_pin.by_last_comment
    end
end
