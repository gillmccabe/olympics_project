require 'pry-byebug'

class League

  attr_accessor :nations, :athletes, :events

  def initialize(nations, athletes, events)
    @nations = nations
    @athletes = athletes
    @events = events
  end

  def athletes_by_nation( nation_id )
    return @athletes.select { |athlete| athlete.nation_id == nation_id }
  end

  def silver_medals_by_nation( nation_id )
    return athletes_by_nation( nation_id ).map { |athlete| athlete.silver_medals }.reduce(0) do | sum, n |
      sum + n
    end
  end



#write three seperate methods to check gold/silver/bronze medals for each nation

#write method to check total points for each nation


end