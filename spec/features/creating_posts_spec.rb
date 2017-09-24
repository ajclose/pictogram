require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'Can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: "nom nom nom #coffeetime"
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

    it 'Post requires image' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "no image!"
    click_button 'Create Post'
    expect(page).to have_content('Image required')
  end

end
