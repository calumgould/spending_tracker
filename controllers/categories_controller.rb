require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category' )
also_reload( '../models/*' )

get '/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

#EDIT
post '/categories/:id' do
  @category = Category.new(params)
  @category.update()
  redirect '/categories'
end

#EDIT
get '/categories/:id' do
  @category = Category.find(params['id'].to_i())
  erb(:"categories/edit")
end
