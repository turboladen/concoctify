require 'rails_helper'

RSpec.describe "concoction_types/show", :type => :view do
  before(:each) do
    @concoction_type = assign(:concoction_type, ConcoctionType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
