class AddJobTypeandJobTitleToIndividualReview < ActiveRecord::Migration
  def change
    add_column :individual_reviews, :employee_job_type, :string
    add_column :individual_reviews, :employee_job_title, :string
  end
end
