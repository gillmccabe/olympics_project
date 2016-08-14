require('pg')
require_relative('../db/sql_runner')
require_relative('./nation')

class Athlete

  attr_reader :id, :name, :nation_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @nation_id = options['nation_id']
  end

  def save()
    sql = "INSERT INTO athletes (name, nation_id) VALUES ('#{@name}', '#{@nation_id}' ) RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
  end

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{ @nation_id }"
    nation_data = SqlRunner.run(sql).first
    result = Nation.new( nation_data )
    return result
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    return Athlete.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    return Athlete.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
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