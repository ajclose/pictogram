require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    user = create(:user)
    sign_in_with user
    post = create(:post, caption: "Delete this!", user_id: user.id)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content("Post deleted!")
    expect(page).to_not have_content("Delete this!")
  end

end
