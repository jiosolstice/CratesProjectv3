class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :crate, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
