class AddBelongsToPicture < ActiveRecord::Migration
  def change
      add_belongs_to :pictures, :crate
  end
end
