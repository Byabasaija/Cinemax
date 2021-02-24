require 'rails_helper'

RSpec.describe Article, type: :model do
 fixtures :articles
  it 'is valid with valid attributes' do
    expect(Article.new).to be_valid
  end
end
