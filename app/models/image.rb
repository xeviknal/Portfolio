class Image < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  belongs_to :design
end