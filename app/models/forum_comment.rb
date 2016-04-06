class ForumComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_post
    
  default_scope -> { order(created_at: :asc)}
    
end
