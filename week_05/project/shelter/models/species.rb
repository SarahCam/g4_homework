require('pry')
require_relative('../db/sql_runner')

class Species

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO species (name) VALUES ($1) RETURNING id"
    values = [@name]
    save = SqlRunner.run(sql, values)
    @id = save.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM species WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE species SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql,values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM species WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Species.new(result)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM species WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql, values).first()
    return Species.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM species"
    SqlRunner.run(sql)
  end

end
