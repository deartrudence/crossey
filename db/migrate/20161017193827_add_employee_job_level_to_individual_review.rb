class AddEmployeeJobLevelToIndividualReview < ActiveRecord::Migration
  def change
    add_column :individual_reviews, :employee_job_level, :integer
  end
end
