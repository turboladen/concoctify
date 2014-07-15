require 'rails_helper'

describe Recipe do
  describe '#title' do
    it { should validate_presence_of :title }
  end

  describe '#description' do
    it { should validate_presence_of :description }
  end

  describe '#directions' do
    it { should validate_presence_of :directions }
  end

  describe '#concoction_type' do
    it { should validate_presence_of :concoction_type }
  end
end
