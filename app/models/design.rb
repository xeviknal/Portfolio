class Design < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  validates_presence_of :title, :description, :image

  #per_page constant for will_paginate gem
  self.per_page = 10

  def disqus_identificator
    "#{Digest::MD5.hexdigest id.to_s}"
  end
end
