require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    @user = create(:user)
    sign_in_with @user
  end
  scenario 'Can create a post' do
    click_link 'New Post'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: "nom nom nom #coffeetime"
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
    expect(page).to have_content(@user.user_name)
  end

    it 'Post requires image' do
    click_link 'New Post'
    fill_in 'Caption', with: "no image!"
    click_button 'Create Post'
    expect(page).to have_content('Image required')
  end

end
