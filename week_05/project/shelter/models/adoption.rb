require('pry')
require_relative('../db/sql_runner')

class Adoption

  attr_reader :id
  attr_accessor :animal_id, :owner_id, :adoption_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
    @adoption_date = options['adoption_date']
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id, adoption_date)
           VALUES ($1, $2, $3)
           RETURNING id"
    values = [@animal_id, @owner_id, @adoption_date]
    save = SqlRunner.run(sql, values)
    @id = save.first()['id'].to_i
  end

  # def delete()
  #   sql = "DELETE FROM owners WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql,values)
  # end
  #
  # def update()
  #   sql = "UPDATE owners
  #          SET first_name = $1,
  #              last_name = $2,
  #              telephone = $3,
  #              email = $4,
  #              address = $5,
  #              postcode = $6,
  #              species = $7,
  #              breed = $8,
  #              seeks_pet = $9,
  #              registration_date = $10
  #          WHERE id = $11"
  #   values = [@first_name, @last_name, @telephone, @email, @address, @postcode, @species, @breed, @seeks_pet, @registration_date, @id]
  #   SqlRunner.run(sql,values)
  # end

  def self.find_by_animal_id(id)
    sql = "SELECT * FROM adoptions WHERE animal_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Adoption.new(result)
  end

  def self.find_by_owner_id(id)
    sql = "SELECT * FROM adoptions WHERE owner_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Adoption.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run(sql)
    return results.map { |result| Adoption.new(result) }
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

end
