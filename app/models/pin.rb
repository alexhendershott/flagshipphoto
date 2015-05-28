class Pin < ActiveRecord::Base
  belongs_to :user
  validates :device, :presence => true
  # validates_presence_of :device, :message => "not selected"
  validates :image, :presence => true
  validates :description, :presence => true
  has_attached_file :image, :styles => { :large => "2280x1200", :medium => "1200x800>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
