require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/events.rb')
require("pry-byebug")

get '/athletes' do
  @athletes = Athlete.all
  erb(:'athlete/index')
end

get '/athletes/new' do
  @nations = Nation.all
  erb(:'athlete/new')
end

get '/athletes/:id' do
  @athlete = Athlete.find(params[:id])
  @nations = Nation.find(params[:id])
  erb(:'athlete/show')
end

post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save()
  redirect to( '/athletes' )
end

get '/athletes/:id/edit' do
@athlete = Athlete.find( params[:id] )
@nations = Nation.all()
erb(:'athlete/edit' )
end

post '/athletes/:id' do
  Athlete.update( params )
  redirect to( "/athletes/#{params[:id]}" )
end


post '/athletes/:id/delete' do
  Athlete.destroy( params[:id] )
  redirect (to('/athletes'))
end
