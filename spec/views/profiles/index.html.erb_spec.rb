require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :job_title => "Job Title",
        :job_type => "Job Type"
      ),
      Profile.create!(
        :user => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :job_title => "Job Title",
        :job_type => "Job Type"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
    assert_select "tr>td", :text => "Job Type".to_s, :count => 2
  end
end
