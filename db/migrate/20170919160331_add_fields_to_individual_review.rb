class AddFieldsToIndividualReview < ActiveRecord::Migration
  def change
    add_column :individual_reviews, :employee_completed, :boolean, default: false
    add_column :individual_reviews, :reviewer_completed, :boolean, default: false
  end
end
