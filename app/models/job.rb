class Job < ActiveRecord::Base
    validates_presence_of :title, :description, :image
end
