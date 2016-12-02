class AddArchivedToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :archived, :boolean
  end
end
