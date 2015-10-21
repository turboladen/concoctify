require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'properties' do
    it { is_expected.to have_property :title }
    it { is_expected.to have_property :description }
    it { is_expected.to have_property :directions }
    it { is_expected.to have_property :yields }
    it { is_expected.to have_property :yields_unit }
    it { is_expected.to have_property :created_at }
    it { is_expected.to have_property :updated_at }
  end

  describe 'relationships' do
    it { is_expected.to respond_to :concoction_type }
    it { is_expected.to respond_to :concoctions }
    it { is_expected.to respond_to :influencing_recipes }
    it { is_expected.to respond_to :ingredients }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :directions }
  end

  describe '#concoction_type' do
    subject do
      Fabricate(:recipe, concoction_type: Fabricate(:concoction_type))
    end

    it do
      pending 'Figuring out how to validate this'
      should validate_presence_of :concoction_type
    end
  end
end
