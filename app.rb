require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tracks_controller')
require_relative('controllers/budget_controller')
also_reload('models/*')

get '/' do
  erb(:index)
end

get '/new' do
  @tracks = Track.all()
  erb(:new)
end
