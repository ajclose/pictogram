require 'rails_helper.rb'

feature 'show individual post' do
  background do
    user = create(:user)
    sign_in_with user
  end
  scenario 'can click and view individual post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end

end
