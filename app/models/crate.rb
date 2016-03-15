class Crate < ActiveRecord::Base
  belongs_to :user
  has_one :category
  has_one :state
  has_one :quality
  has_many :taggings ,:dependent => :delete_all
  has_many :tags, :through => :taggings
  has_many :pictures, :dependent => :delete_all
  has_one :location
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 30}
  validates :description, presence: true
  validates :states_id,presence: true
  validates :price, presence: true
    
          
    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end

    def all_tags
        self.tags.map(&:name).join(", ")
    end
    
    def self.tagged_with(name)
        Tag.find_by_name!(name).crates
    end
    

end
