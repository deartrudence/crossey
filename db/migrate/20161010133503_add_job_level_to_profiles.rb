class AddJobLevelToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :job_level, :integer
  end
end
