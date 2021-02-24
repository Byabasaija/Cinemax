require 'rails_helper'

RSpec.describe Vote, type: :model do

  
  it 'is invalid with invalid attribute' do
    expect(Vote.new).to be_invalid
  end
end
