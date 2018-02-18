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

end
