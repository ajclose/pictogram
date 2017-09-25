require 'rails_helper.rb'

feature 'Displaying posts on the root page' do
  background do
    user = create(:user)
    sign_in_with user
  end
  scenario 'view posts' do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content('This is post one')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

end
