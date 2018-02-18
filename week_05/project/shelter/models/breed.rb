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

  def self.delete_all()
    sql = "DELETE FROM breeds"
    SqlRunner.run(sql)
  end

end
