class Design < ActiveRecord::Base
    validates_presence_of :title, :description, :image
end
