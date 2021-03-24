require 'pg'

class Bookmark
  def self.all
    @bookmarks = []
    db = (ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    @conn = PG.connect( dbname: db )
    @conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
         @bookmarks << "%s" %
          row.values_at('url', 'title')
      end
    end
    return @bookmarks
  end

  def self.create(url, title)
    db = (ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    @conn = PG.connect( dbname: db )
    @conn.exec( "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')" )
  end 
end
