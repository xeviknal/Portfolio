class Design < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  validates_presence_of :title, :description
  validate :has_images?
  accepts_nested_attributes_for :images, :allow_destroy => true

  #per_page constant for will_paginate gem
  self.per_page = 8

  def has_images?
    self.errors.add :base, "At least you must create one image" if self.images.blank?
  end

  def disqus_identificator
    "#{Digest::MD5.hexdigest id.to_s}"
  end

  def splash
    self.images.sorted.first
  end
end
