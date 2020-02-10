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

#EDIT
post '/tracks/:id' do
  @track = Track.new(params)
  @track.update()
  redirect to '/tracks'
end

#EDIT
get '/tracks/:id' do
  @tracks = Track.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  @track = Track.find(params['id'].to_i())
  erb(:"tracks/edit")
end
