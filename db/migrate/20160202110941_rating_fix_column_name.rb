class RatingFixColumnName < ActiveRecord::Migration
  def change
      rename_column :ratings, :name, :rating_name
  end
end
