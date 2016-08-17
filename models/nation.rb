require('pg')
require_relative('../db/sql_runner')
require_relative('./athlete')

class Nation

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO nations (name) VALUES ('#{@name}') RETURNING *"
    nation = SqlRunner.run(sql).first
    @id = nation['id'].to_i
  end

  def athletes()
    sql = "SELECT * FROM athletes WHERE nation_id = #{@id}"
    return Athlete.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM nations"
    return Nation.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM nations WHERE id = #{id}"
    return Nation.map_item(sql)
  end

  def self.update( options )
    sql = "UPDATE nations SET
          name='#{options['name']}'
          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

  def self.destroy( id )
    sql = "DELETE FROM nations WHERE id=#{id}" 
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    nations = SqlRunner.run(sql)
    result = nations.map { |nation| Nation.new( nation ) }
    return result
  end

  def self.map_item(sql)
    result = Nation.map_items(sql)
    return result.first
  end

end

