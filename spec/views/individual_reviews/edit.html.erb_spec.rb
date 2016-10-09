require 'rails_helper'

RSpec.describe "individual_reviews/edit", type: :view do
  before(:each) do
    @individual_review = assign(:individual_review, IndividualReview.create!(
      :user => nil
    ))
  end

  it "renders the edit individual_review form" do
    render

    assert_select "form[action=?][method=?]", individual_review_path(@individual_review), "post" do

      assert_select "input#individual_review_user_id[name=?]", "individual_review[user_id]"
    end
  end
end
