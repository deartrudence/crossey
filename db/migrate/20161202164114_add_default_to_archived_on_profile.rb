class AddDefaultToArchivedOnProfile < ActiveRecord::Migration
  def up
    change_column :profiles, :archived, :boolean, :default => false
  end

  def down
    change_column :profiles, :archived, :boolean, :default => nil
  end
end
