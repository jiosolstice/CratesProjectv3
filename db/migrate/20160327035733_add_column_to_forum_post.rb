class AddColumnToForumPost < ActiveRecord::Migration
  def change
    add_column :forum_posts, :is_pin, :boolean, :default => false
    add_column :forum_posts, :is_lock, :boolean, :default => false
  end
end
