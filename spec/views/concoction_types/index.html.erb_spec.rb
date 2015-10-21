require 'rails_helper'

RSpec.describe "concoction_types/index", :type => :view do
  before(:each) do
    assign(:concoction_types, [
      ConcoctionType.create!(
        :name => "Name"
      ),
      ConcoctionType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of concoction_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
