require('pry')
require_relative('../db/sql_runner')

class Owner

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

  def save()
    sql = "INSERT INTO owners (first_name, last_name, telephone, email, address, postcode, species, breed, seeks_pet, registration_date)
           VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
           RETURNING id"
    values = [@first_name, @last_name, @telephone, @email, @address, @postcode, @species, @breed, @seeks_pet, @registration_date]
    save = SqlRunner.run(sql, values)
    @id = save.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE owners
           SET first_name = $1,
               last_name = $2,
               telephone = $3,
               email = $4,
               address = $5,
               postcode = $6,
               species = $7,
               breed = $8,
               seeks_pet = $9,
               registration_date = $10
           WHERE id = $11"
    values = [@first_name, @last_name, @telephone, @email, @address, @postcode, @species, @breed, @seeks_pet, @registration_date, @id]
    SqlRunner.run(sql,values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Owner.new(result)
  end

  def self.find_by_first_name(first_name)
    sql = "SELECT * FROM owners WHERE first_name = $1"
    values = [first_name]
    result = SqlRunner.run(sql, values).first()
    return Owner.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map { |result| Owner.new(result) }
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

end
