require 'rails_helper'

RSpec.feature 'Posts management', type: :feature do
  scenario 'user creates new Post', js: true do
    visit '/admin/posts'
    expect(page).to have_selector('.modal', visible: false)
    click_link('ADD')
    expect(page).to have_selector('.modal', visible: true)
    within(:css, "form#new_post") do
      fill_in 'Title', with: 'Test title'
      fill_in 'Body', with: 'Test body'
      click_button('SUBMIT')
    end
    expect(page).to have_selector('.modal', visible: false)
    expect(page).to have_content('Test title')
  end
end