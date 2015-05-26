require 'rails_helper'

RSpec.describe Concoction, type: :model do
  describe 'properties' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :title= }
    it { is_expected.to respond_to :created_at }
    it { is_expected.to respond_to :created_at= }
    it { is_expected.to respond_to :updated_at }
    it { is_expected.to respond_to :updated_at= }
  end

  describe 'relationships' do
    it { is_expected.to respond_to :recipe }
    it { is_expected.to respond_to :concoction_type }
    it { is_expected.to respond_to :ingredients }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end
end
