require "rails_helper"

RSpec.describe SectionAnswersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/section_answers").to route_to("section_answers#index")
    end

    it "routes to #new" do
      expect(:get => "/section_answers/new").to route_to("section_answers#new")
    end

    it "routes to #show" do
      expect(:get => "/section_answers/1").to route_to("section_answers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/section_answers/1/edit").to route_to("section_answers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/section_answers").to route_to("section_answers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/section_answers/1").to route_to("section_answers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/section_answers/1").to route_to("section_answers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/section_answers/1").to route_to("section_answers#destroy", :id => "1")
    end

  end
end
