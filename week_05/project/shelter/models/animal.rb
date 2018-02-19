require('pry')
require_relative('../db/sql_runner')

class Animal

  attr_reader :id
  attr_accessor :name, :species_id, :breed_id, :gender, :age, :photo, :healthy, :safe, :adopted, :admission_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] if options['name']
    @species_id = options['species_id'].to_i if options['species_id']
    @breed_id = options['breed_id'].to_i if options['breed_id']
    @gender = options['gender'] if options['gender']
    @age = options['age'].to_i if options['age']
    @photo = options['photo'] if options['photo']
    @healthy = options['healthy'] if options['healthy']  # CAST TO BOOLEAN
    @safe = options['safe'] if options['safe']  # CAST TO BOOLEAN
    @adopted = options['adopted']  # CAST TO BOOLEAN
    @admission_date = options['admission_date']  # CAST TO DATE
  end

  def save()
    sql = "INSERT INTO animals (name, species_id, breed_id, gender, age, photo, healthy, safe, adopted, admission_date)
           VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
           RETURNING id"
    values = [@name, @species_id, @breed_id, @gender, @age, @photo, @healthy, @safe, @adopted, @admission_date]
    save = SqlRunner.run(sql, values)
    @id = save.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE animals
           SET name = $1,
               species_id = $2,
               breed_id = $3,
               gender = $4,
               age = $5,
               photo = $6,
               healthy = $7,
               safe = $8,
               adopted = $9,
               admission_date = $10
           WHERE id = $11"
    values = [@name, @species_id, @breed_id, @gender, @age, @photo, @healthy, @safe, @adopted, @admission_date, @id]
    SqlRunner.run(sql,values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Animal.new(result)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM animals WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql, values).first()
    return Animal.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map { |result| Animal.new(result) }
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

end
