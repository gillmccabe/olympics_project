require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/event.rb')

Nation.delete_all()
Athlete.delete_all()
Event.delete_all()


nation1 = Nation.new({ 'name' => 'UK'})
nation2 = Nation.new({ 'name' => 'France'})
nation3 = Nation.new({ 'name' => 'Spain'})
nation4 = Nation.new({ 'name' => 'USA'})

nation1.save
nation2.save
nation3.save
nation4.save


athlete1 = Athlete.new({ 'name' => 'Andy Murray', 'nation_id' => nation1.id})
athlete2 = Athlete.new({ 'name' => 'Laura Trott', 'nation_id' => nation1.id})
athlete3 = Athlete.new({ 'name' => 'Jo-Wilfried Tsonga', 'nation_id' => nation2.id})
athlete4 = Athlete.new({ 'name' => 'Floria Guei', 'nation_id' => nation2.id})
athlete5 = Athlete.new({ 'name' => 'Rafael Nadal', 'nation_id' => nation3.id})
athlete6 = Athlete.new({ 'name' => 'Ruth Beitia', 'nation_id' => nation3.id})
athlete7 = Athlete.new({ 'name' => 'Michael Phelps', 'nation_id' => nation4.id})
athlete8 = Athlete.new({ 'name' => 'Serena Williams', 'nation_id' => nation4.id})


athlete1.save
athlete2.save
athlete3.save
athlete4.save
athlete5.save
athlete6.save
athlete7.save
athlete8.save






binding.pry
nil
