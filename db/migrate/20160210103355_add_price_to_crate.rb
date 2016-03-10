class AddPriceToCrate < ActiveRecord::Migration
  def change
      add_column :crates, :price, :decimal, precision: 11, scale:2
  end
end
