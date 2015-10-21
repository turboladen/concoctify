require 'rails_helper'

RSpec.describe Concoction, type: :model do
  describe 'properties' do
    it { is_expected.to have_property :name }
    it { is_expected.to have_property :created_at }
    it { is_expected.to have_property :updated_at }
  end

  describe 'relationships' do
    it { is_expected.to respond_to :recipe }
    it { is_expected.to respond_to :concoction_type }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
