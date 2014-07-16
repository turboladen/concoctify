require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:recipes, [
      Fabricate(:recipe),
      Fabricate(:recipe)
    ])
  end

  it 'renders a list of recipes' do
    render
  end
end
