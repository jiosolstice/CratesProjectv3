class AddLongLatToLocation < ActiveRecord::Migration
  def change
      add_column :locations, :lng, :double
      add_column :locations, :lat, :double
  end
end
