class Picture < ActiveRecord::Base
  belongs_to :crate
    
  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename",
    styles: {thumb: "200x250>",medium: "300x300>"},
    default_url: "/images/:style/missing.png"
    
    
   #validates_attachment :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
   do_not_validate_attachment_file_type :image
    
end
