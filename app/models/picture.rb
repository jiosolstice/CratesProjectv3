class Picture < ActiveRecord::Base
  belongs_to :crate
  validates_associated :crate
    
  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename",
    styles: {thumb: "200x250!",medium: "300x300!"},
    default_url: "/images/:style/missing.png"
    
    
   validates :image, :attachment_content_type => { :content_type => ['image/png', 'image/jpg','image/jpeg']}
   #do_not_validate_attachment_file_type :image
    
end
