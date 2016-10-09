require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new())
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do
    end
  end
end
