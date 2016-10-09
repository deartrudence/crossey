require 'rails_helper'

RSpec.describe "individual_reviews/index", type: :view do
  before(:each) do
    assign(:individual_reviews, [
      IndividualReview.create!(
        :user => nil
      ),
      IndividualReview.create!(
        :user => nil
      )
    ])
  end

  it "renders a list of individual_reviews" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
