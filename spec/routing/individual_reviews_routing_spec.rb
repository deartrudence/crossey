require "rails_helper"

RSpec.describe IndividualReviewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/individual_reviews").to route_to("individual_reviews#index")
    end

    it "routes to #new" do
      expect(:get => "/individual_reviews/new").to route_to("individual_reviews#new")
    end

    it "routes to #show" do
      expect(:get => "/individual_reviews/1").to route_to("individual_reviews#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/individual_reviews/1/edit").to route_to("individual_reviews#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/individual_reviews").to route_to("individual_reviews#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/individual_reviews/1").to route_to("individual_reviews#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/individual_reviews/1").to route_to("individual_reviews#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/individual_reviews/1").to route_to("individual_reviews#destroy", :id => "1")
    end

  end
end
