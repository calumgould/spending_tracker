require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/track')
require_relative('../models/category')
require_relative('../models/merchant')
also_reload('../models/*')

get '/tracks' do
  @tracks = Track.all()
  erb(:"tracks/index")
end
