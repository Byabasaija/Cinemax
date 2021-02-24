require 'rails_helper'

RSpec.describe 'Sign user', type: :feature do
  
  scenario 'sign in successfully' do
    visit new_user_path
    fill_in 'Name', with: 'testname', visible: false
    click_button('Login')
    visit new_category_path
    expect(page).to have_current_path('/categories/new')
  end
end