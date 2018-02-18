require('pry')
require_relative('../db/sql_runner')

class Breed

  attr_reader :id
  attr_accessor :name, :species_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species_id = options['species_id']
  end

  def save()
    sql = "INSERT INTO breeds (name, species_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @species_id]
    save = SqlRunner.run(sql, values)
    @id = save.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM breeds WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE breeds SET name = $1, species_id = $2 WHERE id = $3"
    values = [@name, @species_id, @id]
    SqlRunner.run(sql,values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM breeds WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Species.new(result)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM breeds WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql, values).first()
    return Species.new(result)
  end


  def self.delete_all()
    sql = "DELETE FROM breeds"
    SqlRunner.run(sql)
  end

end
