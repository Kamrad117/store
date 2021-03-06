class Asset < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, :styles => { :medium => "452x300>", :thumb => "100x100>", :tiny => "50x50>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentPresenceValidator, :attributes => :image

end
