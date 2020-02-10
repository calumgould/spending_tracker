require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget' )
also_reload( '../models/*' )

get '/budget' do
  @budget = Budget.all()
  erb(:"budget/index")
end

#EDIT
post '/budget/:id' do
  @budget = Budget.new(params)
  @budget.update()
  redirect '/budget'
end

#EDIT
get '/budget/:id/edit' do
  @budget = Budget.find(params[:id].to_i())
  erb(:"budget/edit")
end
