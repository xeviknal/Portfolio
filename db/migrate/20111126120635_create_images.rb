class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string :image
      t.text :description
      t.integer :sort_by
      t.references :design

      t.timestamps
    end

    #Saving all old images from designs model
    current_imgs = Hash[Design.all.map{|d| [d, d.image]}]
    puts current_imgs
    #Removing image colum
    remove_column :designs, :image

    #adding old images to image table
    current_imgs.each do |k,v|
      i = Image.new
      i.image = v
      i.design = k
      i.save
    end
    add_index :images, :design_id
  end

  def down
    current_imgs = Hash[Image.all.map{|i| [i.design, i.image]}]
    puts current_imgs

    add_column :designs, :image, :string
    #current_imgs.each do |k,v|
    #  puts v
    #  d.update_attributes! :image => v
    #end

    drop_table :images
    #remove_index :images, :design_id
  end
end
