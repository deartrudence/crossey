require 'rails_helper'

RSpec.describe "individual_reviews/show", type: :view do
  before(:each) do
    @individual_review = assign(:individual_review, IndividualReview.create!(
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
