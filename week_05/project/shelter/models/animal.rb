require('pry')
require_relative('../db/sql_runner')
require_relative('../models/adoption')
require_relative('../models/owner')

class Animal

  attr_reader :id
  attr_accessor :name, :species, :breed, :gender, :age, :photo, :healthy, :safe, :adopted, :admission_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] if options['name']
    @species = options['species'] if options['species']
    @breed = options['breed'] if options['breed']
    @gender = options['gender'] if options['gender']
    @age = options['age'].to_i if options['age']
    @photo = options['photo'] if options['photo']
    @healthy = options['healthy'] if options['healthy']
    @safe = options['safe'] if options['safe']
    @adopted = options['adopted']
    @admission_date = options['admission_date']
  end

  def save()
    sql = "INSERT INTO animals (name, species, breed, gender, age, photo, healthy, safe, adopted, admission_date)
           VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
           RETURNING id"
    values = [@name, @species, @breed, @gender, @age, @photo, @healthy, @safe, @adopted, @admission_date]
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
               species = $2,
               breed = $3,
               gender = $4,
               age = $5,
               photo = $6,
               healthy = $7,
               safe = $8,
               adopted = $9,
               admission_date = $10
           WHERE id = $11"
    values = [@name, @species, @breed, @gender, @age, @photo, @healthy, @safe, @adopted, @admission_date, @id]
    SqlRunner.run(sql,values)
  end

  def adopted_by(owner)
    @adopted = true
    owner.seeks_pet = false
    adoption = Adoption.new({ "owner_id" => owner.id,
                              "animal_id" => @id,
                              "adoption_date" => DateTime.new(2018,2,18).to_s
                           })
    update()
    owner.update()
    adoption.save()
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
