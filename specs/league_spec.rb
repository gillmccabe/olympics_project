require( 'minitest/autorun' )
require('pry-byebug')
require_relative( '../models/athlete' )
require_relative( '../models/nation' )
require_relative( '../models/event' )


class TestLeague < Minitest::Test

  def setup

    @nation1 = Nation.new({ 'name' => 'UK'})
    @nation1.id = 1
    @nation2 = Nation.new({ 'name' => 'France'})
    @nation2.id = 2
    @nation3 = Nation.new({ 'name' => 'Spain'})
    @nation3.id = 3
    @nation4 = Nation.new({ 'name' => 'USA'})
    @nation4.id = 4
    
    @athlete1 = Athlete.new({ 'name' => 'Andy Murray', 'nation_id' => @nation1.id})
    @athlete2 = Athlete.new({ 'name' => 'Laura Trott', 'nation_id' => @nation1.id})
    @athlete3 = Athlete.new({ 'name' => 'Jo-Wilfried Tsonga', 'nation_id' => @nation2.id})
    @athlete4 = Athlete.new({ 'name' => 'Floria Guei', 'nation_id' => @nation2.id})
    @athlete5 = Athlete.new({ 'name' => 'Rafael Nadal', 'nation_id' => @nation3.id})
    @athlete6 = Athlete.new({ 'name' => 'Ruth Beitia', 'nation_id' => @nation3.id})
    @athlete7 = Athlete.new({ 'name' => 'Michael Phelps', 'nation_id' => @nation4.id})
    @athlete8 = Athlete.new({ 'name' => 'Serena Williams', 'nation_id' => @nation4.id})

    @event1 = Event.new({ 'name' => 'Tennis', 'gold_id' => @athlete1.id, 'silver_id' => @athlete2.id, 'bronze_id' => @athlete3.id})
    @event2 = Event.new({ 'name' => 'Swimming', 'gold_id' => @athlete4.id, 'silver_id' => @athlete2.id, 'bronze_id' => @athlete7.id})
    @event3 = Event.new({ 'name' => 'Athletics', 'gold_id' => @athlete5.id, 'silver_id' => @athlete1.id, 'bronze_id' => @athlete8.id})

    nations = [@nation1, @nation2, @nation3, @nation4]
    athletes = [@athlete1, @athlete2, @athlete3, @athlete4, @athlete5, @athlete6, @athlete7, @athlete8]
    events = [@event1, @event2, @event3]

    @league = League.new(nations, athletes, events)

  end

  def test_nations_gold_medals(1)
    assert_equal(1, @league.nations_gold_medals)
  end
