require('pg')
require_relative('../db/sql_runner')


class Participation

  attr_reader :id, :athlete_id, :event_id

  def initialize( options )
    @id = options['id'].to_i
    @athlete_id = options['athlete_id'].to_i
    @event_id = options['event_id'].to_i
  end

  def save()
    sql = "INSERT INTO participation (athlete_id, event_id) VALUES (#{@athlete_id}, #{@event_id}) RETURNING *"
    participation = SqlRunner.run(sql).first
    @id = participation['id']
  end

  def self.all()
    sql = "SELECT * FROM participation"
    return Participation.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM participation"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    participation = SqlRunner.run(sql)
    result = participation.map { |item| Participation.new( item ) }
    return result
  end

  def self.map_item(sql)
    result = Participation.map_items(sql)
    return result.first
  end

end
