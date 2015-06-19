class Photo < ActiveRecord::Base
  belongs_to :user
  validate :validate_model
  validates :image, :presence => true
  validates :description, :presence => true
  has_attached_file :image, :styles => { :large => "2280x1200", :medium => "1200x800>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  after_post_process  :post_process_photo

  def post_process_photo
    imgfile = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    self.model = imgfile.model
    rescue EXIFR::MalformedJPEG
  end

  def validate_model
    if model.blank?
      self.model = "Unknown Source"
    else
      validates_presence_of :model
    end
  end

end
