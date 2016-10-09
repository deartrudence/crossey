require 'rails_helper'

RSpec.describe "section_answers/edit", type: :view do
  before(:each) do
    @section_answer = assign(:section_answer, SectionAnswer.create!(
      :section => nil,
      :individual_review => nil,
      :employee_comment => "MyText",
      :reviewer_comment => "MyText"
    ))
  end

  it "renders the edit section_answer form" do
    render

    assert_select "form[action=?][method=?]", section_answer_path(@section_answer), "post" do

      assert_select "input#section_answer_section_id[name=?]", "section_answer[section_id]"

      assert_select "input#section_answer_individual_review_id[name=?]", "section_answer[individual_review_id]"

      assert_select "textarea#section_answer_employee_comment[name=?]", "section_answer[employee_comment]"

      assert_select "textarea#section_answer_reviewer_comment[name=?]", "section_answer[reviewer_comment]"
    end
  end
end
