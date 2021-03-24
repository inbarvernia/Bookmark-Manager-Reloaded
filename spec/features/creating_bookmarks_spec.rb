feature 'Creating Bookmarks' do
  scenario 'User enters new bookmark to add' do
    visit('/bookmarks')
    click_on('New Bookmark')
    fill_in('url', with: 'http://http.cat')
    click_on('submit')
    expect(page).to have_content('http://http.cat')
  end
end
