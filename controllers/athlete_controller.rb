require_relative('../models/athlete.rb')

get '/athletes' do
  @athletes = Athlete.all
  erb(:'athlete/index')
end

get '/athletes/new' do
  erb(:'athlete/new')
end

get '/athletes/:id' do
  @athlete = Athlete.find(params["id"])
  erb(:'athlete/show')
end

get '/athletes/:id/edit' do
end

post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save
  redirect to( "athletes" )
end

post '/athletes/:id' do
end

delete '/athletes' do
end