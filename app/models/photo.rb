
class Photo < ApplicationRecord
  belongs_to :tour, optional:  true
  before_destroy :remember_id
  after_destroy :remove_id_directory



  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_attachment :image, presence: true,
                       content_type: { content_type: "image/jpeg" },
                       size: { in: 0..10.megabytes }


  #mount_uploader :photo_name, PhotoUploader
  #validates :photo_name, presence: true

  protected
  def remember_id
    @id = id
  end


  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/tour_photo/#{@id}", :force => true)
  end
end




<!--
class Photo < ApplicationRecord
  belongs_to :tour

  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_attachment :image, presence: true,
                       content_type: { content_type: "image/jpeg" },
                       size: { in: 0..10.megabytes }
end
-->
