require 'rails_helper'

RSpec.describe "user_roles/index", type: :view do
  before(:each) do
    assign(:user_roles, [
      UserRole.create!(
        :name => "Name",
        :user => nil
      ),
      UserRole.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of user_roles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
