require 'rails_helper'

RSpec.describe "Ingredients", :type => :request do
  describe "GET /ingredients" do
    it "works! (now write some real specs)" do
      get ingredients_path
      expect(response.status).to be(200)
    end
  end
end
