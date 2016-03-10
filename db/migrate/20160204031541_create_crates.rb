class CreateCrates < ActiveRecord::Migration
  def change
    create_table :crates do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text   :description
      t.timestamps null: false
    end

    add_index :crates,[:user_id,:created_at]
  end
end