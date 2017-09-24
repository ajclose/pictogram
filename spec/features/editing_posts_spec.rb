require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'can edit posts' do
    fill_in 'Caption', with: "OH NO"
    click_button 'Update Post'
    expect(page).to have_content('Post updated!')
    expect(page).to have_content('OH NO')
  end

end
