class AddArchivedToIndividualReview < ActiveRecord::Migration
  def change
    add_column :individual_reviews, :archived, :boolean, :default => false
  end
end
