require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is invalid with valid attributes' do
    expect(Category.new).to be_invalid
  end
  it 'is valid with valid attributes' do
    expect(Category.new(name:"testcategory", priority:7)).to be_valid
  end
end
