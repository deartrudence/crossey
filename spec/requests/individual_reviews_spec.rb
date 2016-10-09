require 'rails_helper'

RSpec.describe "IndividualReviews", type: :request do
  describe "GET /individual_reviews" do
    it "works! (now write some real specs)" do
      get individual_reviews_path
      expect(response).to have_http_status(200)
    end
  end
end
