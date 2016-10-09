require 'rails_helper'

RSpec.describe "section_answers/show", type: :view do
  before(:each) do
    @section_answer = assign(:section_answer, SectionAnswer.create!(
      :section => nil,
      :individual_review => nil,
      :employee_comment => "MyText",
      :reviewer_comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
