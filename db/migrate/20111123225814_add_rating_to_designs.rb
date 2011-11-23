class AddRatingToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :rating, :float
  end
end
