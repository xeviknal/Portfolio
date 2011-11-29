class Image < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  belongs_to :design

  validates_presence_of :image
  validates_numericality_of :sort_by
end
