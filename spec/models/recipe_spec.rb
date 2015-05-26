require 'rails_helper'

describe Recipe do
  describe 'properties' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :title= }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :description= }
    it { is_expected.to respond_to :directions }
    it { is_expected.to respond_to :directions= }
    it { is_expected.to respond_to :yields }
    it { is_expected.to respond_to :yields= }
    it { is_expected.to respond_to :yields_unit }
    it { is_expected.to respond_to :yields_unit= }
    it { is_expected.to respond_to :created_at }
    it { is_expected.to respond_to :created_at= }
    it { is_expected.to respond_to :updated_at }
    it { is_expected.to respond_to :updated_at= }
  end

  describe 'relationships' do
    it { is_expected.to respond_to :concoction_type }
    it { is_expected.to respond_to :concoctions }
    it { is_expected.to respond_to :ingredients }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :directions }
  end

  describe '#concoction_type' do
    it do
      pending 'Figuring out how to validate this'
      should validate_presence_of :concoction_type
    end
  end
end
