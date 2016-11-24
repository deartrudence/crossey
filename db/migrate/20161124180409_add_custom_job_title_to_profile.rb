class AddCustomJobTitleToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :custom_job_title, :string
  end
end
