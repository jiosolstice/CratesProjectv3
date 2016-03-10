class CreateUserRatings < ActiveRecord::Migration
  def change
    create_table :user_ratings do |t|
      t.references :rating, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :rated_person

      t.timestamps null: false
    end
  end
end
