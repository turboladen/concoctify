require 'rails_helper'

RSpec.describe ConcoctionType, type: :model do
  describe 'properties' do
    it { is_expected.to have_property :name }
    it { is_expected.to have_property :created_at }
    it { is_expected.to have_property :updated_at }
  end

  describe 'relationships' do
    it { is_expected.to respond_to :recipes }
    it { is_expected.to respond_to :concoctions }
  end

  describe 'validations' do
    before { expect(subject).to_not be_valid }

    context 'name presence' do
      specify do
        expect(subject.errors[:name].first).to eq "can't be blank"
      end
    end

    context 'name uniqueness' do
      specify do
        Fabricate(:concoction_type, name: 'test')

        subject.name = 'test'
        subject.valid?
        expect(subject.errors[:name].first).
          to eq "'test' has already been taken"
      end
    end
  end
end
