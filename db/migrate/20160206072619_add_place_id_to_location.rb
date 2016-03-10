class AddPlaceIdToLocation < ActiveRecord::Migration
  def change
      add_column :locations, :place_id, :string
      add_column :locations, :name, :string
      remove_column :locations, :crates_id
      add_reference :crates, :locations, index: true
  end
end
