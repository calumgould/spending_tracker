require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tracks_controller')

get '/' do
  erb(:index)
end