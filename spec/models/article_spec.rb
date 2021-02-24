require 'rails_helper'

RSpec.describe Article, type: :model do

  it 'is invalid with invalid attributes' do 
    expect(Article.new).to be_invalid
  end

end
