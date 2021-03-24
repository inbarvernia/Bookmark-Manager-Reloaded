require 'bookmark'

describe Bookmark do
  let(:bookmarks) { Bookmark.all }
  describe '.all' do
    it 'returns all bookmarks' do

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end

  describe '.create' do 
    it 'creates a new bookmark' do 
      mark = Bookmark.create('http://twitter.com', 'Twitter')

      expect(bookmarks).to include('http://twitter.com')
    end 
  end 
end
