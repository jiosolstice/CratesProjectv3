class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true        
      t.timestamps null: false
    end
  end
end
