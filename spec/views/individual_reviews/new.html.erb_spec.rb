require 'rails_helper'

RSpec.describe "individual_reviews/new", type: :view do
  before(:each) do
    assign(:individual_review, IndividualReview.new(
      :user => nil
    ))
  end

  it "renders new individual_review form" do
    render

    assert_select "form[action=?][method=?]", individual_reviews_path, "post" do

      assert_select "input#individual_review_user_id[name=?]", "individual_review[user_id]"
    end
  end
end
