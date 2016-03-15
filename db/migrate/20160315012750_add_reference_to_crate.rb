class AddReferenceToCrate < ActiveRecord::Migration
  def change
      add_reference :crates, :category, index: true, foreign_key: true
  end
end
