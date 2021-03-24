require 'pg'

class Bookmark

  attr_reader :id, :url, :title 

  def initialize(url, title, id)
    @id = id 
    @url = url 
    @title = title
  end 

  def self.all
    db = (ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    @conn = PG.connect( dbname: db )
    result = @conn.exec( "SELECT * FROM bookmarks" ) 
    result.map do |bookmark|
        Bookmark.new(bookmark['url'], bookmark['title'], bookmark['id'])
    end
 end


  def self.create(url, title, id)
    db = (ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    @conn = PG.connect( dbname: db )
    result = @conn.exec( "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')" )
    Bookmark.new(url, title, id)
  end 
end
