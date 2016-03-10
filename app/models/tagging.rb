class Tagging < ActiveRecord::Base
  belongs_to :crate
  belongs_to :tag
end
