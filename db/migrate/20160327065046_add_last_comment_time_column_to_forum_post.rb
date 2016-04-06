class AddLastCommentTimeColumnToForumPost < ActiveRecord::Migration
  def change
    add_column :forum_posts, :last_comment_time, :Timestamp
  end
end
