class Photo < ActiveRecord::Base
  belongs_to :user
  validate :rename_models
  validates_presence_of :model, :message => "type not detected. Try uploading another photo."
  validates :image, :presence => true
  validates :description, :presence => true
  has_attached_file :image, :styles => { :large => "2280x1200", :medium => "1200x800>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  after_post_process  :post_process_photo

  def post_process_photo
    imgfile = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    self.model = imgfile.model
    rescue EXIFR::MalformedJPEG
      return nil?
  end

  def rename_models
    # Set Non Camera Photo to Unknown
    # if model.blank?
    #   self.model = "Unknown Source"
    # else
    #   validates_presence_of :model
    # end

    # Rename/Group Samsung S6 Models
    if model == "SM-G920F"
      self.model = "Samsung Galaxy S6"
    end
    if model == "SM-G920I"
      self.model = "Samsung Galaxy S6"
    end
    if model == "SM-G920T"
      self.model = "Samsung Galaxy S6"
    end
    if model == "SM-G925F"
      self.model = "Samsung Galaxy S6"
    end
    if model == "SM-G925I"
      self.model = "Samsung Galaxy S6"
    end
    # Rename/Group LG G4
    if model == "LG-H815"
      self.model = "LG G4"
    end
    # Rename/Group LG G3
    if model == "LG-D851"
      self.model = "LG G3"
    end
    # Rename/Group Samsung Galaxy Note 4
    if model == "SM-N910T"
      self.model = "Samsung Galaxy Note 4"
    end
    # Rename/Group Moto X (2014)
    if model == "XT1097"
      self.model = "Moto X (2014)"
    end
    # Rename/Group Moto G (2nd Gen)
    if model == "XT1068"
      self.model = "Moto G (2nd Gen)"
    end
    # Rename/Group Moto G (2nd Gen)
    if model == "XT1064"
      self.model = "Moto G (2nd Gen)"
    end
  end

end
