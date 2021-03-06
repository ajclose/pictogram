require 'rails_helper.rb'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user via the index page' do
    fill_in 'User name', with: 'newuser'
    fill_in 'Email', with: 'newuser@email.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'newuser@email.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'User name', with: 'h'
    fill_in 'Email', with: 'newuser@email.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end
  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'User name', with: 'h' * 17
    fill_in 'Email', with: 'newuser@email.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 16 characters")
  end
end
