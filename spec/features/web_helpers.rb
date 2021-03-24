require 'pg'

def reset_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec("TRUNCATE TABLE bookmarks") 
  conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com'),('http://www.destroyallsoftware.com'),('http://www.google.com')")
end

