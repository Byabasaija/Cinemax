require 'rails_helper'

RSpec.describe 'Creating an category', type: :feature do
  
  before :each do
    User.create(name: 'testname')
  end
  scenario 'create category with valid attributes' do
    visit new_user_path
    fill_in 'Name', with: 'testname'
    click_button('Login')
    visit new_category_path
    fill_in 'category_name', with: 'Anything', disabled: false
    fill_in 'category_priority', with: 1
    click_button('Create Category')
    expect(page).to have_current_path(root_path)
  end
end