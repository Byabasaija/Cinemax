require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is invalid with valid attributes' do
      expect(Category.new).to be_invalid
    end
    it 'is valid with valid attributes' do
      expect(Category.new(name: 'testcategory', priority: 7)).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_and_belong_to_many(:articles) }
  end
end
