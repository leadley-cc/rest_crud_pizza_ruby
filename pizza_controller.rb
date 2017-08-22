require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/pizza' )
also_reload( 'models/*' )

# Index route
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

# Menu route
get '/pizzas/menu' do
  @toppings = Pizza.toppings
  erb(:menu)
end

# About route
get '/pizzas/about' do
  @toppings = Pizza.toppings
  erb(:about)
end

# New route
get '/pizzas/new' do
  @toppings = Pizza.toppings
  erb(:new)
end

# Show route
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

# Create route
post '/pizzas' do
  pizza = Pizza.new(params)
  pizza.save
  redirect to "/pizzas/#{pizza.id}"
end

# Edit route
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  @toppings = Pizza.toppings
  erb(:edit)
end

# Update route
post '/pizzas/:id' do
  pizza = Pizza.new(params)
  pizza.update
  redirect to "/pizzas/#{pizza.id}"
end

# Destroy route
post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  erb(:destroy)
end
