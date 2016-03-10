class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :crates
      t.timestamps null: false
    end
  end
end
