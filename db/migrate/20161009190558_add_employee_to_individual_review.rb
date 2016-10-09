class AddEmployeeToIndividualReview < ActiveRecord::Migration
  def change
    add_column :individual_reviews, :employee_id, :integer
    add_column :individual_reviews, :reviewer_id, :integer
  end
end
