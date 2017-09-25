require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    user = create(:user)
    user_two = create(:user, email: 'user2@email.com', user_name: 'user2', id: user.id + 1)
    post = create(:post, user_id: user.id)
    post2 = create(:post, user_id: user_two.id)
    sign_in_with user

    visit '/'
  end
  scenario 'can edit a post as the owner' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit Post')
    click_link 'Edit Post'
    fill_in 'Caption', with: "OH NO"
    click_button 'Update Post'
    expect(page).to have_content('Post updated!')
    expect(page).to have_content('OH NO')
  end

  scenario "can't edit a post that doesn't belong to you via the show page" do
    find(:xpath, "//a[contains(@href,'posts/2')]").click
    expect(page).to_not have_content('Edit Post')
  end

  scenario "cannot edit a post that doesn't belong to you via url path" do
    visit "/posts/2/edit"
    expect(page.current_path).to eq root_path
    expect(page).to have_content("That post doesn't belong to you!")
  end

  it "won't update post without imaage" do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    attach_file('Image', "spec/files/images/coffee.zip")
    click_button 'Update Post'
    expect(page).to have_content("There's an error!")
  end

end
