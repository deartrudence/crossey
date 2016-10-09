require 'rails_helper'

RSpec.describe "sections/show", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
