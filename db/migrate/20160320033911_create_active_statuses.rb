class CreateActiveStatuses < ActiveRecord::Migration
  def change
    create_table :active_statuses do |t|
        t.string :name
    end
      add_reference :crates, :active_status, index:true  
  end
end
