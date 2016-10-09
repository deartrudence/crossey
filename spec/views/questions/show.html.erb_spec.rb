require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :subsection => "Subsection",
      :job_type => "Job Type",
      :question_text => "Question Text",
      :question_type => "Question Type",
      :section => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subsection/)
    expect(rendered).to match(/Job Type/)
    expect(rendered).to match(/Question Text/)
    expect(rendered).to match(/Question Type/)
    expect(rendered).to match(//)
  end
end
