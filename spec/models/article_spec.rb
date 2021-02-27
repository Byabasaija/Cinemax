require 'rails_helper'

RSpec.describe Article, type: :model do
  subject do
    described_class.new(
      title: 'Anything',
      text: 'Anything',
      image: 'Anything'
    )
  end

  describe 'Validations' do
    it 'is not valid without author' do
      expect(subject).to_not be_valid
    end
    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without an image' do
      subject.image = nil
      expect(subject).to_not be_valid
    end
  end
  describe 'associations' do
    it { should have_and_belong_to_many(:categories) }
    it { should belong_to(:author).without_validating_presence }
    it { should have_many(:votes) }
  end
end
