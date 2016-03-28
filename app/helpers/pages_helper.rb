module PagesHelper
    
    def postings(cat_id)
        ForumPost.where(:forum_category_id => cat_id).limit(5)
    end

    
end
