require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    
    erb(:'bookmarks/index')
  end

  get '/create' do
    erb(:'bookmarks/create')
  end

  post '/bookmarks' do
    @new_bookmark = Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  run if app_file == $PROGRAM_NAME
end
