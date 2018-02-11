require('pry')
require_relative('../db/sql_runner')
require_relative('film')

class Screening

  attr_reader :id
  attr_accessor :start_time, :end_time, :film_id

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @film_id = options['film_id'].to_i
  end

 # CREATE
  def save()
    sql = "INSERT INTO screenings (start_time, end_time, film_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@start_time, @end_time, @film_id]
    save = SqlRunner.run(sql, values)
    @id = save[0]['id'].to_i
  end

  # UPDATE
  def update()
    sql = "UPDATE screenings SET start_time = $1, end_time = $2, film_id = $3 WHERE id = $4"
    values = [@start_time, @end_time, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  # READ
  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map { |screening| Screening.new(screening) }
  end

end
