class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
        t.references :user, index:true, foreign_key: true
        t.string :first_name
        t.string :middle_name
        t.string :last_name
        t.string :address
        t.string :phone_number
        t.string :gender
        t.date :birth_date
        t.timestamps null: false
    end 
      add_index :profiles ,[:user_id,:created_at] 
  end
end
