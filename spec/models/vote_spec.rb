require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it 'is invalid with invalid attribute' do
      expect(Vote.new).to be_invalid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
