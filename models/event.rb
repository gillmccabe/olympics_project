require('pg')
require_relative('../db/sql_runner')
require_relative('./athlete')
require_relative('./event')

class Event

  attr_reader :id, :name, :gold_id, :silver_id, :bronze_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gold_id = options['gold_id'].to_i
    @silver_id = options['silver_id'].to_i
    @bronze_id = options['bronze_id'].to_i
  end

  def save()
    sql = "INSERT INTO events (name, gold_id, silver_id, bronze_id) VALUES ('#{@name}', '#{@gold_id}', '#{@silver_id}', '#{@bronze_id}' ) RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id']
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id = #{id}"
    return Event.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    events = SqlRunner.run(sql)
    result = events.map { || Event.new( events ) }
    return result
  end

  def self.map_item(sql)
    result = Event.map_items(sql)
    return result.first
  end

end