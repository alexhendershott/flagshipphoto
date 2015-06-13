class Photo < ActiveRecord::Base
  belongs_to :user
  # validates_presence_of :device, :message => "not selected"
  validates :model, :presence => true
  validates :image, :presence => true
  validates :description, :presence => true
  has_attached_file :image, :styles => { :large => "2280x1200", :medium => "1200x800>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # Post Process EXIF Extraction
  after_post_process  :post_process_photo
  def post_process_photo
    imgfile = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    return unless imgfile
    self.model         = imgfile.model
  end

end
