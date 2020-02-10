require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#EDIT
post '/merchants/:id' do
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect '/merchants'
end

#EDIT
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i())
  erb(:"merchants/edit")
end
