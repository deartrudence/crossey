require 'rails_helper'

RSpec.describe "section_answers/index", type: :view do
  before(:each) do
    assign(:section_answers, [
      SectionAnswer.create!(
        :section => nil,
        :individual_review => nil,
        :employee_comment => "MyText",
        :reviewer_comment => "MyText"
      ),
      SectionAnswer.create!(
        :section => nil,
        :individual_review => nil,
        :employee_comment => "MyText",
        :reviewer_comment => "MyText"
      )
    ])
  end

  it "renders a list of section_answers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
