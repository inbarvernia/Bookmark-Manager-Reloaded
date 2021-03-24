require 'pg'

def reset_test_database
  conn = PG.connect( dbname: ENV['BOOKMARK_DATABASE'])
  conn.exec("TRUNCATE TABLE bookmarks") 
  Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
  Bookmark.create('http://www.destroyallsoftware.com', 'Destroy All Sofware')
  Bookmark.create('http://www.google.com', 'Google')
end
