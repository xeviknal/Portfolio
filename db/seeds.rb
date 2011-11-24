# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Design.delete_all
PICTURE_BASE = '/app/assets/images/test/'
30.times do |i|
  Design.create :title => "Design ##{i+1}", :description => "Description for the design ##{i+1}", :image => File.open(File.join(Rails.root, PICTURE_BASE + "description.jpg"))
end
