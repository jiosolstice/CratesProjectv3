class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :query
  validates :body, presence:true, length:{maximum: 150}
    validates :query_id, presence: true, allow_nil: false
     def set_user!(user)
        self.user_id = user.id
        self.save
    end
end
