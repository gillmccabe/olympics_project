require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require("pry-byebug")

get '/events' do
  @events = Event.all
  erb(:'event/index')
end

get '/events/new' do
  erb(:'event/new')
end

get '/nations/:id' do
  @nation = Nation.find(params[:id])
  erb(:'nation/show')
end

post '/nations' do
  @nation = Nation.new(params)
  @nation.save()
  redirect to( '/nations' )
end

get '/nations/:id/edit' do
@nation = Nation.find( params[:id] )
erb(:'nation/edit' )
end

post '/nations/:id' do
  Nation.update( params )
  redirect to( "/nations/#{params[:id]}" )
end


post '/nations/:id/delete' do
  Nation.destroy( params[:id] )
  redirect (to('/nations'))
end