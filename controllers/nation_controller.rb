require_relative('../models/nation.rb')
require_relative('../models/athlete.rb')
require_relative('../models/league.rb')
require_relative('../models/event.rb')
require("pry-byebug")

get '/nations' do
  @nations = Nation.all
  erb(:'nation/index')
end

get '/nations/new' do
  erb(:'nation/new')
end

get '/nations/:id' do
  @nation = Nation.find(params[:id])
  @league = League.new( Nation.all, Athlete.all, Event.all )
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