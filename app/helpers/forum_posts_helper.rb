module ForumPostsHelper
    def fcat(id)
        @fcat = ForumCategory.find(id)
    end
    
end
