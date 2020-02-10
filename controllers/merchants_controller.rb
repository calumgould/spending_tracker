require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#NEW
get '/merchants/new' do
  @merchants = Merchant.all()
  erb(:"merchants/new")
end

#NEW
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect '/merchants'
end

#EDIT
post '/merchants/:id/' do
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect '/merchants'
end

#EDIT
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id].to_i())
  erb(:"merchants/edit")
end

#DELETE
post '/merchants/:id/delete' do
  merchant = Merchant.find(params[:id].to_i())
  merchant.delete()
  redirect '/merchants'
end
