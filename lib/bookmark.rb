require 'pg'

class Bookmark
  def self.all
    @bookmarks = []
    db = (ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    conn = PG.connect( dbname: db )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      @bookmarks << "URL"
      result.each do |row|
         @bookmarks << "%s" %
          row.values_at('url')
      end
    end
    return @bookmarks
  end
end
