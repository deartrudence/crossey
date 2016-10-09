require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :subsection => "MyString",
      :job_type => "MyString",
      :question_text => "MyString",
      :question_type => "MyString",
      :section => nil
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input#question_subsection[name=?]", "question[subsection]"

      assert_select "input#question_job_type[name=?]", "question[job_type]"

      assert_select "input#question_question_text[name=?]", "question[question_text]"

      assert_select "input#question_question_type[name=?]", "question[question_type]"

      assert_select "input#question_section_id[name=?]", "question[section_id]"
    end
  end
end
