require('pry')
require_relative('../db/sql_runner')
require_relative('film')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_f
  end

  def decrease_funds(amount)
    @funds -= amount
    update()
  end

  def count_tickets()
    sql = "SELECT count(*) FROM tickets WHERE customer_id = $1"
    values = [@id]
    count = SqlRunner.run(sql, values)[0]["count"].to_i
    return count
  end

 # CREATE
  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    save = SqlRunner.run(sql, values)
    @id = save[0]['id'].to_i
  end

  # UPDATE
  def update()
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
           INNER JOIN tickets ON films.id = tickets.film_id
           WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql,values)
    return films.map { |film| Film.new(film) }
  end

  # DELETE
  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  # READ
  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

  def self.get_customer(name)
    sql = "SELECT * FROM customers WHERE name = $1"
    values = [name]
    customer = SqlRunner.run(sql, values)[0]
    return Customer.new(customer)
  end

end
