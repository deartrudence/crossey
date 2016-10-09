require 'rails_helper'

RSpec.describe "SectionAnswers", type: :request do
  describe "GET /section_answers" do
    it "works! (now write some real specs)" do
      get section_answers_path
      expect(response).to have_http_status(200)
    end
  end
end
