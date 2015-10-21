require 'rails_helper'

RSpec.describe "concoction_types/new", :type => :view do
  before(:each) do
    assign(:concoction_type, ConcoctionType.new(
      :name => "MyString"
    ))
  end

  it "renders new concoction_type form" do
    render

    assert_select "form[action=?][method=?]", concoction_types_path, "post" do

      assert_select "input#concoction_type_name[name=?]", "concoction_type[name]"
    end
  end
end
