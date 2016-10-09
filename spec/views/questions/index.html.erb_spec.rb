require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :subsection => "Subsection",
        :job_type => "Job Type",
        :question_text => "Question Text",
        :question_type => "Question Type",
        :section => nil
      ),
      Question.create!(
        :subsection => "Subsection",
        :job_type => "Job Type",
        :question_text => "Question Text",
        :question_type => "Question Type",
        :section => nil
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Subsection".to_s, :count => 2
    assert_select "tr>td", :text => "Job Type".to_s, :count => 2
    assert_select "tr>td", :text => "Question Text".to_s, :count => 2
    assert_select "tr>td", :text => "Question Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
