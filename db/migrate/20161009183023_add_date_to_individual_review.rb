class AddDateToIndividualReview < ActiveRecord::Migration
  def change
    add_column :individual_reviews, :date, :date
  end
end
