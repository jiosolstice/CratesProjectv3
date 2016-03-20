class ChangeDefaultActiveStatusOnCrates < ActiveRecord::Migration
  def change
      change_column_default(:crates, :active_status_id, '1')
  end
end
