require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require_relative('../models/participation.rb')
require_relative('../models/athlete.rb')
require("pry-byebug")

get '/events' do
  @events = Event.all
  erb(:'event/index')
end

get '/events/new' do
  @participation = Participation.all
  @athletes = Athlete.all
  erb(:'event/new')
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb(:'event/show')
end

post '/events' do
  @event = Event.new(params)
  @event.save()
  redirect to( '/events' )
end

get '/events/:id/edit' do
@event = Event.find( params[:id] )
@athletes = Athlete.all
erb(:'event/edit' )
end

post '/events/:id' do
  Event.update( params )
  redirect to( "/events/#{params[:id]}" )
end


post '/events/:id/delete' do
  Event.destroy( params[:id] )
  redirect (to('/events'))
end