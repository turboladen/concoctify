require 'rails_helper'

RSpec.describe "concoction_types/edit", :type => :view do
  before(:each) do
    @concoction_type = assign(:concoction_type, ConcoctionType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit concoction_type form" do
    render

    assert_select "form[action=?][method=?]", concoction_type_path(@concoction_type), "post" do

      assert_select "input#concoction_type_name[name=?]", "concoction_type[name]"
    end
  end
end
