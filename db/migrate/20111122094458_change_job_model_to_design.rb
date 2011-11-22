class ChangeJobModelToDesign < ActiveRecord::Migration
  def up
    rename_table('jobs', 'designs')
  end

  def down
    rename_table('designs', 'jobs')
  end
end
