require('pry')
require_relative('../db/sql_runner')

class Species

  attr_reader :id, :name

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

end
