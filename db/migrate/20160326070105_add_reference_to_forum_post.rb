class AddReferenceToForumPost < ActiveRecord::Migration
  def change
    add_reference :forum_posts, :forum_category, index: true
  end
end
