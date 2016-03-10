class CreateQualities < ActiveRecord::Migration
  def change
    create_table :qualities do |t|
      t.string :name, index: true
      t.timestamps null: false
    end
      add_reference :crates, :qualities, index: true
  end
end
