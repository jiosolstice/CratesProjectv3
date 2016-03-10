class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
        t.string :status
        t.string :color
      t.timestamps null: false
    end
      add_reference :crates, :states, index: true
      add_index :states, [:status,:color]
  end
end
