require( 'sinatra' )
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tracks_controller')
require_relative('controllers/budget_controller')
also_reload('models/*')


  get '/' do
    erb(:index)
  end
