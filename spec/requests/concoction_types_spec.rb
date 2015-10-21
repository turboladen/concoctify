require 'rails_helper'

RSpec.describe "ConcoctionTypes", :type => :request do
  describe "GET /concoction_types" do
    it "works! (now write some real specs)" do
      get concoction_types_path
      expect(response.status).to be(200)
    end
  end
end
