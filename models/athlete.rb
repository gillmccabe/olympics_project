require('pg')
require_relative('../db/sql_runner')
require_relative('./nation')
require_relative('./event')

class Athlete

  attr_accessor :id, :name, :nation_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @nation_id = options['nation_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (name, nation_id) VALUES ('#{@name}', '#{@nation_id}' ) RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id'].to_i
  end

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{ @nation_id }"
    nation_data = SqlRunner.run(sql).first
    result = Nation.new( nation_data )
    return result
  end

  def events()
    sql = "SELECT e.* FROM events e INNER JOIN participation p ON e.id = p.event_id WHERE p.athlete_id = #{id} "
    events =  SqlRunner.run(sql)
    result = events.map { |event| Event.new(event) }
    return result
  end

  def gold_medals()
    sql = "SELECT * FROM events WHERE gold_id = #{id}"
    gold_medals = SqlRunner.run(sql)
    result = gold_medals.count
    return result
  end

  def silver_medals()
    sql = "SELECT * FROM events WHERE silver_id = #{id}"
    silver_medals = SqlRunner.run(sql)
    result = silver_medals.count
    return result
  end

  def bronze_medals()
    sql = "SELECT * FROM events WHERE bronze_id = #{id}"
    bronze_medals = SqlRunner.run(sql)
    result = bronze_medals.count
    return result
  end

  def total_points()
    return (gold_medals * 5) + (silver_medals * 3) + (bronze_medals * 1)
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    return Athlete.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    Athlete.map_item(sql)
  end

  def self.find_medal(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    result = Athlete.map_item(sql)
    return result.name
  end

  def self.find_name(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    result = Athlete.map_item(sql)
    return result.name
  end

  def self.update( options )
    sql = "UPDATE athletes SET
          name='#{options['name']}',
          nation_id='#{options['nation_id']}'
          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM athletes WHERE id=#{id}" 
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    athletes = SqlRunner.run(sql)
    result = athletes.map { |athlete| Athlete.new( athlete ) }
    return result
  end

  def self.map_item(sql)
    result = Athlete.map_items(sql)
    return result.first
  end

end