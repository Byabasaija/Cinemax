require 'rails_helper'

RSpec.describe Article, type: :model do

describe 'validation tests' do
  it 'is invalid with invalid attributes' do 
    expect(Article.new).to be_invalid
  end
end
 describe 'associations' do
  it {should have_and_belong_to_many(:categories)}
 end
end
