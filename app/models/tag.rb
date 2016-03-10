class Tag < ActiveRecord::Base
    has_many :taggings
    has_many :crates, :through => :taggings
end
