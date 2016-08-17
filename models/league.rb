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

  def gold_medals_by_nation( nation_id )
    return athletes_by_nation( nation_id ).map { |athlete| athlete.gold_medals }.reduce(0) do | sum, n |
      sum + n
    end
  end

  def silver_medals_by_nation( nation_id )
    return athletes_by_nation( nation_id ).map { |athlete| athlete.silver_medals }.reduce(0) do | sum, n |
      sum + n
    end
  end

  def bronze_medals_by_nation( nation_id )
    return athletes_by_nation( nation_id ).map { |athlete| athlete.bronze_medals }.reduce(0) do | sum, n |
      sum + n
    end
  end

  def points_by_nation( nation_id )
    return athletes_by_nation( nation_id ).map { |athlete| athlete.total_points }.reduce(0) do | sum, n |
      sum + n
    end
  end



end