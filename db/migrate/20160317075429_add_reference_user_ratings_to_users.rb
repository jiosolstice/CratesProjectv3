class AddReferenceUserRatingsToUsers < ActiveRecord::Migration
  def change
      add_reference :users, :user_status, index: true, default: 1
  end
end
