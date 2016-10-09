class AddReviewIdToIndividualReview < ActiveRecord::Migration
  def change
    add_reference :individual_reviews, :review, index: true, foreign_key: true
  end
end
