class Design < ActiveRecord::Base
  has_many :images
  validates_presence_of :title, :description

  #per_page constant for will_paginate gem
  self.per_page = 10

  def disqus_identificator
    "#{Digest::MD5.hexdigest id.to_s}"
  end

  def splash
    self.images.order(:sort_by).first
  end
end
