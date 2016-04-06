class CreateForumComments < ActiveRecord::Migration
  def change
    create_table :forum_comments do |t|
      t.string :comment
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :forum_post, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
