feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'A user can see bookmarks' do
    # allow(Bookmark).to receive(:all).and_return(Bookmark.all('bookmark_manager_test'))
    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end