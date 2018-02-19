require('pry')
require_relative('../db/sql_runner')

class Owner

  # CREATE TABLE owners (
  #   id              SERIAL PRIMARY KEY,
  #   first_name      VARCHAR(255) NOT NULL,
  #   last_name       VARCHAR(255) NOT NULL,
  #   telephone       INT NOT NULL,
  #   email           VARCHAR(255),
  #   address         VARCHAR(255),
  #   postcode        VARCHAR(255),
  #   species         species_type,
  #   breed           VARCHAR(255),
  #   seeks_pet       BOOLEAN NOT NULL,
  #   registration_date DATE NOT NULL
  # );


  attr_reader :id
  attr_accessor :first_name, :last_name, :telephone, :email, :address, :postcode, :species, :breed, :seeks_pet, :registration_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @telephone = options['telephone']
    @email = options['email'] if options['email']
    @address = options['address'] if options['address']
    @postcode = options['postcode'] if options['postcode']
    @species = options['species'] if options['species']
    @breed = options['breed'] if options['breed']
    @seeks_pet = options['seeks_pet']
    @registration_date = options['registration_date']
  end

  # def save()
  #   sql = "INSERT INTO animals (name, species, breed, gender, age, photo, healthy, safe, adopted, admission_date)
  #          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
  #          RETURNING id"
  #   values = [@name, @species, @breed, @gender, @age, @photo, @healthy, @safe, @adopted, @admission_date]
  #   save = SqlRunner.run(sql, values)
  #   @id = save.first()['id'].to_i
  # end
  #
  # def delete()
  #   sql = "DELETE FROM animals WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql,values)
  # end
  #
  # def update()
  #   sql = "UPDATE animals
  #          SET name = $1,
  #              species = $2,
  #              breed = $3,
  #              gender = $4,
  #              age = $5,
  #              photo = $6,
  #              healthy = $7,
  #              safe = $8,
  #              adopted = $9,
  #              admission_date = $10
  #          WHERE id = $11"
  #   values = [@name, @species, @breed, @gender, @age, @photo, @healthy, @safe, @adopted, @admission_date, @id]
  #   SqlRunner.run(sql,values)
  # end
  #
  # def self.find_by_id(id)
  #   sql = "SELECT * FROM animals WHERE id = $1"
  #   values = [id]
  #   result = SqlRunner.run(sql, values).first()
  #   return Animal.new(result)
  # end
  #
  # def self.find_by_name(name)
  #   sql = "SELECT * FROM animals WHERE name = $1"
  #   values = [name]
  #   result = SqlRunner.run(sql, values).first()
  #   return Animal.new(result)
  # end
  #
  # def self.find_all()
  #   sql = "SELECT * FROM animals"
  #   results = SqlRunner.run(sql)
  #   return results.map { |result| Animal.new(result) }
  # end
  #
  # def self.delete_all()
  #   sql = "DELETE FROM animals"
  #   SqlRunner.run(sql)
  # end

end
