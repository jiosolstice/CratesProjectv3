class AddMemberCountToGroups < ActiveRecord::Migration
  def change
      add_column :groups, :member_count, :integer, :default => 0
  end
end
