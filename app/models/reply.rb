class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :query
     def set_user!(user)
        self.user_id = user.id
        self.save
    end
end
