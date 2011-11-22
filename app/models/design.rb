class Design < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  validates_presence_of :title, :description, :image
end
