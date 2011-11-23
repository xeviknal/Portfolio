class Design < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  validates_presence_of :title, :description, :image

  #per_page constant for will_paginate gem
  self.per_page = 10
end
