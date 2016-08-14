require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/nation.rb')
require_relative('../models/event.rb')
require_relative('../models/participation.rb')

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


event1 = Event.new({ 'name' => 'Tennis', 'gold_id' => athlete1.id, 'silver_id' => athlete2.id, 'bronze_id' => athlete3.id})
event2 = Event.new({ 'name' => 'Swimming', 'gold_id' => athlete4.id, 'silver_id' => athlete2.id, 'bronze_id' => athlete7.id})
event3 = Event.new({ 'name' => 'Athletics', 'gold_id' => athlete5.id, 'silver_id' => athlete1.id, 'bronze_id' => athlete8.id})

event1.save
event2.save
event3.save


participation1 = Participation.new({'athlete_id' => athlete1.id, 'event_id' => event1.id})
participation2 = Participation.new({'athlete_id' => athlete2.id, 'event_id' => event1.id})
participation3 = Participation.new({'athlete_id' => athlete3.id, 'event_id' => event1.id})
participation4 = Participation.new({'athlete_id' => athlete7.id, 'event_id' => event2.id})
participation5 = Participation.new({'athlete_id' => athlete5.id, 'event_id' => event2.id})
participation6 = Participation.new({'athlete_id' => athlete3.id, 'event_id' => event2.id})
participation7 = Participation.new({'athlete_id' => athlete6.id, 'event_id' => event2.id})
participation8 = Participation.new({'athlete_id' => athlete1.id, 'event_id' => event2.id})
participation9 = Participation.new({'athlete_id' => athlete2.id, 'event_id' => event3.id})
participation10 = Participation.new({'athlete_id' => athlete8.id, 'event_id' => event3.id})
participation11 = Participation.new({'athlete_id' => athlete3.id, 'event_id' => event3.id})
participation12 = Participation.new({'athlete_id' => athlete7.id, 'event_id' => event3.id})
participation13 = Participation.new({'athlete_id' => athlete1.id, 'event_id' => event3.id})
participation14 = Participation.new({'athlete_id' => athlete5.id, 'event_id' => event3.id})

participation1.save
participation2.save
participation3.save
participation4.save
participation5.save
participation6.save
participation7.save
participation8.save
participation9.save
participation10.save
participation11.save
participation12.save
participation13.save
participation14.save



binding.pry
nil
