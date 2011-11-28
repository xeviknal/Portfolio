class Design < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  validates_presence_of :title, :description
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true

  #per_page constant for will_paginate gem
  self.per_page = 10

  def disqus_identificator
    "#{Digest::MD5.hexdigest id.to_s}"
  end

  def splash
    self.images.order(:sort_by).first
  end
end
