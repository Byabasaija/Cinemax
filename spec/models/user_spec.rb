require 'rails_helper'

RSpec.describe User, type: :model do


  it 'is valid with valid attributes' do
    expect(User.new(name: "myname")). to be_valid 
  end
  it 'is invalid with invalid attributes' do
    expect(User.new).to be_invalid
  end
end
