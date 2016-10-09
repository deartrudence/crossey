require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :job_title => "MyString",
      :job_type => "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_user_id[name=?]", "profile[user_id]"

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"

      assert_select "input#profile_job_title[name=?]", "profile[job_title]"

      assert_select "input#profile_job_type[name=?]", "profile[job_type]"
    end
  end
end
