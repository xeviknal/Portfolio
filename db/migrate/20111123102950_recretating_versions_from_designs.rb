class RecretatingVersionsFromDesigns < ActiveRecord::Migration
  def up
    Design.all.each do |design|
      design.image.recreate_versions!
    end
  end

  def down
  end
end
